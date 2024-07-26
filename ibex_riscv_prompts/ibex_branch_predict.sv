//Please, design a branch-predict verilog module for 32-nit ibex RISC-V CPU. 
  // Provide short internal name for fetch_rdata_i due to reduce line wrapping
  // Extract and sign-extend to 32-bit the various immediates that may be used to calculate the
  // target
  // Uncompressed immediates
  // Compressed immediates
  // Determine if the instruction is a branch or a jump
  // Uncompressed branch/jump
  // Compressed branch/jump
  // Select out the branch offset for target calculation based upon the instruction type
  // Determine branch prediction, taken if offset is negative
  // Always predict jumps taken otherwise take prediction from `instr_b_taken`
  // Calculate target

module ibex_branch_predict (
  input  logic clk_i,
  input  logic rst_ni,

  // Instruction from fetch stage
  input  logic [31:0] fetch_rdata_i,
  input  logic [31:0] fetch_pc_i,
  input  logic        fetch_valid_i,

  // Prediction for supplied instruction
  output logic        predict_branch_taken_o,
  output logic [31:0] predict_branch_pc_o
);
