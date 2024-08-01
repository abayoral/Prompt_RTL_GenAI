module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min
);

    // Define variables to hold intermediate results
    wire [7:0] min_ab, min_cd;

    // Create two-way comparison circuits using the conditional operator
    assign min_ab = (a < b) ? a : b;
    assign min_cd = (c < d) ? c : d;

    // Combine the intermediate comparisons to create a 4-way min circuit
    assign min = (min_ab < min_cd) ? min_ab : min_cd;

endmodule