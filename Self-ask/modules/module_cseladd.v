module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum0, sum1, sum_lsb;
    wire cout0, cout1, cout_lsb;

    // First 16-bit adder with carry in 0
    add16 adder0 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_lsb),
        .cout(cout_lsb)
    );

    // Second 16-bit adder for higher part with carry in 0
    add16 adder1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum0),
        .cout(cout0)
    );

    // Third 16-bit adder for higher part with carry in 1
    add16 adder2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum1),
        .cout(cout1)
    );

    // 16-bit 2-to-1 multiplexer to select the correct sum and carry
    mux2to1_16bit mux (
        .in0(sum0),
        .in1(sum1),
        .sel(cout_lsb),
        .out(sum[31:16])
    );

    // Assign lower part of the sum
    assign sum[15:0] = sum_lsb;

endmodule