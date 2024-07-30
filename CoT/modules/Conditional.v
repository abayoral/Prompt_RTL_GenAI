module top_module (
    input [7:0] a, b, c, d,  // 8-bit inputs
    output [7:0] min         // 8-bit output
);

    // Intermediate signals to hold results of two-way min comparisons
    wire [7:0] min_ab;
    wire [7:0] min_cd;
    wire [7:0] final_min;

    // First level of comparisons: Find min between 'a' and 'b', and between 'c' and 'd'
    assign min_ab = (a < b) ? a : b;
    assign min_cd = (c < d) ? c : d;

    // Final comparison to find the minimum of min_ab and min_cd
    assign final_min = (min_ab < min_cd) ? min_ab : min_cd;

    // Assign final minimum result to the output
    assign min = final_min;

endmodule