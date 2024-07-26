// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // index 0 is used for output
  /////////////////
  // Output port //
  /////////////////
  // The FIFO contains word aligned memory fetches, but the instructions contained in each entry
  // might be half-word aligned (due to compressed instructions)
  // e.g.
  //              | 31               16 | 15               0 |
  // FIFO entry 0 | Instr 1 [15:0]      | Instr 0 [15:0]     |
  // FIFO entry 1 | Instr 2 [15:0]      | Instr 1 [31:16]    |
  //
  // The FIFO also has a direct bypass path, so a complete instruction might be made up of data
  // from the FIFO and new incoming data.
  //
  // Construct the output data for an unaligned instruction
  // If entry[1] is valid, an error can come from entry[0] or entry[1], unless the
  // instruction in entry[0] is compressed (entry[1] is a new instruction)
  // If entry[1] is not valid, and entry[0] is, an error can come from entry[0] or the incoming
  // data, unless the instruction in entry[0] is compressed
  // If entry[0] is not valid, the error must come from the incoming data
  // Record when an error is caused by the second half of an unaligned 32bit instruction.
  // Only needs to be correct when unaligned and if err_unaligned is set
  // An uncompressed unaligned instruction is only valid if both parts are available
  // If there is an error, rdata is unknown
  ////////////////////////////////////////
  // Instruction aligner (if unaligned) //
  ////////////////////////////////////////
      // unaligned case
      // aligned case
  /////////////////////////
  // Instruction address //
  /////////////////////////
  // Update the address on branches and every time an instruction is driven
  // Increment the address by two every time a compressed instruction is popped
                            // Increment address by 4 or 2
  // Output PC of current instruction
  // The LSB of the address is unused, since all addresses are halfword aligned
  /////////////////
  // FIFO status //
  /////////////////
  // Indicate the fill level of fifo-entries. This is used to determine when a new request can be
  // made on the bus. The prefetch buffer only needs to know about the upper entries which overlap
  // with NUM_REQS.
  /////////////////////
  // FIFO management //
  /////////////////////
  // Since an entry can contain unaligned instructions, popping an entry can leave the entry valid
    // Calculate lowest free entry (write pointer)
    // An entry is set when an incoming request chooses the lowest available entry
    // Popping the FIFO shifts all entries down
    // All entries are wiped out on a clear
    // data flops are enabled if there is new data to shift into it, or
                         // a new request is incoming and this is the lowest free entry
    // take the next entry or the incoming data
  // The top entry is similar but with simpler muxing
  ////////////////////
  // FIFO registers //
  ////////////////////
  ////////////////
  // Assertions //
  ////////////////
  // Must not push and pop simultaneously when FIFO full.
  // Must not push to FIFO when full.

module ibex_fetch_fifo #(
  parameter int unsigned NUM_REQS = 2,
  parameter bit          ResetAll = 1'b0
) (
  input  logic                clk_i,
  input  logic                rst_ni,

  // control signals
  input  logic                clear_i,   // clears the contents of the FIFO
  output logic [NUM_REQS-1:0] busy_o,

  // input port
  input  logic                in_valid_i,
  input  logic [31:0]         in_addr_i,
  input  logic [31:0]         in_rdata_i,
  input  logic                in_err_i,

  // output port
  output logic                out_valid_o,
  input  logic                out_ready_i,
  output logic [31:0]         out_addr_o,
  output logic [31:0]         out_rdata_o,
  output logic                out_err_o,
  output logic                out_err_plus2_o
);
