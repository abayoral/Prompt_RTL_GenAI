// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // internal addresses
  //////////
  // READ //
  //////////
    // Encode raddr_a/b into one-hot encoded signals.
    // Buffer the one-hot encoded signals so that the checkers
    // are not optimized.
    // SEC_CM: DATA_REG_SW.GLITCH_DETECT
    // Check the one-hot encoded signals for glitches.
      // When AddrCheck=1 also EnableCheck needs to be 1.
      // Set enable=1 as address is always valid.
      // When AddrCheck=1 also EnableCheck needs to be 1.
      // Set enable=1 as address is always valid.
    // MUX register to rdata_a/b_o according to raddr_a/b_onehot.
  ///////////
  // WRITE //
  ///////////
  // Global clock gating
  // Sample input data
  // Use clk_int here, since otherwise we don't want to write anything anyway.
  // Write address decoding
  // SEC_CM: DATA_REG_SW.GLITCH_DETECT
  // This checks for spurious WE strobes on the regfile.
    // Buffer the decoded write enable bits so that the checker
    // is not optimized into the address decoding logic.
  // Individual clock gating (if integrated clock-gating cells are available)
  // Actual write operation:
  // Generate the sequential process for the NUM_WORDS words of the memory.
  // The process is synchronized with the clocks mem_clocks[i], i = 1, ..., NUM_WORDS-1.
  // With dummy instructions enabled, R0 behaves as a real register but will always return 0 for
  // real instructions.
    // SEC_CM: CTRL_FLOW.UNPREDICTABLE
    // Write enable for dummy R0 register (waddr_a_i will always be 0 for dummy instructions)
    // R0 clock gate
    // Output the dummy data for dummy instructions, otherwise R0 reads as zero

module ibex_register_file_latch #(
  parameter bit                   RV32E             = 0,
  parameter int unsigned          DataWidth         = 32,
  parameter bit                   DummyInstructions = 0,
  parameter bit                   WrenCheck         = 0,
  parameter bit                   RdataMuxCheck     = 0,
  parameter logic [DataWidth-1:0] WordZeroVal       = '0
) (
  // Clock and Reset
  input  logic                 clk_i,
  input  logic                 rst_ni,

  input  logic                 test_en_i,
  input  logic                 dummy_instr_id_i,
  input  logic                 dummy_instr_wb_i,

  //Read port R1
  input  logic [4:0]           raddr_a_i,
  output logic [DataWidth-1:0] rdata_a_o,

  //Read port R2
  input  logic [4:0]           raddr_b_i,
  output logic [DataWidth-1:0] rdata_b_o,

  // Write port W1
  input  logic [4:0]           waddr_a_i,
  input  logic [DataWidth-1:0] wdata_a_i,
  input  logic                 we_a_i,

  // This indicates whether spurious WE or non-one-hot encoded raddr are detected.
  output logic                 err_o
);
