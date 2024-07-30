module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_lower;
    wire [15:0] sum_upper;
    wire carry_out_lower;

    // Instantiate the first add16 module for the lower 16 bits
    add16 lower_adder (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0), // No initial carry-in
        .sum(sum_lower),
        .cout(carry_out_lower)
    );

    // Instantiate the second add16 module for the upper 16 bits
    add16 upper_adder (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry_out_lower), // Carry-out from the lower to carry-in of upper
        .sum(sum_upper),
        .cout() // Carry-out is not used
    );

    // Combine the lower and upper sums into a full 32-bit result
    assign sum = {sum_upper, sum_lower};
endmodule