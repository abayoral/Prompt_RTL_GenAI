module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry16;

    // Instantiate two 16-bit adders
    add16 lower_adder (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(carry16)
    );

    add16 upper_adder (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry16),
        .sum(sum[31:16]),
        .cout() // Ignore carry-out
    );
endmodule