// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
   // (accum_window_q + op_a_shift_q)
   // (accum_window_q + op_a_shift_q)>>1
  /////////////////////
  // ALU Operand MUX //
  /////////////////////
  // Intermediate value register shared with ALU
            // 0 - B = 0 iff B == 0
            // ABS(A) = 0 - A
            // ABS(B) = 0 - B
            // ABS(Quotient) = 0 - Quotient (or Reminder)
            // Division
  // Multiplier partial product calculation
  // Sign extend the input operands
  // Divider calculations
  // The adder in the ALU computes Remainder - Divisor. If Remainder - Divisor >= 0,
  // is_greater_equal is true, the next Remainder is the subtraction result and the Quotient
  // multdiv_count_q-th bit is set to 1.
              // Proceed with multiplication by 0/1 in data-independent time mode
              // SEC_CM: CORE.DATA_REG_SW.SCA
              // Check if the denominator is 0
              // quotient for division by 0 is specified to be -1
              // Note with data-independent time option, the full divide operation will proceed as
              // normal and will naturally return -1
              // SEC_CM: CORE.DATA_REG_SW.SCA
              // Record that this is a div by zero to stop the sign change at the end of the
              // division (in data_ind_timing mode).
              // Check if the denominator is 0
              // remainder for division by 0 is specified to be the numerator (operand a)
              // Note with data-independent time option, the full divide operation will proceed as
              // normal and will naturally return operand a
              // SEC_CM: CORE.DATA_REG_SW.SCA
          // quotient
          // A abs value
          // remainder
          // B abs value
              // Multiplication is complete once op_b is zero, unless in data_ind_timing mode where
              // the maximum possible shift-add operations will be completed regardless of op_b
              // SEC_CM: CORE.DATA_REG_SW.SCA
              // Note no state transition will occur if multdiv_hold is set
              // Note no state transition will occur if multdiv_hold is set
              // this time we save the quotient in accum_window_q since we do not need anymore the
              // remainder
              // this time we do not save the quotient anymore since we need only the remainder
          // Note no state transition will occur if multdiv_hold is set
  //////////////////////////////////////////
  // Mutliplier / Divider state registers //
  //////////////////////////////////////////
  /////////////
  // Outputs //
  /////////////
  ////////////////
  // Assertions //
  ////////////////
  // State must be valid.
  // This is intended to be accessed via hierarchal references so isn't output from this module nor
  // used in any logic in this module
  // Mark the sva_fsm_idle as unused to avoid lint issues

module ibex_multdiv_slow
(
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
  output logic  [1:0]      imd_val_we_o,

  input  logic             multdiv_ready_id_i,

  output logic [31:0]      multdiv_result_o,

  output logic             valid_o
);
