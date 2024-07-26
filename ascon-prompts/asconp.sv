//Generate a Verilog module named asconp implementing the Ascon permutation (Ascon-p) with the following details: core registers for x0_aff1, x0_chi, x0_aff2, x1_aff1, x1_chi, x1_aff2, x2_aff1, x2_chi, x2_aff2, x3_aff1, x3_chi, x3_aff2, x4_aff1, x4_chi, x4_aff2, x0, x1, x2, x3, x4, and t. Implement the 1st affine layer, non-linear chi layer, 2nd affine layer, and linear layer within a generate loop for UROL rounds per clock cycle. Include initial assignments for input signals and final assignments for output signals.

module asconp (
    input  logic [ 3:0] round_cnt,
    input  logic [63:0] x0_i,
    input  logic [63:0] x1_i,
    input  logic [63:0] x2_i,
    input  logic [63:0] x3_i,
    input  logic [63:0] x4_i,
    output logic [63:0] x0_o,
    output logic [63:0] x1_o,
    output logic [63:0] x2_o,
    output logic [63:0] x3_o,
    output logic [63:0] x4_o
);
