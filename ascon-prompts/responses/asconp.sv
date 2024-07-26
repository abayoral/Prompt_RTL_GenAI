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

// Core registers
logic [63:0] x0_aff1, x0_chi, x0_aff2;
logic [63:0] x1_aff1, x1_chi, x1_aff2;
logic [63:0] x2_aff1, x2_chi, x2_aff2;
logic [63:0] x3_aff1, x3_chi, x3_aff2;
logic [63:0] x4_aff1, x4_chi, x4_aff2;
logic [63:0] x0, x1, x2, x3, x4, t;

// Round constants for UROL rounds
localparam logic [63:0] RC [0:11] = '{64'hF0, 64'hE1, 64'hD2, 64'hC3, 64'hB4, 64'hA5, 64'h96, 64'h87, 64'h78, 64'h69, 64'h5A, 64'h4B};

// Initial assignments for input signals
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        x0 <= 64'b0;
        x1 <= 64'b0;
        x2 <= 64'b0;
        x3 <= 64'b0;
        x4 <= 64'b0;
    end else begin
        x0 <= x0_i;
        x1 <= x1_i;
        x2 <= x2_i;
        x3 <= x3_i;
        x4 <= x4_i;
    end
end

// Ascon-p permutation rounds
generate
    genvar i;
    for (i = 0; i < UROL; i = i + 1) begin : rounds
        // 1st affine layer
        always_comb begin
            x0_aff1 = x0 ^ RC[round_cnt];
            x1_aff1 = x1;
            x2_aff1 = x2;
            x3_aff1 = x3;
            x4_aff1 = x4;
        end

        // Non-linear chi layer
        always_comb begin
            x0_chi = x0_aff1 ^ (~x1_aff1 & x2_aff1);
            x1_chi = x1_aff1 ^ (~x2_aff1 & x3_aff1);
            x2_chi = x2_aff1 ^ (~x3_aff1 & x4_aff1);
            x3_chi = x3_aff1 ^ (~x4_aff1 & x0_aff1);
            x4_chi = x4_aff1 ^ (~x0_aff1 & x1_aff1);
        end

        // 2nd affine layer
        always_comb begin
            x0_aff2 = x0_chi;
            x1_aff2 = x1_chi;
            x2_aff2 = x2_chi;
            x3_aff2 = x3_chi;
            x4_aff2 = x4_chi;
        end

        // Linear diffusion layer
        always_ff @(posedge clk or posedge rst) begin
            if (rst) begin
                x0 <= 64'b0;
                x1 <= 64'b0;
                x2 <= 64'b0;
                x3 <= 64'b0;
                x4 <= 64'b0;
            end else begin
                x0 <= x0_aff2 ^ (x0_aff2 >> 19) ^ (x0_aff2 >> 28);
                x1 <= x1_aff2 ^ (x1_aff2 >> 61) ^ (x1_aff2 >> 39);
                x2 <= x2_aff2 ^ (x2_aff2 >> 1) ^ (x2_aff2 >> 6);
                x3 <= x3_aff2 ^ (x3_aff2 >> 10) ^ (x3_aff2 >> 17);
                x4 <= x4_aff2 ^ (x4_aff2 >> 7) ^ (x4_aff2 >> 41);
            end
        end
    end
endgenerate

// Final assignments for output signals
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        x0_o <= 64'b0;
        x1_o <= 64'b0;
        x2_o <= 64'b0;
        x3_o <= 64'b0;
        x4_o <= 64'b0;
    end else begin
        x0_o <= x0;
        x1_o <= x1;
        x2_o <= x2;
        x3_o <= x3;
        x4_o <= x4;
    end
end

endmodule
