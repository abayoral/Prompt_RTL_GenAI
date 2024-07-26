// Copyright lowRISC contributors.
// Copyright 2017 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
  // instruction masks (for tracer)
  // BRANCH
  // OPIMM
  // OP
  // SYSTEM
  // RV32M
  // RV32B
  // ZBA
  // ZBB
  // Only log2(XLEN) bits of the immediate are used. For RV32, this means only the bits in
  // instr[24:20] are effectively used. Whenever instr[26] is set, sroi/rori is instead decoded as
  // fsri.
  // The zext.h and zext.b pseudo-instructions are defined in the ratified v.1.0.0 and draft v.0.94
  // specifications of the bitmanip extension, respectively. They are currently not emitted by the
  // tracer due to a lack of support in the LLVM and GCC toolchains. Enabling this functionality
  // when the time is right is tracked in https://github.com/lowRISC/ibex/issues/1228
  // zext.b -- pseudo-instruction: andi rd, rs 255
  // parameter logic [31:0] INSN_ZEXTB =
  //     { 4'b0000, 8'b11111111, 5'h?, 3'b111, 5'h?, {OPCODE_OP_IMM} };
  // zext.h -- pseudo-instruction: pack rd, rs zero
  // parameter logic [31:0] INSN_ZEXTH = { 7'b0000100, 5'b00000, 5'h?, 3'b100, 5'h?, {OPCODE_OP} };
  // ZBS
  // Only log2(XLEN) bits of the immediate are used. For RV32, this means only the bits in
  // instr[24:20] are effectively used. Whenever instr[26] is set, bexti is instead decoded as fsri.
  // ZBP
  // grevi
  // Only log2(XLEN) bits of the immediate are used. For RV32, this means only the bits in
  // instr[24:20] are effectively used. Whenever instr[26] is set, grevi is instead decoded as fsri.
  // grevi -- pseudo-instructions
  // gorci
  // Only log2(XLEN) bits of the immediate are used. For RV32, this means only the bits in
  // instr[24:20] are effectively used. Whenever instr[26] is set, gorci is instead decoded as fsri.
  // gorci -- pseudo-instructions
  // shfli
  // shfli -- pseudo-instructions
  // unshfli
  // unshfli -- pseudo-instructions
  // Only log2(XLEN) bits of the immediate are used. For RV32, this means only the bits in
  // instr[24:20] are effectively used. Whenever instr[26] is set, sroi/rori is instead decoded as
  // fsri.
  // ZBE
  // ZBT
  // ZBF
  // ZBC
  // ZBR
  // LOAD & STORE
  // MISC-MEM
  // Compressed Instructions
  // C0
  // C1
  // C2

