// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
// SEC_CM: CTRL_FLOW.UNPREDICTABLE
  // Shift the LFSR every time we insert an instruction
  // Extract fields from LFSR
  // Set count threshold for inserting a new instruction. This is the pseudo-random value from the
  // LFSR with a mask applied (based on CSR config data) to shorten the period if required.
  // Clear the counter everytime a new instruction is inserted
  // Increment the counter for each executed instruction while dummy instuctions are
  // enabled.
  // Insert a dummy instruction each time the counter hits the threshold
  // Encode instruction
  //                    SET        RS2             RS1             OP            RD
  // Assign outputs

module ibex_dummy_instr import ibex_pkg::*; #(
    parameter lfsr_seed_t RndCnstLfsrSeed = RndCnstLfsrSeedDefault,
    parameter lfsr_perm_t RndCnstLfsrPerm = RndCnstLfsrPermDefault
) (
  // Clock and reset
  input  logic        clk_i,
  input  logic        rst_ni,

  // Interface to CSRs
  input  logic        dummy_instr_en_i,
  input  logic [2:0]  dummy_instr_mask_i,
  input  logic        dummy_instr_seed_en_i,
  input  logic [31:0] dummy_instr_seed_i,

  // Interface to IF stage
  input  logic        fetch_valid_i,
  input  logic        id_in_ready_i,
  output logic        insert_dummy_instr_o,
  output logic [31:0] dummy_instr_data_o
);
