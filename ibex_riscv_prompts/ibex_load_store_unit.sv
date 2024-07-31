// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
                                                          // part of a misaligned access
  ///////////////////
  // BE generation //
  ///////////////////
  /////////////////////
  // WData alignment //
  /////////////////////
  // prepare data to be written to the memory
  // we handle misaligned accesses, half word and byte accesses here
  /////////////////////
  // RData alignment //
  /////////////////////
  // register for unaligned rdata
  // registers for transaction control
  // Store last address for mtval + AGU for misaligned transactions.  Do not update in case of
  // errors, mtval needs the (first) failing address.  Where an aligned access or the first half of
  // a misaligned access sees an error provide the calculated access address. For the second half of
  // a misaligned access provide the word aligned address of the second half.
  // take care of misaligned words
  ////////////////////
  // Sign extension //
  ////////////////////
  // sign extension for half words
  // sign extension for bytes
  // select word, half word or byte sign extended version
  ///////////////////////////////
  // Read data integrity check //
  ///////////////////////////////
  // SEC_CM: BUS.INTEGRITY
    // Don't care if error is correctable or not, they're all treated the same
  /////////////
  // LSU FSM //
  /////////////
  // check for misaligned accesses that need to be split into two word-aligned accesses
  // FSM
        // data_pmp_err_i is valid during the address phase of a request. An error will block the
        // external request and so a data_gnt_i might never be signalled. The registered version
        // pmp_err_q is only updated for new address phases and so can be used in WAIT_GNT* and
        // WAIT_RVALID* states
        // push out second request
        // tell ID/EX stage to update the address
        // first part rvalid is received, or gets a PMP error
          // Update the PMP error for the second part
          // Record the error status of the first part
          // Capture the first rdata for loads
          // If already granted, wait for second rvalid
          // Update the address for the second part, if no error
          // clear handle_misaligned if second request is granted
          // first part rvalid is NOT received
            // second grant is received
        // tell ID/EX stage to update the address
          // Update the address, unless there was an error
        // tell ID/EX stage to update the address (to make sure the
        // second address can be captured correctly for mtval and PMP checking)
        // Wait for the first rvalid, second request is already granted
          // Update the pmp error for the second part
          // The first part cannot see a PMP error in this state
          // Now we can update the address for the second part if no error
          // Capture the first rdata for loads
          // Wait for second rvalid
  // registers for FSM
  /////////////
  // Outputs //
  /////////////
  // output to register file
  // output data address must be word aligned
  // output to data interface
  /////////////////////////////////////
  // Write data integrity generation //
  /////////////////////////////////////
  // SEC_CM: BUS.INTEGRITY
  // output to ID stage: mtval + AGU for misaligned transactions
  // Signal a load or store error depending on the transaction type outstanding
  // Integrity errors are their own category for timing reasons. load_err_o is factored directly
  // into data_req_o to enable synchronous exception on load errors without performance loss (An
  // upcoming load cannot request until the current load has seen its response, so the earliest
  // point the new request can be sent is the same cycle the response is seen). If load_err_o isn't
  // factored into data_req_o there would have to be a stall cycle between all back to back loads.
  // The data_intg_err signal is generated combinatorially from the incoming data_rdata_i. Were it
  // to be factored into load_err_o there would be a feedthrough path from data_rdata_i to
  // data_req_o which is undesirable.
  //////////
  // FCOV //
  //////////
  // Set when awaiting the response for the second half of a misaligned access
  // fcov_mis_rvalid_1: Set when the response is received to the first half of a misaligned access,
  // fcov_mis_rvalid_2: Set when response is received for the second half
  // Set when the first half of a misaligned access saw a bus errror
  ////////////////
  // Assertions //
  ////////////////
  // Selectors must be known/valid.
  // Address must not contain X when request is sent.
  // Address must be word aligned when request is sent.

module ibex_load_store_unit #(
  parameter bit          MemECC       = 1'b0,
  parameter int unsigned MemDataWidth = MemECC ? 32 + 7 : 32
) (
  input  logic         clk_i,
  input  logic         rst_ni,

  // data interface
  output logic         data_req_o,
  input  logic         data_gnt_i,
  input  logic         data_rvalid_i,
  input  logic         data_bus_err_i,
  input  logic         data_pmp_err_i,

  output logic [31:0]             data_addr_o,
  output logic                    data_we_o,
  output logic [3:0]              data_be_o,
  output logic [MemDataWidth-1:0] data_wdata_o,
  input  logic [MemDataWidth-1:0] data_rdata_i,

  // signals to/from ID/EX stage
  input  logic         lsu_we_i,             // write enable                     -> from ID/EX
  input  logic [1:0]   lsu_type_i,           // data type: word, half word, byte -> from ID/EX
  input  logic [31:0]  lsu_wdata_i,          // data to write to memory          -> from ID/EX
  input  logic         lsu_sign_ext_i,       // sign extension                   -> from ID/EX

  output logic [31:0]  lsu_rdata_o,          // requested data                   -> to ID/EX
  output logic         lsu_rdata_valid_o,
  input  logic         lsu_req_i,            // data request                     -> from ID/EX

  input  logic [31:0]  adder_result_ex_i,    // address computed in ALU          -> from ID/EX

  output logic         addr_incr_req_o,      // request address increment for
                                              // misaligned accesses              -> to ID/EX
  output logic [31:0]  addr_last_o,          // address of last transaction      -> to controller
                                              // -> mtval
                                              // -> AGU for misaligned accesses

  output logic         lsu_req_done_o,       // Signals that data request is complete
                                              // (only need to await final data
                                              // response)                        -> to ID/EX

  output logic         lsu_resp_valid_o,     // LSU has response from transaction -> to ID/EX

  // exception signals
  output logic         load_err_o,
  output logic         load_resp_intg_err_o,
  output logic         store_err_o,
  output logic         store_resp_intg_err_o,

  output logic         busy_o,

  output logic         perf_load_o,
  output logic         perf_store_o
);
