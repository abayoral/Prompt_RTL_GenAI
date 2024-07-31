// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // Is a PMP config a locked one that allows M-mode execution when MSECCFG.MML is set (either
  // M mode alone or shared M/U mode execution)?
  // All bitmanip configs enable non-ratified sub-extensions
  // misa
  // Partial CPU control and status register fields
  // ICache scramble key valid (ic_scr_key_valid) is registered seperately to this struct. This is
  // because it is sampled from the top-level every cycle whilst the other fields only change
  // occasionally.
  // Interrupt and exception control signals
  // CSRs
  // CSRs for recoverable NMIs
  // NOTE: these CSRS are nonstandard, see https://github.com/riscv/riscv-isa-manual/issues/261
  // PMP Signals
  // Hardware performance monitor signals
  // Only have mcountinhibit flops for counters that actually exist
  // mhpmcounter flops are elaborated below providing only the precise number that is required based
  // on MHPMCounterNum/MHPMCounterWidth. This signal connects to the Q output of these flops
  // where they exist and is otherwise 0.
  // Debug / trigger registers
  // CPU control bits
  // CSR update logic
  // Access violation signals
  /////////////
  // CSR reg //
  /////////////
  // mip CSR is purely combinational - must be able to re-enable the clock upon WFI
  // read logic
      // mvendorid: encoding of manufacturer/provider
      // marchid: encoding of base microarchitecture
      // mimpid: encoding of processor implementation version
      // mhartid: unique hardware thread id
      // mconfigptr: pointer to configuration data structre
      // mstatus: always M-mode, contains IE bit
      // mstatush: All zeros for Ibex (fixed little endian and all other bits reserved)
      // menvcfg: machine environment configuration, all zeros for Ibex (none of the relevant
      // features are implemented)
      // misa
      // interrupt enable
      // mcounteren: machine counter enable
      // mtvec: trap-vector base address
      // mepc: exception program counter
      // mcause: exception cause
      // mtval: trap value
      // mip: interrupt pending
      // PMP registers
      // machine counter/timers
      // Debug triggers
      // Custom CSR for controlling CPU features and reporting CPU status
      // Custom CSR for LFSR re-seeding (cannot be read)
  // write logic
    // mtvec.MODE set to vectored
    // mtvec.BASE must be 256-byte aligned
        // mstatus: IE bit
          // Convert illegal values to U-mode
        // interrupt enable
        // mepc: exception program counter
        // mcause
        // mtval: trap value
        // mtvec
          // Change to PRIV_LVL_U if software writes an unsupported value
          // Read-only for SW
          // Interrupts always disabled during single stepping
          // currently not supported:
          // forced to be zero
        // dpc: debug program counter
        // machine counter/timers
    // exception controller gets priority over other writes
        // Any exception, including debug mode, causes a switch to M-mode
          // all interrupts are masked
          // do not update cause, epc, tval, epc and status
          // Exceptions do not update CSRs in debug mode, so ony write these CSRs if we're not in
          // debug mode.
          // save current status
          // save previous status for recoverable NMI
            // SEC_CM: EXCEPTION.CTRL_FLOW.LOCAL_ESC
            // SEC_CM: EXCEPTION.CTRL_FLOW.GLOBAL_ESC
        // SEC_CM: EXCEPTION.CTRL_FLOW.LOCAL_ESC
        // SEC_CM: EXCEPTION.CTRL_FLOW.GLOBAL_ESC
          // when returning from an NMI restore state from mstack CSR
          // otherwise just set mstatus.MPIE/MPP
  // Update current priv level
  // Send current priv level to the decoder
  // Load/store instructions must factor in MPRV for PMP checking
  // CSR operation logic
  // only write CSRs during one clock cycle
  // directly output some registers
  // Qualify incoming interrupt requests in mip CSR with mie CSR for controller and to re-enable
  // clock upon WFI (must be purely combinational).
  ////////////////////////
  // CSR instantiations //
  ////////////////////////
  // MSTATUS
  // MEPC
  // MIE
  // MSCRATCH
  // MCAUSE
  // MTVAL
  // MTVEC
  // DCSR
  // DEPC
  // DSCRATCH0
  // DSCRATCH1
  // MSTACK
  // MSTACK_EPC
  // MSTACK_CAUSE
  // -----------------
  // PMP registers
  // -----------------
    // PMP reset values
    // Expanded / qualified register read data
        // Add in zero padding for reserved fields
        // Address field read data depends on the current programmed mode and the granularity
          // If G == 0, read data is unmodified
          // If G == 1, bit [G-1] reads as zero in TOR or OFF mode
          // For G >= 2, bits are masked to one or zero depending on the mode
            // In NAPOT mode, bits [G-2:0] must read as one
              // In TOR or OFF mode, bits [G-1:0] must read as zero
        // Non-implemented regions read as zero
    // Write data calculation
      // -------------------------
      // Instantiate cfg registers
      // -------------------------
      // Select the correct WDATA (each CSR contains 4 CFG fields, each with 2 RES bits)
      // NA4 mode is not selectable when G > 0, mode is treated as OFF
      // When MSECCFG.MML is unset, W = 1, R = 0 is a reserved combination, so force W to 0 if R ==
      // 0. Otherwise allow all possible values to be written.
      // MSECCFG.RLB allows the lock bit to be bypassed (allowing cfg writes when MSECCFG.RLB is
      // set).
      // When MSECCFG.MML is set cannot add new regions allowing M mode execution unless MSECCFG.RLB
      // is set
      // --------------------------
      // Instantiate addr registers
      // --------------------------
    // MSECCFG.MML/MSECCFG.MMWP cannot be unset once set
    // pmp_cfg_locked factors in MSECCFG.RLB so any_pmp_entry_locked will only be set if MSECCFG.RLB
    // is unset
    // When any PMP entry is locked (A PMP entry has the L bit set and MSECCFG.RLB is unset),
    // MSECCFG.RLB cannot be set again
    // Generate tieoffs when PMP is not configured
  //////////////////////////
  //  Performance monitor //
  //////////////////////////
  // update enable signals
      // bit 1 must always be 0
  // event selection (hardwired) & control
    // Assign inactive counters (first to prevent latch inference)
    // When adding or altering performance counter meanings and default
    // mappings please update dv/verilator/pcount/cpp/ibex_pcounts.cc
    // appropriately.
    //
    // active counters
  // event selector (hardwired, 0 means no event)
    // activate all
    // deactivate
  // mcycle
  // minstret
  // Where the writeback stage is present instruction in ID observing value of minstret must take
  // into account any instruction in the writeback stage. If one is present the incremented value of
  // minstret is used. A speculative version of the signal is used to aid timing. When the writeback
  // stage sees an exception (so the speculative signal is incorrect) the ID stage will be flushed
  // so the incorrect value doesn't matter. A similar behaviour is required for the compressed
  // instruction retired counter below. When the writeback stage isn't present the speculative
  // signals are always 0.
  // reserved:
  // Iterate through optionally included counters (MHPMCounterNum controls how many are included)
        // Special behaviour for reading compressed instruction retired counter, see comment on
        // `mhpmcounter[2]` above for further information.
        // All other counters just see the raw counter value directly.
    // Lint tieoffs for unused bits
  /////////////////////////////
  // Debug trigger registers //
  /////////////////////////////
    // Register values
    // Write enables
    // Trigger comparison result
    // Write select
    // Debug interface tests the available number of triggers by writing and reading the trigger
    // select register. Only allow changes to the register if it is within the supported region.
    // tmatch_control is enabled when the execute bit is set
    // Registers
    // Assign read data
    // TSELECT - number of supported triggers defined by parameter DbgHwBreakNum
    // TDATA0 - only support simple address matching
    // TDATA1 - address match value only
    // Breakpoint matching
    // We match against the next address, as the breakpoint must be taken before execution
  //////////////////////////
  // CPU control register //
  //////////////////////////
  // Cast register write data
  // Generate fixed time execution bit
    // SEC_CM: CORE.DATA_REG_SW.SCA
    // tieoff for the unused bit
    // field will always read as zero if not configured
  // Generate dummy instruction signals
    // SEC_CM: CTRL_FLOW.UNPREDICTABLE
    // Signal a write to the seed register
    // tieoff for the unused bit
    // field will always read as zero if not configured
  // Generate icache enable bit
    // tieoff for the unused icen bit
    // icen field will always read as zero if ICache not configured
    // ic_scr_key_valid will always read as zero if ICache not configured
  ////////////////
  // Assertions //
  ////////////////

