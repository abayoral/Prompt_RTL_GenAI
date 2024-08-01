module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout16;

    // Instantiate the first 16-bit adder for lower 16 bits
    add16 lower_add16 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),       // No carry-in for the lower 16 bits
        .sum(sum[15:0]),
        .cout(cout16)
    );

    // Instantiate the second 16-bit adder for upper 16 bits
    add16 upper_add16 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout16),     // Carry from the lower 16 bits
        .sum(sum[31:16]),
        .cout()           // We don't care about the final carry-out
    );

endmodule