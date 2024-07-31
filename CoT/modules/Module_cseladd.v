module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_low;
    wire cout_low;
    wire [15:0] sum_high0, sum_high1;
    wire cout_high0, cout_high1;

    // Lower 16-bit addition
    add16 adder_low (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .sum(sum_low),
        .cout(cout_low)
    );

    // Upper 16-bit addition with carry-in = 0
    add16 adder_high0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(0),
        .sum(sum_high0),
        .cout(cout_high0)
    );

    // Upper 16-bit addition with carry-in = 1
    add16 adder_high1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1),
        .sum(sum_high1),
        .cout(cout_high1)
    );

    // 16-bit 2-to-1 multiplexer to select the correct upper sum and cout based on cout_low
    mux_16bit_2to1 mux_high (
        .in0(sum_high0),
        .in1(sum_high1),
        .sel(cout_low),
        .out(sum[31:16])
    );

    // Concatenate the lower and upper sums
    assign sum[15:0] = sum_low;

endmodule