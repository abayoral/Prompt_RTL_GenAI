module top_module(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire cin,
    output wire [15:0] sum,
    output wire cout
);

    // Declare intermediate carry signals
    wire c1, c2, c3;

    // First 4-bit BCD adder instance
    bcd_fadd u1 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(c1)
    );

    // Second 4-bit BCD adder instance
    bcd_fadd u2 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c1),
        .sum(sum[7:4]),
        .cout(c2)
    );

    // Third 4-bit BCD adder instance
    bcd_fadd u3 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(c2),
        .sum(sum[11:8]),
        .cout(c3)
    );

    // Fourth 4-bit BCD adder instance
    bcd_fadd u4 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(c3),
        .sum(sum[15:12]),
        .cout(cout)
    );

endmodule