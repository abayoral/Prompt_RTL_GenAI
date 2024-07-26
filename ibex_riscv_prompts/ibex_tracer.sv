// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // These signals are part of RVFI, but not used in this module currently.
  // Keep them as part of the interface to change the tracer more easily in the future. Assigning
  // these signals to unused_* signals marks them explicitly as unused, an annotation picked up by
  // linters, including Verilator lint.
  // Data items accessed during this instruction
    // Write compressed instructions as four hex digits (16 bit word), and
    // uncompressed ones as 8 hex digits (32 bit words).
  // Format register address with "x" prefix, left-aligned to a fixed width of 3 characters.
  // Get a CSR name for a CSR address.
    // SLLI, SRLI, SRAI, SROI, SLOI, RORI
    // fsri
    // JALR
    // JAL
    // We cannot use rvfi_pc_wdata for conditional jumps.
        // C.JALR
        // C.JR
    // C.ADDI4SPN
      // C.BNEZ and C.BEQZ
      // We cannot use rvfi_pc_wdata for conditional jumps.
      // C.ANDI
      // C.JAL
      // C.LW
      // C.LWSP
      // C.SW
      // C.SWSP
      // regular store
  // cycle counter
  // close output file for writing
      // This dance with "fh" is a bit silly. Some versions of Verilator treat a call of $fclose(xx)
      // as a blocking assignment to xx. They then complain about the mixture with that an the
      // non-blocking assignment we use when opening the file. The bug is fixed with recent versions
      // of Verilator, but this hack is probably worth it for now.
  // log execution
    // Check for compressed instructions
      // Separate case to avoid overlapping decoding
          // C0 Opcodes
              // Align with pseudo-mnemonic used by GNU binutils and LLVM's MC layer
          // C1 Opcodes
            // These two instructions share opcode
          // C2 Opcodes
        // Regular opcodes
        // BRANCH
        // OPIMM
            // TODO: objdump doesn't decode this as nop currently, even though it would be helpful
            // Decide what to do here: diverge from objdump, or make the trace less readable to
            // users.
            //decode_mnemonic("nop");
        // Unlike the ratified v.1.0.0 bitmanip extension, the v.0.94 draft extension continues to
        // define the pseudo-instruction
        //   zext.b rd rs = andi rd, rs, 255.
        // However, for now the tracer doesn't emit this due to a lack of support in the LLVM and
        // GCC toolchains. Enabling this functionality when the time is right is tracked in
        // https://github.com/lowRISC/ibex/issues/1228
        // INSN_ANDI:begin
          // casez (rvfi_insn)
            // INSN_ZEXTB:  decode_r1_insn("zext.b");
            // default:     decode_i_insn("andi");
          // endcase
        // end
        // OP
        // SYSTEM (CSR manipulation)
        // SYSTEM (others)
        // RV32M
        // LOAD & STORE
        // MISC-MEM
        // RV32B - ZBA
        // RV32B - ZBB
        // The ratified v.1.0.0 bitmanip extension defines the pseudo-instruction
        //   zext.h rd rs = pack rd, rs, zero.
        // However, for now the tracer doesn't emit this due to a lack of support in the LLVM and
        // GCC toolchains. Enabling this functionality when the time is right is tracked in
        // https://github.com/lowRISC/ibex/issues/1228
        // INSN_PACK: begin
          // casez (rvfi_insn)
            // INSN_ZEXTH:  decode_r1_insn("zext.h");
            // default:     decode_r_insn("pack");
          // endcase
        // end
        // RV32B - ZBS
        // RV32B - ZBE
        // RV32B - ZBP
        // RV32B - ZBT
        // RV32B - ZBF
        // RV32B - ZBC
        // RV32B - ZBR

module ibex_tracer (
  input logic        clk_i,
  input logic        rst_ni,

  input logic [31:0] hart_id_i,

  // RVFI as described at https://github.com/SymbioticEDA/riscv-formal/blob/master/docs/rvfi.md
  // The standard interface does not have _i/_o suffixes. For consistency with the standard the
  // signals in this module don't have the suffixes either.
  input logic        rvfi_valid,
  input logic [63:0] rvfi_order,
  input logic [31:0] rvfi_insn,
  input logic        rvfi_trap,
  input logic        rvfi_halt,
  input logic        rvfi_intr,
  input logic [ 1:0] rvfi_mode,
  input logic [ 1:0] rvfi_ixl,
  input logic [ 4:0] rvfi_rs1_addr,
  input logic [ 4:0] rvfi_rs2_addr,
  input logic [ 4:0] rvfi_rs3_addr,
  input logic [31:0] rvfi_rs1_rdata,
  input logic [31:0] rvfi_rs2_rdata,
  input logic [31:0] rvfi_rs3_rdata,
  input logic [ 4:0] rvfi_rd_addr,
  input logic [31:0] rvfi_rd_wdata,
  input logic [31:0] rvfi_pc_rdata,
  input logic [31:0] rvfi_pc_wdata,
  input logic [31:0] rvfi_mem_addr,
  input logic [ 3:0] rvfi_mem_rmask,
  input logic [ 3:0] rvfi_mem_wmask,
  input logic [31:0] rvfi_mem_rdata,
  input logic [31:0] rvfi_mem_wdata
);
