// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // 0 == RF write from ID
  // 1 == RF write from LSU
    // Stage becomes valid if an instruction enters for ID/EX and valid is cleared when instruction
    // is done
    // Writeback for non load/store instructions always completes in a cycle (so instantly done)
    // Writeback for load/store must wait for response to be received by the LSU
    // Signal only relevant if wb_valid_q set
    // Instruction in writeback will be writing to register file if either rf_we is set or writeback
    // is awaiting load data. This is used for determining RF read hazards in ID/EX
    // Increment instruction retire counters for valid instructions which are not lsu errors.
    // Speculative versions of the signals do not factor in exceptions and whether the instruction
    // is done yet. These are used to get correct values for instructions reading the relevant
    // performance counters in the ID stage.
    // Forward data that will be written to the RF back to ID to resolve data hazards. The flopped
    // rf_wdata_wb_q is used rather than rf_wdata_wb_o as the latter includes read data from memory
    // that returns too late to be used on the forwarding path.
    // without writeback stage just pass through register write signals
    // Increment instruction retire counters for valid instructions which are not lsu errors.
    // The speculative signals are always 0 when no writeback stage is present as the raw counter
    // values will be correct.
    // ready needs to be constant 1 without writeback stage (otherwise ID/EX stage will stall)
    // Unused Writeback stage only IO & wiring
    // Assign inputs and internal wiring to unused signals to satisfy lint checks
    // Tie-off outputs to constant values
  // RF write data can come from ID results (all RF writes that aren't because of loads will come
  // from here) or the LSU (RF writes for load data)

module ibex_wb_stage #(
  parameter bit ResetAll          = 1'b0,
  parameter bit WritebackStage    = 1'b0,
  parameter bit DummyInstructions = 1'b0
) (
  input  logic                     clk_i,
  input  logic                     rst_ni,

  input  logic                     en_wb_i,
  input  ibex_pkg::wb_instr_type_e instr_type_wb_i,
  input  logic [31:0]              pc_id_i,
  input  logic                     instr_is_compressed_id_i,
  input  logic                     instr_perf_count_id_i,

  output logic                     ready_wb_o,
  output logic                     rf_write_wb_o,
  output logic                     outstanding_load_wb_o,
  output logic                     outstanding_store_wb_o,
  output logic [31:0]              pc_wb_o,
  output logic                     perf_instr_ret_wb_o,
  output logic                     perf_instr_ret_compressed_wb_o,
  output logic                     perf_instr_ret_wb_spec_o,
  output logic                     perf_instr_ret_compressed_wb_spec_o,

  input  logic [4:0]               rf_waddr_id_i,
  input  logic [31:0]              rf_wdata_id_i,
  input  logic                     rf_we_id_i,

  input  logic                     dummy_instr_id_i,

  input  logic [31:0]              rf_wdata_lsu_i,
  input  logic                     rf_we_lsu_i,

  output logic [31:0]              rf_wdata_fwd_wb_o,

  output logic [4:0]               rf_waddr_wb_o,
  output logic [31:0]              rf_wdata_wb_o,
  output logic                     rf_we_wb_o,

  output logic                     dummy_instr_wb_o,

  input logic                      lsu_resp_valid_i,
  input logic                      lsu_resp_err_i,

  output logic                     instr_done_wb_o
);