module ibex_cs_registers #(
  parameter bit               DbgTriggerEn      = 0,
  parameter int unsigned      DbgHwBreakNum     = 1,
  parameter bit               DataIndTiming     = 1'b0,
  parameter bit               DummyInstructions = 1'b0,
  parameter bit               ShadowCSR         = 1'b0,
  parameter bit               ICache            = 1'b0,
  parameter int unsigned      MHPMCounterNum    = 10,
  parameter int unsigned      MHPMCounterWidth  = 40,
  parameter bit               PMPEnable         = 0,
  parameter int unsigned      PMPGranularity    = 0,
  parameter int unsigned      PMPNumRegions     = 4,
  parameter bit               RV32E             = 0,
  parameter ibex_pkg::rv32m_e RV32M             = ibex_pkg::RV32MFast,
  parameter ibex_pkg::rv32b_e RV32B             = ibex_pkg::RV32BNone
) (
  // Clock and Reset
  input  logic                 clk_i,
  input  logic                 rst_ni,

  // Hart ID
  input  logic [31:0]          hart_id_i,

  // Privilege mode
  output ibex_pkg::priv_lvl_e  priv_mode_id_o,
  output ibex_pkg::priv_lvl_e  priv_mode_lsu_o,
  output logic                 csr_mstatus_tw_o,

  // mtvec
  output logic [31:0]          csr_mtvec_o,
  input  logic                 csr_mtvec_init_i,
  input  logic [31:0]          boot_addr_i,

  // Interface to registers (SRAM like)
  input  logic                 csr_access_i,
  input  ibex_pkg::csr_num_e   csr_addr_i,
  input  logic [31:0]          csr_wdata_i,
  input  ibex_pkg::csr_op_e    csr_op_i,
  input                        csr_op_en_i,
  output logic [31:0]          csr_rdata_o,

  // interrupts
  input  logic                 irq_software_i,
  input  logic                 irq_timer_i,
  input  logic                 irq_external_i,
  input  logic [14:0]          irq_fast_i,
  input  logic                 nmi_mode_i,
  output logic                 irq_pending_o,          // interrupt request pending
  output ibex_pkg::irqs_t      irqs_o,                 // interrupt requests qualified with mie
  output logic                 csr_mstatus_mie_o,
  output logic [31:0]          csr_mepc_o,
  output logic [31:0]          csr_mtval_o,

  // PMP
  output ibex_pkg::pmp_cfg_t     csr_pmp_cfg_o  [PMPNumRegions],
  output logic [33:0]            csr_pmp_addr_o [PMPNumRegions],
  output ibex_pkg::pmp_mseccfg_t csr_pmp_mseccfg_o,

  // debug
  input  logic                 debug_mode_i,
  input  logic                 debug_mode_entering_i,
  input  ibex_pkg::dbg_cause_e debug_cause_i,
  input  logic                 debug_csr_save_i,
  output logic [31:0]          csr_depc_o,
  output logic                 debug_single_step_o,
  output logic                 debug_ebreakm_o,
  output logic                 debug_ebreaku_o,
  output logic                 trigger_match_o,

  input  logic [31:0]          pc_if_i,
  input  logic [31:0]          pc_id_i,
  input  logic [31:0]          pc_wb_i,

  // CPU control and status bits
  output logic                 data_ind_timing_o,
  output logic                 dummy_instr_en_o,
  output logic [2:0]           dummy_instr_mask_o,
  output logic                 dummy_instr_seed_en_o,
  output logic [31:0]          dummy_instr_seed_o,
  output logic                 icache_enable_o,
  output logic                 csr_shadow_err_o,
  input  logic                 ic_scr_key_valid_i,

  // Exception save/restore
  input  logic                 csr_save_if_i,
  input  logic                 csr_save_id_i,
  input  logic                 csr_save_wb_i,
  input  logic                 csr_restore_mret_i,
  input  logic                 csr_restore_dret_i,
  input  logic                 csr_save_cause_i,
  input  ibex_pkg::exc_cause_t csr_mcause_i,
  input  logic [31:0]          csr_mtval_i,
  output logic                 illegal_csr_insn_o,     // access to non-existent CSR,
                                                        // with wrong priviledge level, or
                                                        // missing write permissions
  output logic                 double_fault_seen_o,
  // Performance Counters
  input  logic                 instr_ret_i,                 // instr retired in ID/EX stage
  input  logic                 instr_ret_compressed_i,      // compressed instr retired
  input  logic                 instr_ret_spec_i,            // speculative instr_ret_i
  input  logic                 instr_ret_compressed_spec_i, // speculative instr_ret_compressed_i
  input  logic                 iside_wait_i,                // core waiting for the iside
  input  logic                 jump_i,                      // jump instr seen (j, jr, jal, jalr)
  input  logic                 branch_i,                    // branch instr seen (bf, bnf)
  input  logic                 branch_taken_i,              // branch was taken
  input  logic                 mem_load_i,                  // load from memory in this cycle
  input  logic                 mem_store_i,                 // store to memory in this cycle
  input  logic                 dside_wait_i,                // core waiting for the dside
  input  logic                 mul_wait_i,                  // core waiting for multiply
  input  logic                 div_wait_i                   // core waiting for divide
);
