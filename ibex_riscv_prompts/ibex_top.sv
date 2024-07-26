// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // Icache parameters
  // Scrambling Parameter
  // Clock signals
  // Core <-> Register file signals
  // Combined data and integrity for data and instruction busses
  // Core <-> RAMs signals
  // Alert signals
  // Scramble signals
  /////////////////////
  // Main clock gate //
  /////////////////////
    // For secure Ibex core_busy_q must be a specific multi-bit pattern to enable the clock.
    // For non secure Ibex only the bottom bit of core_busy_q is considered. Other FFs can be
    // optimized away during synthesis.
  ////////////////////////
  // Core instantiation //
  ////////////////////////
  // Buffer security critical signals to prevent synthesis optimisation removing them
  // ibex_core takes integrity and data bits together. Combine the separate integrity and data
  // inputs here.
  /////////////////////////////////
  // Register file Instantiation //
  /////////////////////////////////
      // SEC_CM: DATA_REG_SW.GLITCH_DETECT
      // SEC_CM: DATA_REG_SW.GLITCH_DETECT
      // SEC_CM: DATA_REG_SW.GLITCH_DETECT
  ///////////////////////////////
  // Scrambling Infrastructure //
  ///////////////////////////////
    // SEC_CM: ICACHE.MEM.SCRAMBLE
    // Scramble key valid starts with OTP returning new valid key and stays high
    // until we request a new valid key.
  // Scramble key request starts with invalidate signal from ICache and stays high
  // until we got a valid key.
  ////////////////////////
  // Rams Instantiation //
  ////////////////////////
        // SEC_CM: ICACHE.MEM.SCRAMBLE
        // Tag RAM instantiation
        // Data RAM instantiation
          // Sample scramble key whenever it is valid for use in the assertions below.  This may be
          // redundant with the sampling performed in the actual design, but that is okay because
          // the assertions exist to check the correct functioning of the design.
          // Ensure that when a scramble key is received, it is correctly applied to the icache
          // scrambled memory primitives.  The upper bound in the cycle ranges below is not exact,
          // but it should not take more than 10 cycles.
        // Tag RAM instantiation
        // Data RAM instantiation
  // Redundant lockstep core implementation
    // SEC_CM: LOGIC.SHADOW
    // Note: certain synthesis tools like DC are very smart at optimizing away redundant logic.
    // Hence, we have to insert an optimization barrier at the IOs of the lockstep Ibex.
    // This is achieved by manually buffering each bit using prim_buf.
    // Our Xilinx and DC synthesis flows make sure that these buffers cannot be optimized away
    // using keep attributes (Vivado) and size_only constraints (DC).
    // Manually buffer all input signals.
  // Enable or disable iCache multi bit encoding checking error generation.
  // If enabled and a MuBi encoding error is detected, raise a major alert.
  // X checks for top-level outputs
  // X check for top-level inputs
    // Ibex can have a maximum of 2 accesses outstanding on the DSide. This is because it does not
    // speculative data accesses so the only requests that can be in flight must relate to a single
    // ongoing load or store instruction. Due to unaligned access support a single load or store can
    // generate 2 accesses.
    // We should never start a new data request if we've already got the maximum outstanding. We can
    // start a new request in the same cycle an old one ends, in which case we'll see all pending
    // accesses valid but one will be ending this cycle so the empty slot can be immediately used by
    // the new request.
    // Should only see a request response if we're expecting one
      // For SecureIbex responses to both writes and reads must specify rdata and rdata_intg (for
      // writes rdata is effectively ignored by rdata_intg still checked against rdata)
      // Without SecureIbex data_rdata_i and data_rdata_intg_i are only relevant to reads. Check
      // neither are X on a response to a read.
    // data_err_i relevant to both reads and writes. Check it isn't X on any response.
    // Tracking logic and predictor for double_fault_seen_o output, relies on RVFI so only include
    // it where RVFI is available.
    // Returns 1'b1 if the provided instruction decodes to one that would write the sync_exc_bit of
    // the CPUCTRLSTS CSR
    // Given an instruction that writes the sync_exc_bit of the CPUCTRLSTS CSR along with the value
    // of the rs1 register read for that instruction and the current predicted sync_exc_bit bit
    // return the new value of the sync_exc_bit after the instruction is executed.
    // Depending on whether the exception comes from the WB or ID/EX stage the precise timing of the
    // double_fault_seen_o output vs the double fault instruction being visible on RVFI differs. At
    // the earliest extreme it can be asserted the same cycle the instruction is visible on the
    // RVFI.  Buffer the last few cycles of double_fault_seen_o output for checking. We can
    // guarantee the minimum spacing between double_fault_seen_o assertions  (occurring when the
    // first instruction of an exception handler continuously double faults with a single cycle
    // memory access time) is sufficient that we'll only see a single bit set in the delay buffer.
          // Set flag when we see a new synchronous exception
          // Clear flag when we see an MRET
          // Update predicted sync_exc_seen when the instruction modifies the relevant CPUCTRLSTS
          // CSR bit.
    // We should only have a single assertion of double_fault_seen in the delay buffer
    // If we predict a double_fault_seen_o we should see one in the delay buffer
    // If double_fault_seen_o is asserted we should see predict one occurring within a bounded time
  // Dummy instructions may only write to register 0, which is a special register when dummy
  // instructions are enabled.
  // Ensure the crash dump is connected to the correct internal signals
  // Explicit INC_ASSERT due to instantiation of prim_secded_inv_39_32_dec below that is only used
  // by assertions
    // Check alerts from memory integrity failures
    // Check alerts from memory integrity failures

