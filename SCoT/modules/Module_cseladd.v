module top_module (
    input wire [31:0] a,
    input wire [31:0] b,
    input wire cin,  // initial carry-in
    output wire [31:0] sum,
    output wire cout
);
    wire [15:0] lower_sum, upper_sum0, upper_sum1;
    wire lower_cout, upper_cout0, upper_cout1;

    // Instantiating add16 for the lower 16 bits
    add16 lower_add (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(cin),
        .sum(lower_sum),
        .cout(lower_cout)
    );

    // Instantiating add16 for the upper 16 bits with carry-in 0
    add16 upper_add0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(upper_sum0),
        .cout(upper_cout0)
    );

    // Instantiating add16 for the upper 16 bits with carry-in 1
    add16 upper_add1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(upper_sum1),
        .cout(upper_cout1)
    );

    // Multiplexer to choose the correct upper sum and carry-out based on lower_cout
    assign {cout, sum[31:16]} = lower_cout ? {upper_cout1, upper_sum1} : {upper_cout0, upper_sum0};
    assign sum[15:0] = lower_sum;

endmodule