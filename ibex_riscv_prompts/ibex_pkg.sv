// Copyright lowRISC contributors.
// Copyright 2017 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  ////////////////
  // IO Structs //
  ////////////////
  /////////////////////
  // Parameter Enums //
  /////////////////////
  /////////////
  // Opcodes //
  /////////////
  ////////////////////
  // ALU operations //
  ////////////////////
    // Arithmetics
    // Logics
    // RV32B
    // Shifts
    // RV32B
    // Address Calculations
    // RV32B
    // Comparisons
    // RV32B
    // Pack
    // RV32B
    // Sign-Extend
    // RV32B
    // Bitcounting
    // RV32B
    // Set lower than
    // Ternary Bitmanip Operations
    // RV32B
    // Single-Bit Operations
    // RV32B
    // Bit Compress / Decompress
    // RV32B
    // Bit Field Place
    // RV32B
    // Carry-less Multiply
    // RV32B
    // Cyclic Redundancy Check
    // Multiplier/divider
  //////////////////////////////////
  // Control and status registers //
  //////////////////////////////////
  // CSR operations
  // Privileged mode
  // Constants for the dcsr.xdebugver fields
  //////////////
  // WB stage //
  //////////////
  // Type of instruction present in writeback stage
  //////////////
  // ID stage //
  //////////////
  // Operand a selection
  // Immediate a selection
  // Operand b selection
  // Immediate b selection
  // Regfile write data selection
  // Controller FSM state encoding
  //////////////
  // IF stage //
  //////////////
  // PC mux selection
  // Exception PC mux selection
  // Interrupt requests
                          // one interrupt is reserved for NMI (not visible through mip/mie)
  // Internal NMI cause
  // Debug cause
  // ICache constants
  // ICache Scrambling Parameters
  // PMP constants
  // PMP acces type
  // PMP cfg structures
  // Machine Security Configuration (ePMP)
  // CSRs
    // Machine information
    // Machine trap setup
    // Machine trap handling
    // Physical memory protection
    // ePMP control
    // Debug trigger
    // Debug/trace
    // Debug
    // Machine Counter/Timers
  // CSR pmp-related offsets
  // CSR status bits
  // CSR machine ISA
  // CSR interrupt pending/enable bits
  // CSR Machine Security Configuration bits
  // Vendor ID
  // No JEDEC ID has been allocated to lowRISC so the value is 0 to indicate the field is not
  // implemented
  // Architecture ID
  // Top bit is unset to indicate an open source project. The lower bits are an ID allocated by the
  // RISC-V Foundation. Note this is allocated specifically to Ibex, should significant changes be
  // made a different architecture ID should be supplied.
  // Implementation ID
  // 0 indicates this field is not implemeted. Ibex implementors may wish to indicate an RTL/netlist
  // version here using their own unique encoding (e.g. 32 bits of the git hash of the implemented
  // commit).
  // Machine Configuration Pointer
  // 0 indicates the configuration data structure does not eixst. Ibex implementors may wish to
  // alter this to point to their system specific configuration data structure.
  // These LFSR parameters have been generated with
  // $ opentitan/util/design/gen-lfsr-seed.py --width 32 --seed 2480124384 --prefix ""
  // Mult-bit signal used for security hardening. For non-secure implementation all bits other than
  // the bottom bit are ignored.
  // Note that if adjusting these parameters it is assumed the bottom bit is set for On and unset
  // for Off. This allows the use of IbexMuBiOn/IbexMuBiOff to work for both secure and non-secure
  // Ibex. If this assumption is broken the RTL that uses ibex_mubi_t types such as the fetch_enable
  // and core_busy signals within `ibex_core` may need adjusting.

