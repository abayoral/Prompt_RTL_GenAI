module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum0, sum1;
    wire cout0, cout1, cout_sel;

    // First 16-bit adder for least significant 16 bits, assuming carry-in is 0
    add16 u1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(cout_sel)
    );

    // Second 16-bit adder for most significant 16 bits, assuming carry-in is 0
    add16 u2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum0),
        .cout(cout0)
    );

    // Third 16-bit adder for most significant 16 bits, assuming carry-in is 1
    add16 u3 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum1),
        .cout(cout1)
    );

    // 16-bit 2-to-1 multiplexer to choose correct sum based on cout_sel
    mux2to1 u4 (
        .in0(sum0),
        .in1(sum1),
        .sel(cout_sel),
        .out(sum[31:16])
    );

endmodule