// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // Source/Destination register instruction index
  // To help timing the flops containing the current instruction are replicated to reduce fan-out.
  // instr_alu is used to determine the ALU control logic and associated operand/imm select signals
  // as the ALU is often on the more critical timing paths. instr is used for everything else.
  //////////////////////////////////////
  // Register and immediate selection //
  //////////////////////////////////////
  // immediate extraction and sign extension
  // immediate for CSR manipulation (zero extended)
    // the use of rs3 is known one cycle ahead.
    // Clock and reset unused when there's no rs3 flop
    // always zero
  // source registers
  // destination register
  ////////////////////
  // Register check //
  ////////////////////
  ///////////////////////
  // CSR operand check //
  ///////////////////////
    // CSRRSI/CSRRCI must not write 0 to CSRs (uimm[4:0]=='0)
    // CSRRS/CSRRC must not write from x0 to CSRs (rs1=='0)
  /////////////
  // Decoder //
  /////////////
      ///////////
      // Jumps //
      ///////////
          // Calculate jump target (and store PC + 4 if BranchTargetALU is configured)
          // Calculate and store PC+4
          // Calculate jump target (and store PC + 4 if BranchTargetALU is configured)
          // Calculate and store PC+4
        // Check branch condition selection
      ////////////////
      // Load/store //
      ////////////////
        // store size
        // sign/zero extension
        // load size
      /////////
      // ALU //
      /////////
            // RV32I ALU operations
            // RV32B zba
            // RV32B zbb
            // RV32B zbs
            // RV32B zbf
            // RV32B zbp
            // RV32B zbc
            // RV32B zbe
            // RV32M instructions
      /////////////
      // Special //
      /////////////
            // FENCE is treated as a NOP since all memory operations are already strictly ordered.
            // FENCE.I is implemented as a jump to the next PC, this gives the required flushing
            // behaviour (iside prefetch buffer flushed and response to any outstanding iside
            // requests will be ignored).
            // If present, the ICache will also be flushed.
          // non CSR related SYSTEM instructions
              // environment (system) call
              // debugger trap
          // rs1 and rd must be 0
          // instruction to read/modify CSR
    // make sure illegal compressed instructions cause illegal instruction exceptions
    // make sure illegal instructions detected in the decoder do not propagate from decoder
    // into register file, LSU, EX, WB, CSRs, PC
    // NOTE: instructions can also be detected to be illegal inside the CSRs (upon accesses with
    // insufficient privileges), or when accessing non-available registers in RV32E,
    // these cases are not handled here
  /////////////////////////////
  // Decoder for ALU control //
  /////////////////////////////
      ///////////
      // Jumps //
      ///////////
        // Jumps take two cycles without the BTALU
          // Calculate jump target
          // Calculate and store PC+4
        // Jumps take two cycles without the BTALU
          // Calculate jump target
          // Calculate and store PC+4
        // Check branch condition selection
          // Not-taken branch will jump to next instruction (used in secure mode)
        // Without branch target ALU, a branch is a two-stage operation using the Main ALU in both
        // stages
          // First evaluate the branch condition
          // Then calculate jump target
          // Not-taken branch will jump to next instruction (used in secure mode)
      ////////////////
      // Load/store //
      ////////////////
          // offset from immediate
        // offset from immediate
      /////////
      // ALU //
      /////////
                // Shift Left Ones by Immediate
                // Shuffle with Immediate Control Value
                  // Shift Right Ones by Immediate
                  // Unshuffle with Immediate Control Value
            // RV32I ALU operations
            // RV32B ALU Operations
            // RV32B zba
            // RV32B zbs
            // RV32B zbf
            // RV32B zbp
            // RV32B zbc
            // RV32B zbe
            // RV32M instructions, all use the same ALU operation
      /////////////
      // Special //
      /////////////
            // FENCE is treated as a NOP since all memory operations are already strictly ordered.
            // FENCE.I will flush the IF stage, prefetch buffer and ICache if present.
          // non CSR related SYSTEM instructions
          // instruction to read/modify CSR
            // rs1 field is used as immediate
  // do not enable multdiv in case of illegal instruction exceptions
  // make sure instructions accessing non-available registers in RV32E cause illegal
  // instruction exceptions
  // do not propgate regfile write enable if non-available registers are accessed in RV32E
  // Not all bits are used
  ////////////////
  // Assertions //
  ////////////////
  // Selectors must be known/valid.