module ibex_top import ibex_pkg::*; #(
  parameter bit          PMPEnable                    = 1'b0,
  parameter int unsigned PMPGranularity               = 0,
  parameter int unsigned PMPNumRegions                = 4,
  parameter int unsigned MHPMCounterNum               = 0,
  parameter int unsigned MHPMCounterWidth             = 40,
  parameter bit          RV32E                        = 1'b0,
  parameter rv32m_e      RV32M                        = RV32MFast,
  parameter rv32b_e      RV32B                        = RV32BNone,
  parameter regfile_e    RegFile                      = RegFileFF,
  parameter bit          BranchTargetALU              = 1'b0,
  parameter bit          WritebackStage               = 1'b0,
  parameter bit          ICache                       = 1'b0,
  parameter bit          ICacheECC                    = 1'b0,
  parameter bit          BranchPredictor              = 1'b0,
  parameter bit          DbgTriggerEn                 = 1'b0,
  parameter int unsigned DbgHwBreakNum                = 1,
  parameter bit          SecureIbex                   = 1'b0,
  parameter bit          ICacheScramble               = 1'b0,
  parameter int unsigned ICacheScrNumPrinceRoundsHalf = 2,
  parameter lfsr_seed_t  RndCnstLfsrSeed              = RndCnstLfsrSeedDefault,
  parameter lfsr_perm_t  RndCnstLfsrPerm              = RndCnstLfsrPermDefault,
  parameter int unsigned DmHaltAddr                   = 32'h1A110800,
  parameter int unsigned DmExceptionAddr              = 32'h1A110808,
  // Default seed and nonce for scrambling
  parameter logic [SCRAMBLE_KEY_W-1:0]   RndCnstIbexKey   = RndCnstIbexKeyDefault,
  parameter logic [SCRAMBLE_NONCE_W-1:0] RndCnstIbexNonce = RndCnstIbexNonceDefault
) (
  // Clock and Reset
  input  logic                         clk_i,
  input  logic                         rst_ni,

  input  logic                         test_en_i,     // enable all clock gates for testing
  input  prim_ram_1p_pkg::ram_1p_cfg_t ram_cfg_i,

  input  logic [31:0]                  hart_id_i,
  input  logic [31:0]                  boot_addr_i,

  // Instruction memory interface
  output logic                         instr_req_o,
  input  logic                         instr_gnt_i,
  input  logic                         instr_rvalid_i,
  output logic [31:0]                  instr_addr_o,
  input  logic [31:0]                  instr_rdata_i,
  input  logic [6:0]                   instr_rdata_intg_i,
  input  logic                         instr_err_i,

  // Data memory interface
  output logic                         data_req_o,
  input  logic                         data_gnt_i,
  input  logic                         data_rvalid_i,
  output logic                         data_we_o,
  output logic [3:0]                   data_be_o,
  output logic [31:0]                  data_addr_o,
  output logic [31:0]                  data_wdata_o,
  output logic [6:0]                   data_wdata_intg_o,
  input  logic [31:0]                  data_rdata_i,
  input  logic [6:0]                   data_rdata_intg_i,
  input  logic                         data_err_i,

  // Interrupt inputs
  input  logic                         irq_software_i,
  input  logic                         irq_timer_i,
  input  logic                         irq_external_i,
  input  logic [14:0]                  irq_fast_i,
  input  logic                         irq_nm_i,       // non-maskeable interrupt

  // Scrambling Interface
  input  logic                         scramble_key_valid_i,
  input  logic [SCRAMBLE_KEY_W-1:0]    scramble_key_i,
  input  logic [SCRAMBLE_NONCE_W-1:0]  scramble_nonce_i,
  output logic                         scramble_req_o,

  // Debug Interface
  input  logic                         debug_req_i,
  output crash_dump_t                  crash_dump_o,
  output logic                         double_fault_seen_o,

  // RISC-V Formal Interface
  // Does not comply with the coding standards of _i/_o suffixes, but follows
  // the convention of RISC-V Formal Interface Specification.
`ifdef RVFI
  output logic                         rvfi_valid,
  output logic [63:0]                  rvfi_order,
  output logic [31:0]                  rvfi_insn,
  output logic                         rvfi_trap,
  output logic                         rvfi_halt,
  output logic                         rvfi_intr,
  output logic [ 1:0]                  rvfi_mode,
  output logic [ 1:0]                  rvfi_ixl,
  output logic [ 4:0]                  rvfi_rs1_addr,
  output logic [ 4:0]                  rvfi_rs2_addr,
  output logic [ 4:0]                  rvfi_rs3_addr,
  output logic [31:0]                  rvfi_rs1_rdata,
  output logic [31:0]                  rvfi_rs2_rdata,
  output logic [31:0]                  rvfi_rs3_rdata,
  output logic [ 4:0]                  rvfi_rd_addr,
  output logic [31:0]                  rvfi_rd_wdata,
  output logic [31:0]                  rvfi_pc_rdata,
  output logic [31:0]                  rvfi_pc_wdata,
  output logic [31:0]                  rvfi_mem_addr,
  output logic [ 3:0]                  rvfi_mem_rmask,
  output logic [ 3:0]                  rvfi_mem_wmask,
  output logic [31:0]                  rvfi_mem_rdata,
  output logic [31:0]                  rvfi_mem_wdata,
  output logic [31:0]                  rvfi_ext_pre_mip,
  output logic [31:0]                  rvfi_ext_post_mip,
  output logic                         rvfi_ext_nmi,
  output logic                         rvfi_ext_nmi_int,
  output logic                         rvfi_ext_debug_req,
  output logic                         rvfi_ext_debug_mode,
  output logic                         rvfi_ext_rf_wr_suppress,
  output logic [63:0]                  rvfi_ext_mcycle,
  output logic [31:0]                  rvfi_ext_mhpmcounters [10],
  output logic [31:0]                  rvfi_ext_mhpmcountersh [10],
  output logic                         rvfi_ext_ic_scr_key_valid,
  output logic                         rvfi_ext_irq_valid,
`endif

  // CPU Control Signals
  input  ibex_mubi_t                   fetch_enable_i,
  output logic                         alert_minor_o,
  output logic                         alert_major_internal_o,
  output logic                         alert_major_bus_o,
  output logic                         core_sleep_o,

  // DFT bypass controls
  input logic                          scan_rst_ni
);
