// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // Number of fill buffers (must be >= 2)
  // Request throttling threshold
  // Prefetch signals
  // Cache pipelipe IC0 signals
  // Cache pipelipe IC1 signals
  // Fill buffer signals
  // External req signals
  // Data output signals
  // Invalidations
  //////////////////////////
  // Instruction prefetch //
  //////////////////////////
  // The prefetch address increments by one cache line for each granted request.
  // This address is also updated if there is a branch that is not granted, since the target
  // address (addr_i) is only valid for one cycle while branch_i is high.
  // The captured branch target address is not forced to be aligned since the offset in the cache
  // line must also be recorded for later use by the fill buffers.
  ////////////////////////
  // Pipeline stage IC0 //
  ////////////////////////
  // Cache lookup
  // Cache write
  // Arbitrated signals - lookups have highest priority
  // Qualified lookup grant to mask ram signals in IC1 if access was not made
  // Tagram
  // Dataram
  // Append ECC checkbits to write data if required
    // SEC_CM: ICACHE.MEM.INTEGRITY
    // Tagram ECC
    // Reuse the same ecc encoding module for larger cache sizes by padding with zeros
    // Dataram ECC
  ////////////////
  // IC0 -> IC1 //
  ////////////////
  // Tag RAMs outputs
  // Tag RAMs inputs
  // Data RAMs outputs
  // Data RAMs inputs
  ////////////////////////
  // Pipeline stage IC1 //
  ////////////////////////
  // Tag matching
  // Hit data mux
  // Way selection for allocations to the cache (onehot signals)
  // 1 first invalid way
  // 2 global round-robin (pseudorandom) way
  // ECC checking logic
    // SEC_CM: ICACHE.MEM.INTEGRITY
    // Tag ECC checking
      // Expand the tag rdata with extra padding if the tag size is less than the maximum
    // Data ECC checking
    // Note - could generate for all ways and mux after
    // Tag ECC across all ways is always expected to be correct so the check does not need to be
    // qualified by hit or tag valid. Initial (invalid with correct ECC) tags are written on reset
    // and all further tag writes produce correct ECC. For data ECC no initialisation is done on
    // reset so unused data (in particular those ways that don't have a valid tag) may have
    // incorrect ECC. We only check data ECC where tags indicate it is valid and we have hit on it.
    // Error correction
    // All ways will be invalidated on a tag error to prevent X-propagation from data_err_ic1 on
    // spurious hits. Also prevents the same line being allocated twice when there was a true
    // hit and a spurious hit.
    // The index is required in IC1 only when ECC is configured so is registered here
    // Store the ways with errors to be invalidated
  ///////////////////////////////
  // Cache allocation decision //
  ///////////////////////////////
    // Cache branch target + a number of subsequent lines
    // Cache all missing fetches
  //////////////////////////
  // Fill buffer tracking //
  //////////////////////////
  // Allocate a new buffer for every granted lookup
  // Track whether a speculative external request was made from IC0, and whether it was granted
  // Speculative requests are only made for branches, or if the cache is disabled
    /////////////////////////////
    // Fill buffer allocations //
    /////////////////////////////
    // Allocate the lowest available buffer
    // Track which other fill buffers are older than this one (for age-based arbitration)
    // TODO sparsify
    // A fill buffer can release once all its actions are completed
                                 // all data written to the cache (unless hit or error)
                                 // all data output unless stale due to intervening branch
                                 // all external requests completed
    /////////////////////////////////
    // Fill buffer status tracking //
    /////////////////////////////////
    // Track staleness (requests become stale when a branch intervenes)
    // Track whether or not this request should allocate to the cache
    // Any invalidation or disabling of the cache while the buffer is busy will stop allocation
    // Record whether the request hit in the cache
    ///////////////////////////////////////////
    // Fill buffer external request tracking //
    ///////////////////////////////////////////
    // Make an external request
    // Count the number of completed external requests (each line requires IC_LINE_BEATS requests)
    // External request must be held until granted
    // External requests are completed when the counter is filled or when the request is cancelled
                                  // external requests are considered complete if the request hit
                                  // cancel if the line won't be cached and, it is stale
                                   // or we're already at the end of the line
                                 // can't cancel while we are waiting for a grant on the bus
    // Track whether this fill buffer expects to receive beats of data
    // Count the number of rvalid beats received
    // External data is complete when all issued external requests have received their data
    //////////////////////////////////////
    // Fill buffer data output tracking //
    //////////////////////////////////////
    // Send data to the IF stage for requests that are not stale, have not completed their
    // data output, and have data available to send.
    // Data is available if:
    // - The request hit in the cache
    // - Buffered data is available (fill_rvd_cnt_q is ahead of fill_out_cnt_q)
    // - Data is available from the bus this cycle (fill_rvd_arb)
    // Calculate when a beat of data is output. Any ECC error squashes the output that cycle.
    // Count the beats of data output to the IF stage
    // Data output complete when the counter fills
    //////////////////////////////////////
    // Fill buffer ram request tracking //
    //////////////////////////////////////
                                 // make a fill request once all data beats received
                                 // unless the request hit, was non-allocating or got an error
                                 // or the request was already completed
    // Record when a cache allocation request has been completed
    //////////////////////////////
    // Fill buffer line offsets //
    //////////////////////////////
    // When we branch into the middle of a line, the output count will not start from zero. This
    // beat count is used to know which incoming rdata beats are relevant.
    /////////////////////////////
    // Fill buffer arbitration //
    /////////////////////////////
    // Age based arbitration - all these signals are one-hot
    // Calculate which fill buffer is the oldest one which still needs to output data to IF
    // Arbitrate the request which has data available to send, and is the oldest outstanding
    // Assign incoming rvalid data to the oldest fill buffer expecting it
    /////////////////////////////
    // Fill buffer data muxing //
    /////////////////////////////
    // Output data muxing controls
    // 1. Select data from the fill buffer data register
    //                           The incoming data is already ahead of the output count
    // 2. Select IC1 hit data
    // 3. Select incoming instr_rdata_i
    //                           The incoming data lines up with the output count
    ///////////////////////////
    // Fill buffer registers //
    ///////////////////////////
    // Fill buffer general enable
    ////////////////////////////////////////
    // Fill buffer address / data storage //
    ////////////////////////////////////////
    // Data either comes from the cache or the bus. If there was an ECC error, we must take
    // the incoming bus data since the cache hit data is corrupted.
      // Error tracking (per beat)
      //                           Hold the error once recorded
      // Enable the relevant part of the data register (or all for cache hits)
      // Ignore incoming rvalid data when we already have cache hit data
  ////////////////////////////////
  // Fill buffer one-hot muxing //
  ////////////////////////////////
  // External req info
  // Cache req info
  // IF stage output data
        // Ignore any speculative errors accumulated on cache hits
  ///////////////////////
  // External requests //
  ///////////////////////
  ////////////////////////
  // Output data muxing //
  ////////////////////////
  // Mux between line-width data sources
  // Mux the relevant beat of line data, based on the output address
      // When data has been skidded, the output address is behind by one
  // Mux between incoming rdata and the muxed line data
  // Output data is valid (from any of the three possible sources). Note that fill_out_arb
  // must be used here rather than fill_out_req because data can become valid out of order
  // (e.g. cache hit data can become available ahead of an older outstanding miss).
  // Skid buffer data
  // The data in the skid buffer is ready if it's a complete compressed instruction or if there's
  // an error (no need to wait for the second half)
  // Data can be loaded into the skid buffer for an unaligned uncompressed instruction
      // Branches invalidate the skid buffer
      // Once valid, the skid buffer stays valid until a compressed instruction realigns the stream
      // The skid buffer becomes valid when:
                        // - we branch to an unaligned uncompressed instruction
                        // - a compressed instruction misaligns the stream
  // Signal that valid data is available to the IF stage
  // Note that if the first half of an unaligned instruction reports an error, we do not need
  // to wait for the second half
                        // Compressed instruction completely satisfied by skid buffer
                        // Output data available and, output stream aligned, or skid data available,
                                       // or this is an error or an unaligned compressed instruction
  // Update the address on branches and every time an instruction is driven
  // Increment the address by two every time a compressed instruction is popped
  // Next IF stage PC
                             // Increment address by 4 or 2
  // Redirect the address on branches
  // Mux the data from BUS_SIZE to halfword
  // This muxing realigns data when instruction words are split across BUS_W e.g.
  // word 1 |----|*h1*|
  // word 0 |*h0*|----| --> |*h1*|*h0*|
  //        31   15   0     31   15   0
  // Error caused by the second half of a misaligned uncompressed instruction
  // (only relevant when err_o is set)
  ///////////////////
  // Invalidations //
  ///////////////////
  // Invalidation (writing all entries in the tag RAM with an invalid tag) occurs straight out of
  // reset and after any invalidation request (signalled via icache_inval_i). An invalidation
  // request coming whilst another is writing tags causes the invalidation to start again. This
  // ensures a new scramble key is requested where a previous one is in use.
  // TODO: Ditch this behaviour for non-secure ibex?
    // Prevent other cache activity (cache lookups and cache allocations) whilst an invalidation is
    // in progress. Set to 1 by default as the only time we don't block is when the state machine is
    // IDLE.
        // Initial state, this initialises the tag RAMs out of reset before the icache can be used
        // When invalidating a new scrambling key is requested on all invalidation requests. Wait
        // for that new key to be available before beginning with the actual invalidation (cannot
        // write to the tag RAM until we have the new scrambling key that will be used). Ignore any
        // requests in this phase (once a scramble key request has started we cannot request a new
        // one until the on-going request is done).
        // Actually invalidate the cache. Write every entry in the tag RAM with an invalid tag. Once
        // all are written we're done.
          // If a new invalidaiton requests comes in go back to the beginning with a new scramble
          // key
          // When the final index is written we're done
        // Usual running state
          // Allow other cache activies whilst in IDLE and no invalidation has been requested
  /////////////////
  // Busy status //
  /////////////////
  // Only busy (for WFI purposes) while an invalidation is in-progress, or external requests are
  // outstanding.
  ////////////////
  // Assertions //
  ////////////////
  // ECC primitives will need to be changed for different sizes
  // Lookups in the tag ram should always give a known result
  // This is only used for the Yosys-based formal flow. Once we have working bind support, we can
  // get rid of it.
  // Unfortunately, Yosys doesn't support passing unpacked arrays as ports. Explicitly pack up the
  // signals we need.

