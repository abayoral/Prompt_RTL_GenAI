//Please, design a compressed_decoder verilog module for 32-nit ibex RISC-V CPU. 
  // valid_i indicates if instr_i is valid and is used for assertions only.
  // The following signal is used to avoid possible lint errors.
  ////////////////////////
  // Compressed decoder //
  ////////////////////////
    // By default, forward incoming instruction, mark it as legal.
    // Check if incoming instruction is compressed.
      // C0
            // c.addi4spn -> addi rd', x2, imm
            // c.lw -> lw rd', imm(rs1')
            // c.sw -> sw rs2', imm(rs1')
      // C1
      //
      // Register address checks for RV32E are performed in the regular instruction decoder.
      // If this check fails, an illegal instruction exception is triggered and the controller
      // writes the actual faulting instruction to mtval.
            // c.addi -> addi rd, rd, nzimm
            // c.nop
            // 001: c.jal -> jal x1, imm
            // 101: c.j   -> jal x0, imm
            // c.li -> addi rd, x0, nzimm
            // (c.li hints are translated into an addi hint)
            // c.lui -> lui rd, imm
            // (c.lui hints are translated into a lui hint)
              // c.addi16sp -> addi x2, x2, nzimm
                // 00: c.srli -> srli rd, rd, shamt
                // 01: c.srai -> srai rd, rd, shamt
                // (c.srli/c.srai hints are translated into a srli/srai hint)
                // c.andi -> andi rd, rd, imm
                    // c.sub -> sub rd', rd', rs2'
                    // c.xor -> xor rd', rd', rs2'
                    // c.or  -> or  rd', rd', rs2'
                    // c.and -> and rd', rd', rs2'
                    // 100: c.subw
                    // 101: c.addw
            // 0: c.beqz -> beq rs1', x0, imm
            // 1: c.bnez -> bne rs1', x0, imm
      // C2
      //
      // Register address checks for RV32E are performed in the regular instruction decoder.
      // If this check fails, an illegal instruction exception is triggered and the controller
      // writes the actual faulting instruction to mtval.
            // c.slli -> slli rd, rd, shamt
            // (c.ssli hints are translated into a slli hint)
            // c.lwsp -> lw rd, imm(x2)
                // c.mv -> add rd/rs1, x0, rs2
                // (c.mv hints are translated into an add hint)
                // c.jr -> jalr x0, rd/rs1, 0
                // c.add -> add rd, rd, rs2
                // (c.add hints are translated into an add hint)
                  // c.ebreak -> ebreak
                  // c.jalr -> jalr x1, rs1, 0
            // c.swsp -> sw rs2, imm(x2)
      // Incoming instruction is not compressed.
  ////////////////
  // Assertions //
  ////////////////
  // The valid_i signal used to gate below assertions must be known.
  // Selectors must be known/valid.

module ibex_compressed_decoder (
  input  logic        clk_i,
  input  logic        rst_ni,
  input  logic        valid_i,
  input  logic [31:0] instr_i,
  output logic [31:0] instr_o,
  output logic        is_compressed_o,
  output logic        illegal_instr_o
);
