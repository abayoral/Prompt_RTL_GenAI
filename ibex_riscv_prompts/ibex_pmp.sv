// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // Access Checking Signals
  ///////////////////////
  // Functions for PMP //
  ///////////////////////
  // Flow of the PMP checking operation follows as below
  //
  // basic_perm_check ---> perm_check_wrapper ---> mml_perm_check/orig_perm_check ---/
  //                                                                                 |
  // region_match_all --------------------------------> access_fault_check <----------
  //                                                            |
  //                                                            \--> pmp_req_err_o
  // Compute permissions checks that apply when MSECCFG.MML is set. Added for Smepmp support.
      // Special-case shared regions where R = 0, W = 1
        // Read/write in M, read only in S/U
        // Read/write in M/S/U
        // Execute only on M/S/U
        // Read/execute in M, execute only on S/U
        // Special-case shared read only region when R = 1, W = 1, X = 1, L = 1
        // Otherwise use basic permission check. Permission is always denied if in S/U mode and
        // L is set or if in M mode and L is unset.
  // Compute permissions checks that apply when MSECCFG.MML is unset. This is the original PMP
  // behaviour before Smepmp was added.
          // For M-mode, any region which matches with the L-bit clear, or with sufficient
          // access permissions will be allowed
          // For other modes, the lock bit doesn't matter
  // A wrapper function in which it is decided which form of permission check function gets called
  // Access fault determination / prioritization
    // When MSECCFG.MMWP is set default deny always, otherwise allow for M-mode, deny for other
    // modes. Also deny unmatched for M-mode whe MSECCFG.MML is set and request type is EXEC.
    // PMP entries are statically prioritized, from 0 to N-1
    // The lowest-numbered PMP entry which matches an address determines accessibility
  // ---------------
  // Access checking
  // ---------------
    // Start address for TOR matching
    // Address mask for NA matching
        // Always mask bit 2 for NAPOT
        // We will mask this bit if it is within the programmed granule
        // i.e. addr = yyyy 0111
        //                  ^
        //                  | This bit pos is the top of the mask, all lower bits set
        // thus mask = 1111 0000
      // Comparators are sized according to granularity
      // Basic permission check compares cfg register only.
      // Check specific required permissions since the behaviour is different
      // between Smepmp implementation and original PMP.
      // Address bits below PMP granularity (which starts at 4 byte) are deliberately unused.
    // Once the permission checks of the regions are done, decide if the access is
    // denied by figuring out the matching region and its permission check.
    // Access fails check against one region but access allowed due to another higher-priority
    // region.
  // RLB, rule locking bypass, is only relevant to ibex_cs_registers which controls writes to the
  // PMP CSRs. Tie to unused signal here to prevent lint warnings.

module ibex_pmp #(
  // Granularity of NAPOT access,
  // 0 = No restriction, 1 = 8 byte, 2 = 16 byte, 3 = 32 byte, etc.
  parameter int unsigned PMPGranularity = 0,
  // Number of access channels (e.g. i-side + d-side)
  parameter int unsigned PMPNumChan     = 2,
  // Number of implemented regions
  parameter int unsigned PMPNumRegions  = 4
) (
  // Interface to CSRs
  input  ibex_pkg::pmp_cfg_t      csr_pmp_cfg_i     [PMPNumRegions],
  input  logic [33:0]             csr_pmp_addr_i    [PMPNumRegions],
  input  ibex_pkg::pmp_mseccfg_t  csr_pmp_mseccfg_i,

  input  ibex_pkg::priv_lvl_e     priv_mode_i    [PMPNumChan],
  // Access checking channels
  input  logic [33:0]             pmp_req_addr_i [PMPNumChan],
  input  ibex_pkg::pmp_req_e      pmp_req_type_i [PMPNumChan],
  output logic                    pmp_req_err_o  [PMPNumChan]

);
