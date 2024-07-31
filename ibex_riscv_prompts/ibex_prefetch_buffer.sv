// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  ////////////////////////////
  // Prefetch buffer status //
  ////////////////////////////
  //////////////////////////////////////////////
  // Fetch fifo - consumes addresses and data //
  //////////////////////////////////////////////
  // A branch will invalidate any previously fetched instructions.
  // Note that the FENCE.I instruction relies on this flushing behaviour on branch. If it is
  // altered the FENCE.I implementation may require changes.
  // Reversed version of rdata_outstanding_q which can be overlaid with fifo fill state
  // The fifo is ready to accept a new request if it is not full - including space reserved for
  // requests already outstanding.
  // Overlay the fifo fill state with the outstanding requests to see if there is space.
  //////////////
  // Requests //
  //////////////
  // Make a new request any time there is space in the FIFO, and space in the request queue
  // Hold the request stable for requests that didn't get granted
  // Record whether an outstanding bus request is cancelled by a branch
  ////////////////
  // Fetch addr //
  ////////////////
  // Two addresses are tracked in the prefetch buffer:
  // 1. stored_addr_q - This is the address issued on the bus. It stays stable until
  //                    the request is granted.
  // 2. fetch_addr_q  - This is our next address to fetch from. It is updated on branches to
  //                    capture the new address, and then for each new request issued.
  // A third address is tracked in the fetch FIFO itself:
  // 3. instr_addr_q  - This is the address at the head of the FIFO, efectively our oldest fetched
  //                    address. This address is updated on branches, and does its own increment
  //                    each time the FIFO is popped.
  // 1. stored_addr_q
  // Only update stored_addr_q for new ungranted requests
  // Store whatever address was issued on the bus
  // CPU resets with a branch, so no need to reset these addresses
  // 2. fetch_addr_q
  // Update on a branch or as soon as a request is issued
                        // Current address + 4
  // Address mux
  ///////////////////////////////
  // Request outstanding queue //
  ///////////////////////////////
    // Request 0 (always the oldest outstanding request)
      // A request becomes outstanding once granted, and is cleared once the rvalid is received.
      // Outstanding requests shift down the queue towards entry 0.
      // If a branch is received at any point while a request is outstanding, it must be tracked
      // to ensure we discard the data once received
    // Entries > 0 consider the FIFO fill state to calculate their next state (by checking
    // whether the previous entry is valid)
  // Shift the entries down on each instr_rvalid_i
  // Push a new entry to the FIFO once complete (and not cancelled by a branch)
  ///////////////
  // Registers //
  ///////////////
  /////////////
  // Outputs //
  /////////////

module ibex_prefetch_buffer #(
  parameter bit ResetAll        = 1'b0
) (
  input  logic        clk_i,
  input  logic        rst_ni,

  input  logic        req_i,

  input  logic        branch_i,
  input  logic [31:0] addr_i,

  input  logic        ready_i,
  output logic        valid_o,
  output logic [31:0] rdata_o,
  output logic [31:0] addr_o,
  output logic        err_o,
  output logic        err_plus2_o,

  // goes to instruction memory / instruction cache
  output logic        instr_req_o,
  input  logic        instr_gnt_i,
  output logic [31:0] instr_addr_o,
  input  logic [31:0] instr_rdata_i,
  input  logic        instr_err_i,
  input  logic        instr_rvalid_i,

  // Prefetch Buffer Status
  output logic        busy_o
);
