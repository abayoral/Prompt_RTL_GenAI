module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] lower_sum, upper_sum;
    wire carry_out_lower;

    // Instantiate the lower 16-bit adder
    add16 lower_adder(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(lower_sum),
        .cout(carry_out_lower)
    );

    // Instantiate the upper 16-bit adder
    add16 upper_adder(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry_out_lower),
        .sum(upper_sum),
        .cout()
    );

    // Combine the results to form the 32-bit sum
    assign sum = {upper_sum, lower_sum};
endmodule