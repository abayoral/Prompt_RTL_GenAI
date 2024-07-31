// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // Both multiplier variants
  // Results that become intermediate value depending on whether mul or div is being calculated
  // Raw output of MAC calculation
  // Divider signals
  // Used for SVA purposes, no functional relevance
  // Intermediate value register shared with ALU
  // The single cycle multiplier uses three 17 bit multipliers to compute MUL instructions in a
  // single cycle and MULH instructions in two cycles.
    // The first two multipliers are only used in state 1 (MULL). We can assign them statically.
    // al*bl
    // al*bh
    // used in MULH
      // Default values == MULL
      // ah*bl
      // mac_res = A*B[47:16], mult1_res = A*B[15:0]
          // ah*bh
    // States must be knwon/valid.
  // The fast multiplier uses one 17 bit multiplier to compute MUL instructions in 3 cycles
  // and MULH instructions in 4 cycles.
    // The 2 MSBs of mac_res_ext (mac_res_ext[34:33]) are always equal since:
    // 1. The 2 MSBs of the multiplicants are always equal, and
    // 2. The 16 MSBs of the addend (accum[33:18]) are always equal.
    // Thus, it is safe to ignore mac_res_ext[34].
          // al*bl
          // al*bh<<16
          // result of AL*BL (in imd_val_q_i[0]) always unsigned with no carry
            // MD_OP_MULH
          // ah*bl<<16
            // Note no state transition will occur if mult_hold is set
          // only MD_OP_MULH here
          // ah*bh
          // result of AH*BL is not signed only if signed_mode_i == 2'b00
          // Note no state transition will occur if mult_hold is set
    // States must be knwon/valid.
  // Divider
  // The adder in the ALU computes alu_operand_a_o + alu_operand_b_o which means
  // Remainder - Divisor. If Remainder - Divisor >= 0, is_greater_equal is equal to 1,
  // the next Remainder is Remainder - Divisor contained in res_adder_h and the
          // Check if the Denominator is 0
          // quotient for division by 0 is specified to be -1
          // Note with data-independent time option, the full divide operation will proceed as
          // normal and will naturally return -1
          // SEC_CM: CORE.DATA_REG_SW.SCA
          // Record that this is a div by zero to stop the sign change at the end of the
          // division (in data_ind_timing mode).
          // Check if the Denominator is 0
          // remainder for division by 0 is specified to be the numerator (operand a)
          // Note with data-independent time option, the full divide operation will proceed as
          // normal and will naturally return operand a
          // SEC_CM: CORE.DATA_REG_SW.SCA
        // 0 - B = 0 iff B == 0
        // quotient
        // A abs value
        // ABS(A) = 0 - A
        // remainder
        // B abs value
        // ABS(B) = 0 - B
        // Division
          // this time we save the quotient in op_remainder_d (i.e. imd_val_q_i[0]) since
          // we do not need anymore the remainder
          // this time we do not save the quotient anymore since we need only the remainder
        // Division
        // ABS(Quotient) = 0 - Quotient (or Remainder)
        // Hold result until ID stage is ready to accept it
        // Note no state transition will occur if div_hold is set
  // States must be knwon/valid.
  // This is intended to be accessed via hierarchal references so isn't output from this module nor
  // used in any logic in this module
  // Mark the sva_fsm_idle as unused to avoid lint issues

module ibex_multdiv_fast #(
  parameter ibex_pkg::rv32m_e RV32M = ibex_pkg::RV32MFast
  ) (
  input  logic             clk_i,
  input  logic             rst_ni,
  input  logic             mult_en_i,  // dynamic enable signal, for FSM control
  input  logic             div_en_i,   // dynamic enable signal, for FSM control
  input  logic             mult_sel_i, // static decoder output, for data muxes
  input  logic             div_sel_i,  // static decoder output, for data muxes
  input  ibex_pkg::md_op_e operator_i,
  input  logic  [1:0]      signed_mode_i,
  input  logic [31:0]      op_a_i,
  input  logic [31:0]      op_b_i,
  input  logic [33:0]      alu_adder_ext_i,
  input  logic [31:0]      alu_adder_i,
  input  logic             equal_to_zero_i,
  input  logic             data_ind_timing_i,

  output logic [32:0]      alu_operand_a_o,
  output logic [32:0]      alu_operand_b_o,

  input  logic [33:0]      imd_val_q_i[2],
  output logic [33:0]      imd_val_d_o[2],
  output logic [1:0]       imd_val_we_o,

  input  logic             multdiv_ready_id_i,

  output logic [31:0]      multdiv_result_o,
  output logic             valid_o
);