module ibex_icache import ibex_pkg::*; #(
  parameter bit          ICacheECC       = 1'b0,
  parameter bit          ResetAll        = 1'b0,
  parameter int unsigned BusSizeECC      = BUS_SIZE,
  parameter int unsigned TagSizeECC      = IC_TAG_SIZE,
  parameter int unsigned LineSizeECC     = IC_LINE_SIZE,
  // Only cache branch targets
  parameter bit          BranchCache     = 1'b0
) (
  // Clock and reset
  input  logic                           clk_i,
  input  logic                           rst_ni,

  // Signal that the core would like instructions
  input  logic                           req_i,

  // Set the cache's address counter
  input  logic                           branch_i,
  input  logic [31:0]                    addr_i,

  // IF stage interface: Pass fetched instructions to the core
  input  logic                           ready_i,
  output logic                           valid_o,
  output logic [31:0]                    rdata_o,
  output logic [31:0]                    addr_o,
  output logic                           err_o,
  output logic                           err_plus2_o,

  // Instruction memory / interconnect interface: Fetch instruction data from memory
  output logic                           instr_req_o,
  input  logic                           instr_gnt_i,
  output logic [31:0]                    instr_addr_o,
  input  logic [BUS_SIZE-1:0]            instr_rdata_i,
  input  logic                           instr_err_i,
  input  logic                           instr_rvalid_i,

  // RAM IO
  output logic [IC_NUM_WAYS-1:0]         ic_tag_req_o,
  output logic                           ic_tag_write_o,
  output logic [IC_INDEX_W-1:0]          ic_tag_addr_o,
  output logic [TagSizeECC-1:0]          ic_tag_wdata_o,
  input  logic [TagSizeECC-1:0]          ic_tag_rdata_i [IC_NUM_WAYS],
  output logic [IC_NUM_WAYS-1:0]         ic_data_req_o,
  output logic                           ic_data_write_o,
  output logic [IC_INDEX_W-1:0]          ic_data_addr_o,
  output logic [LineSizeECC-1:0]         ic_data_wdata_o,
  input  logic [LineSizeECC-1:0]         ic_data_rdata_i [IC_NUM_WAYS],
  input  logic                           ic_scr_key_valid_i,
  output logic                           ic_scr_key_req_o,

  // Cache status
  input  logic                           icache_enable_i,
  input  logic                           icache_inval_i,
  output logic                           busy_o,
  output logic                           ecc_error_o
);