module ibex_decoder #(
  parameter bit RV32E               = 0,
  parameter ibex_pkg::rv32m_e RV32M = ibex_pkg::RV32MFast,
  parameter ibex_pkg::rv32b_e RV32B = ibex_pkg::RV32BNone,
  parameter bit BranchTargetALU     = 0
) (
  input  logic                 clk_i,
  input  logic                 rst_ni,

  // to/from controller
  output logic                 illegal_insn_o,        // illegal instr encountered
  output logic                 ebrk_insn_o,           // trap instr encountered
  output logic                 mret_insn_o,           // return from exception instr
                                                      // encountered
  output logic                 dret_insn_o,           // return from debug instr encountered
  output logic                 ecall_insn_o,          // syscall instr encountered
  output logic                 wfi_insn_o,            // wait for interrupt instr encountered
  output logic                 jump_set_o,            // jump taken set signal
  input  logic                 branch_taken_i,        // registered branch decision
  output logic                 icache_inval_o,

  // from IF-ID pipeline register
  input  logic                 instr_first_cycle_i,   // instruction read is in its first cycle
  input  logic [31:0]          instr_rdata_i,         // instruction read from memory/cache
  input  logic [31:0]          instr_rdata_alu_i,     // instruction read from memory/cache
                                                      // replicated to ease fan-out)

  input  logic                 illegal_c_insn_i,      // compressed instruction decode failed

  // immediates
  output ibex_pkg::imm_a_sel_e  imm_a_mux_sel_o,       // immediate selection for operand a
  output ibex_pkg::imm_b_sel_e  imm_b_mux_sel_o,       // immediate selection for operand b
  output ibex_pkg::op_a_sel_e   bt_a_mux_sel_o,        // branch target selection operand a
  output ibex_pkg::imm_b_sel_e  bt_b_mux_sel_o,        // branch target selection operand b
  output logic [31:0]           imm_i_type_o,
  output logic [31:0]           imm_s_type_o,
  output logic [31:0]           imm_b_type_o,
  output logic [31:0]           imm_u_type_o,
  output logic [31:0]           imm_j_type_o,
  output logic [31:0]           zimm_rs1_type_o,

  // register file
  output ibex_pkg::rf_wd_sel_e rf_wdata_sel_o,   // RF write data selection
  output logic                 rf_we_o,          // write enable for regfile
  output logic [4:0]           rf_raddr_a_o,
  output logic [4:0]           rf_raddr_b_o,
  output logic [4:0]           rf_waddr_o,
  output logic                 rf_ren_a_o,          // Instruction reads from RF addr A
  output logic                 rf_ren_b_o,          // Instruction reads from RF addr B

  // ALU
  output ibex_pkg::alu_op_e    alu_operator_o,        // ALU operation selection
  output ibex_pkg::op_a_sel_e  alu_op_a_mux_sel_o,    // operand a selection: reg value, PC,
                                                      // immediate or zero
  output ibex_pkg::op_b_sel_e  alu_op_b_mux_sel_o,    // operand b selection: reg value or
                                                      // immediate
  output logic                 alu_multicycle_o,      // ternary bitmanip instruction

  // MULT & DIV
  output logic                 mult_en_o,             // perform integer multiplication
  output logic                 div_en_o,              // perform integer division or remainder
  output logic                 mult_sel_o,            // as above but static, for data muxes
  output logic                 div_sel_o,             // as above but static, for data muxes

  output ibex_pkg::md_op_e     multdiv_operator_o,
  output logic [1:0]           multdiv_signed_mode_o,

  // CSRs
  output logic                 csr_access_o,          // access to CSR
  output ibex_pkg::csr_op_e    csr_op_o,              // operation to perform on CSR

  // LSU
  output logic                 data_req_o,            // start transaction to data memory
  output logic                 data_we_o,             // write enable
  output logic [1:0]           data_type_o,           // size of transaction: byte, half
                                                      // word or word
  output logic                 data_sign_extension_o, // sign extension for data read from
                                                      // memory

  // jump/branches
  output logic                 jump_in_dec_o,         // jump is being calculated in ALU
  output logic                 branch_in_dec_o
);
