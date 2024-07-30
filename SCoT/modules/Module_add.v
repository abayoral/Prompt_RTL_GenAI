module top_module (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] sum
);
    // Intermediate signals for the carry-out and partial sums
    wire [15:0] sum_lower16;
    wire [15:0] sum_upper16;
    wire cout1;

    // Instantiate the first 16-bit adder for the lower part
    add16 adder1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),   // No initial carry-in
        .sum(sum_lower16),
        .cout(cout1)
    );

    // Instantiate the second 16-bit adder for the upper part
    add16 adder2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout1),  // Carry-out from the first adder
        .sum(sum_upper16),
        .cout()       // Carry-out not used for final 32-bit adder
    );

    // Concatenate the lower and upper 16-bit sums into the final 32-bit sum
    assign sum = {sum_upper16, sum_lower16};

endmodule