// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // Of the various exception/fault signals, which one takes priority in FLUSH and hence controls
  // what happens next (setting exc_cause, csr_mtval etc)
  // synopsys translate_off
  // make sure we are called later so that we do not generate messages for
  // glitches
    // print warning in case of decoding errors
  // synopsys translate_on
  ////////////////
  // Exceptions //
  ////////////////
  // Decoder doesn't take instr_valid into account, factor it in here.
  // This is recorded in the illegal_insn_q flop to help timing.  Specifically
  // it is needed to break the path from ibex_cs_registers/illegal_csr_insn_o
  // to pc_set_o.  Clear when controller is in FLUSH so it won't remain set
  // once illegal instruction is handled.
  // illegal_insn_i only set when instr_valid_i is set.
  // exception requests
  // requests are flopped in exc_req_q.  This is cleared when controller is in
  // the FLUSH state so the cycle following exc_req_q won't remain set for an
  // exception request that has just been handled.
  // All terms in this expression are qualified by instr_valid_i
  // LSU exception requests
  // special requests: special instructions, pipeline flushes, exceptions...
  // All terms in these expressions are qualified by instr_valid_i except exc_req_lsu which can come
  // from the Writeback stage with no instr_valid_i from the ID stage
  // These special requests only cause a pipeline flush and in particular don't cause a PC change
  // that is outside the normal execution flow
  // These special requests cause a change in PC
  // generic special request signal, applies to all instructions
  // Is there an instruction in ID or WB that has yet to complete?
  // Logic to determine which exception takes priority where multiple are possible.
      // Note that with the writeback stage store/load errors occur on the instruction in writeback,
      // all other exception/faults occur on the instruction in ID/EX. The faults from writeback
      // must take priority as that instruction is architecurally ordered before the one in ID/EX.
    // Instruction in writeback is generating an exception so instruction in ID must not execute
  ////////////////
  // Interrupts //
  ////////////////
  // Internal interrupt control
  // All internal interrupts act as an NMI and go to the NMI vector. mcause is set based upon
  // irq_nm_int_cause.
    // Load integerity error internal interrupt
        // Clear ECC error interrupt when it is handled. External NMI takes a higher priority so
        // don't clear the ECC error interrupt if an external NMI is present.
        // When an ECC error is seen set the ECC error interrupt and capture the address that saw
        // the error. If there is already an ecc error IRQ pending ignore any ECC errors coming in.
    // As integrity error is the only internal interrupt implement, set irq_nm_* signals directly
    // within this generate block.
    // No integrity checking on incoming load data so no internal interrupts
  // Enter debug mode due to an external debug_req_i or because the core is in
  // single step mode (dcsr.step == 1). Single step must be qualified with
  // instruction valid otherwise the core will immediately enter debug mode
  // due to a recently flushed IF (or a delay in an instruction returning from
  // memory) before it has had anything to single step.
  // Also enter debug mode on a trigger match (hardware breakpoint)
  // Set `do_single_step_q` when a valid instruction is seen outside of debug mode and core is in
  // single step mode. The first valid instruction on debug mode entry will clear it. Hold its value
  // when there is no valid instruction so `do_single_step_d` remains asserted until debug mode is
  // entered.
  // Enter debug mode due to:
  // * external `debug_req_i`
  // * core in single step mode (dcsr.step == 1).
  // * trigger match (hardware breakpoint)
  //
  // `debug_req_i` and `do_single_step_d` request debug mode with priority. This results in a debug
  // mode entry even if the controller goes to `FLUSH` in preparation for handling an exception or
  // interrupt. `trigger_match_i` is not a priority entry into debug mode as it must be ignored
  // where control flow changes such that the instruction causing the trigger is no longer being
  // executed.
  // Set when an ebreak should enter debug mode rather than jump to exception
  // handler
  // NMI can be produced from an external (irq_nm_i top level input) or an internal (within
  // ibex_core) source. For internal sources the cause is specified via irq_nm_int_cause.
  // MIE bit only applies when in M mode
  // Interrupts including NMI are ignored,
  // - while in debug mode,
  // - while in NMI mode (nested NMIs are not supported, NMI has highest priority and
  //   cannot be interrupted by regular interrupts),
  // - while single stepping.
  // generate ID of fast interrupts, highest priority to lowest ID
  // Record the debug cause outside of the FSM
  // The decision to enter debug_mode and the write of the cause to DCSR happen
  // in seperate steps within the FSM. Hence, there are a small number of cycles
  // where a change in external stimulus can cause the cause to be recorded incorrectly.
  /////////////////////
  // Core controller //
  /////////////////////
    // Default values
    // The values of pc_mux and exc_pc_mux are only relevant if pc_set is set. Some of the states
    // below always set pc_mux and exc_pc_mux but only set pc_set if certain conditions are met.
    // This avoid having to factor those conditions into the pc_mux and exc_pc_mux select signals
    // helping timing.
        // copy boot address to instr fetch address
        // instruction in IF stage is already valid
        // we begin execution when an interrupt has arrived
        // normal execution flow
        // in debug mode or single step mode we leave immediately (wfi=nop)
          // Make sure clock remains disabled.
        // Stall because of IF miss
        // handle interrupts
          // We are handling an interrupt. Set halt_if to tell IF not to give
          // us any more instructions before it redirects to the handler, but
          // don't set flush_id: we must allow this instruction to complete
          // (since it might have outstanding loads or stores).
        // enter debug mode
          // Halt IF only for now, ID will be flushed in DBG_TAKEN_IF as the
          // ID state is needed for correct debug mode entry
        // normal operating mode of the ID stage, in case of debug and interrupt requests,
        // priorities are as follows (lower number == higher priority)
        // 1. currently running (multicycle) instructions and exceptions caused by these
        // 2. debug requests
        // 3. interrupt requests
        // Set PC mux for branch and jump here to ease timing. Value is only relevant if pc_set_o is
        // also set. Setting the mux value here avoids factoring in special_req and instr_valid_i
        // which helps timing.
        // Get ready for special instructions, exceptions, pipeline flushes
          // Halt IF but don't flush ID. This leaves a valid instruction in
          // ID so controller can determine appropriate action in the
          // FLUSH state.
          // Wait for the writeback stage to either be ready for a new instruction or raise its own
          // exception before going to FLUSH. If the instruction in writeback raises an exception it
          // must take priority over any exception from an instruction in ID/EX. Only once the
          // writeback stage is ready can we be certain that won't happen. Without a writeback
          // stage ready_wb_i == 1 so the FSM will always go directly to FLUSH.
          // Only set the PC if the branch predictor hasn't already done the branch for us
            // If the instruction is a branch that was predicted to be taken but was not taken
            // signal a mispredict.
        // If entering debug mode or handling an IRQ the core needs to wait until any instruction in
        // ID or WB has finished executing. Stall IF during that time.
            // enter debug mode
            // Halt IF only for now, ID will be flushed in DBG_TAKEN_IF as the
            // ID state is needed for correct debug mode entry
            // handle interrupt (not in debug mode)
            // We are handling an interrupt (not in debug mode). Set halt_if to
            // tell IF not to give us any more instructions before it redirects
            // to the handler, but don't set flush_id: we must allow this
            // instruction to complete (since it might have outstanding loads
            // or stores).
          // Prioritise interrupts as required by the architecture
            // generate exception cause ID from fast interrupt ID:
            // - first bit distinguishes interrupts from exceptions,
            // - second bit adds 16 to fast interrupt ID
            // for example ExcCauseIrqFast0 = {1'b1, 5'd16}
        // enter debug mode and save PC in IF to dpc
        // jump to debug exception handler in debug memory
        // enter debug mode
        // enter debug mode and save PC in ID to dpc, used when encountering
        // 1. EBREAK during debug mode
        // 2. EBREAK with forced entry into debug mode (ebreakm or ebreaku set).
        // regular ebreak's go through FLUSH.
        //
        // for 1. do not update dcsr and dpc, for 2. do so
        // jump to debug exception handler in debug memory
        // update dcsr and dpc
          // dpc (set to the address of the EBREAK, i.e. set to PC in ID stage)
          // dcsr
        // enter debug mode
        // flush the pipeline
        // As pc_mux and exc_pc_mux can take various values in this state they aren't set early
        // here.
        // exceptions: set exception PC, save PC and exception cause
        // exc_req_lsu is high for one clock cycle only (in DECODE)
            // With the writeback stage present whether an instruction accessing memory will cause
            // an exception is only known when it is in writeback. So when taking such an exception
            // epc must come from writeback.
          // Exception/fault prioritisation logic will have set exactly 1 X_prio signal
                // EBREAK enters debug mode when dcsr.ebreakm or dcsr.ebreaku is set and we're in
                // M or U mode respectively. If we're already in debug mode we re-enter debug mode.
                // If EBREAK won't enter debug mode (dcsr.ebreakm/u not set) then raise a breakpoint
                // exception.
          // special instructions and pipeline flushes
        // Entering debug mode due to either single step or debug_req. Ensure
        // registers are set for exception but then enter debug handler rather
        // than exception handler
        // Leave all other signals as is to ensure CSRs and PC get set as if
        // core was entering exception handler, entry to debug mode will then
        // see the appropriate state and setup dpc correctly.
        // If an EBREAK instruction is causing us to enter debug mode on the
        // same cycle as a debug_req or single step, honor the EBREAK and
        // proceed to DBG_TAKEN_ID, as it has the highest priority.
        //
        // cause==EBREAK    -> prio 3 (highest)
        // cause==debug_req -> prio 2
        // cause==step      -> prio 1 (lowest)
      // Hold halt_if high when instr_exec_i is low to stop accepting instructions from the IF stage
  // signal to CSR when in debug mode
  // signal to CSR when in an NMI handler (for nested exception handling)
  ///////////////////
  // Stall control //
  ///////////////////
  // If high current instruction cannot complete this cycle. Either because it needs more cycles to
  // finish (stall_id_i) or because the writeback stage cannot accept it yet (stall_wb_i). If there
  // is no writeback stage stall_wb_i is a constant 0.
  // signal to IF stage that ID stage is ready for next instr
  // kill instr in IF-ID pipeline reg that are done, or if a
  // multicycle instr causes an exception for example
  // retain_id is another kind of stall, where the instr_valid bit must remain
  // set (unless flush_id is set also). It cannot be factored directly into
  // stall as this causes a combinational loop.
  // update registers
  //////////
  // FCOV //
  //////////
  ////////////////
  // Assertions //
  ////////////////
  // Selectors must be known/valid.
    // If something that causes a jump into an exception handler is seen that jump must occur before
    // the next instruction executes. The logic tracks whether a jump into an exception handler is
    // expected. Assertions check the jump occurs.
    // Any exception rquest will cause a transition out of DECODE, once the controller transitions
    // back into DECODE we're done handling the request.
    // An exception PC set uses specific PC types
        // Keep `exception_req_pending` asserted once an exception_req is seen until it is done
        // The exception req has been accepted once the controller transitions out of decode
        // Set `expect_exception_pc_set` if exception req needs one and keep it asserted until
        // exception req is done
        // Keep `seen_exception_pc_set` asserted once an exception PC set is seen until the
        // exception req is done
    // Once an exception request has been accepted it must be handled before controller goes back to
    // DECODE
    // Only signal ready, allowing a new instruction into ID, if there is no exception request
    // pending or it is done this cycle.
    // Once a PC set has been performed for an exception request there must not be any other
    // excepting those to move into debug mode.
    // When an exception request is done there must have been an appropriate PC set (either this
    // cycle or a previous one).
    // If there's a pending exception req that doesn't need a PC set we must not see one
    // Workaround for internal verilator error when using hierarchical refers to calcuate this
    // directly in ibex_core

