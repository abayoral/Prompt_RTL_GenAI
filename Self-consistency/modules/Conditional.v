module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);

    wire [7:0] min_ab, min_cd;

    // Two-way min circuits
    assign min_ab = (a < b) ? a : b;
    assign min_cd = (c < d) ? c : d;

    // Four-way min circuit
    assign min = (min_ab < min_cd) ? min_ab : min_cd;

endmodule