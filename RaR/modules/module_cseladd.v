module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_low, sum_high0, sum_high1;
    wire cout_low, cout_high0, cout_high1;

    // Lower 16 bits addition with carry-in = 0
    add16 u1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_low),
        .cout(cout_low)
    );

    // Upper 16 bits addition with carry-in = 0
    add16 u2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_high0),
        .cout(cout_high0)
    );

    // Upper 16 bits addition with carry-in = 1
    add16 u3 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_high1),
        .cout(cout_high1)
    );

    // Select the correct upper 16 bits sum based on cout_low
    assign sum[15:0] = sum_low;
    assign sum[31:16] = cout_low ? sum_high1 : sum_high0;

endmodule