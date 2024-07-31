module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum0, sum1;
    wire [15:0] sum_low, sum_high0, sum_high1;
    wire cout0, cout1;

    // Lower 16-bit addition
    add16 u0(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .sum(sum0),
        .cout(cout0)
    );

    // Upper 16-bit addition assuming carry-in is 0
    add16 u1(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(0),
        .sum(sum_high0),
        .cout()
    );

    // Upper 16-bit addition assuming carry-in is 1
    add16 u2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1),
        .sum(sum_high1),
        .cout()
    );

    // Select the correct upper 16-bit sum based on the lower addition carry-out
    mux2to1_16bit mux_high(
        .in0(sum_high0),
        .in1(sum_high1),
        .sel(cout0),
        .out(sum[31:16])
    );

    // Connect the lower 16-bit sum
    assign sum[15:0] = sum0;

endmodule