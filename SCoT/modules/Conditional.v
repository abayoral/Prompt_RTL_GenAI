module top_module (
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [7:0] c,
    input wire [7:0] d,
    output wire [7:0] min
);
    // Define intermediate wire vectors
    wire [7:0] min_ab;
    wire [7:0] min_cd;
    wire [7:0] min_ab_cd;

    // Stepwise comparison to find the minimum
    assign min_ab = (a < b) ? a : b;
    assign min_cd = (c < d) ? c : d;
    assign min_ab_cd = (min_ab < min_cd) ? min_ab : min_cd;

    // Assign final minimum to output
    assign min = min_ab_cd;

endmodule