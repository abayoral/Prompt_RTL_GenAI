// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // WE strobe and one-hot encoded raddr alert.
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
    // async_read a
    // async_read b
  // we select
  // SEC_CM: DATA_REG_SW.GLITCH_DETECT
  // This checks for spurious WE strobes on the regfile.
    // Since the FPGA uses a memory macro, there is only one write-enable strobe to check.
  // Note that the SystemVerilog LRM requires variables on the LHS of assignments within
  // "always_ff" to not be written to by any other process. However, to enable the initialization
  // of the inferred RAM32M primitives with non-zero values, below "initial" procedure is needed.
  // Therefore, we use "always" instead of the generally preferred "always_ff" for the synchronous
  // write procedure.
  // Make sure we initialize the BRAM with the correct register reset value.
  // Reset not used in this register file version
  // Dummy instruction changes not relevant for FPGA implementation
  // Test enable signal not used in FPGA implementation

module ibex_register_file_fpga #(
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
  input  logic [          4:0] raddr_a_i,
  output logic [DataWidth-1:0] rdata_a_o,
  //Read port R2
  input  logic [          4:0] raddr_b_i,
  output logic [DataWidth-1:0] rdata_b_o,
  // Write port W1
  input  logic [          4:0] waddr_a_i,
  input  logic [DataWidth-1:0] wdata_a_i,
  input  logic                 we_a_i,

  // This indicates whether spurious WE or non-one-hot encoded raddr are detected.
  output logic                 err_o
);