module ibex_controller #(
  parameter bit WritebackStage  = 1'b0,
  parameter bit BranchPredictor = 1'b0,
  parameter bit MemECC          = 1'b0
 ) (
  input  logic                  clk_i,
  input  logic                  rst_ni,

  output logic                  ctrl_busy_o,             // core is busy processing instrs

  // decoder related signals
  input  logic                  illegal_insn_i,          // decoder has an invalid instr
  input  logic                  ecall_insn_i,            // decoder has ECALL instr
  input  logic                  mret_insn_i,             // decoder has MRET instr
  input  logic                  dret_insn_i,             // decoder has DRET instr
  input  logic                  wfi_insn_i,              // decoder has WFI instr
  input  logic                  ebrk_insn_i,             // decoder has EBREAK instr
  input  logic                  csr_pipe_flush_i,        // do CSR-related pipeline flush

  // instr from IF-ID pipeline stage
  input  logic                  instr_valid_i,           // instr is valid
  input  logic [31:0]           instr_i,                 // uncompressed instr data for mtval
  input  logic [15:0]           instr_compressed_i,      // instr compressed data for mtval
  input  logic                  instr_is_compressed_i,   // instr is compressed
  input  logic                  instr_bp_taken_i,        // instr was predicted taken branch
  input  logic                  instr_fetch_err_i,       // instr has error
  input  logic                  instr_fetch_err_plus2_i, // instr error is x32
  input  logic [31:0]           pc_id_i,                 // instr address

  // to IF-ID pipeline stage
  output logic                  instr_valid_clear_o,     // kill instr in IF-ID reg
  output logic                  id_in_ready_o,           // ID stage is ready for new instr
  output logic                  controller_run_o,        // Controller is in standard instruction
                                                         // run mode
  input  logic                  instr_exec_i,            // Execution control, when clear ID/EX
                                                         // stage stops accepting instructions from
                                                         // IF
  // to prefetcher
  output logic                  instr_req_o,             // start fetching instructions
  output logic                  pc_set_o,                // jump to address set by pc_mux
  output ibex_pkg::pc_sel_e     pc_mux_o,                // IF stage fetch address selector
                                                         // (boot, normal, exception...)
  output logic                  nt_branch_mispredict_o,  // Not-taken branch in ID/EX was
                                                         // mispredicted (predicted taken)
  output ibex_pkg::exc_pc_sel_e exc_pc_mux_o,            // IF stage selector for exception PC
  output ibex_pkg::exc_cause_t  exc_cause_o,             // for IF stage, CSRs

  // LSU
  input  logic [31:0]           lsu_addr_last_i,         // for mtval
  input  logic                  load_err_i,
  input  logic                  store_err_i,
  input  logic                  mem_resp_intg_err_i,
  output logic                  wb_exception_o,          // Instruction in WB taking an exception
  output logic                  id_exception_o,          // Instruction in ID taking an exception

  // jump/branch signals
  input  logic                  branch_set_i,            // branch set signal (branch definitely
                                                         // taken)
  input  logic                  branch_not_set_i,        // branch is definitely not taken
  input  logic                  jump_set_i,              // jump taken set signal

  // interrupt signals
  input  logic                  csr_mstatus_mie_i,       // M-mode interrupt enable bit
  input  logic                  irq_pending_i,           // interrupt request pending
  input  ibex_pkg::irqs_t       irqs_i,                  // interrupt requests qualified with
                                                         // mie CSR
  input  logic                  irq_nm_ext_i,            // non-maskeable interrupt
  output logic                  nmi_mode_o,              // core executing NMI handler

  // debug signals
  input  logic                  debug_req_i,
  output ibex_pkg::dbg_cause_e  debug_cause_o,
  output logic                  debug_csr_save_o,
  output logic                  debug_mode_o,
  output logic                  debug_mode_entering_o,
  input  logic                  debug_single_step_i,
  input  logic                  debug_ebreakm_i,
  input  logic                  debug_ebreaku_i,
  input  logic                  trigger_match_i,

  output logic                  csr_save_if_o,
  output logic                  csr_save_id_o,
  output logic                  csr_save_wb_o,
  output logic                  csr_restore_mret_id_o,
  output logic                  csr_restore_dret_id_o,
  output logic                  csr_save_cause_o,
  output logic [31:0]           csr_mtval_o,
  input  ibex_pkg::priv_lvl_e   priv_mode_i,

  // stall & flush signals
  input  logic                  stall_id_i,
  input  logic                  stall_wb_i,
  output logic                  flush_id_o,
  input  logic                  ready_wb_i,

  // performance monitors
  output logic                  perf_jump_o,             // we are executing a jump
                                                         // instruction (j, jr, jal, jalr)
  output logic                  perf_tbranch_o           // we are executing a taken branch
                                                         // instruction
);
