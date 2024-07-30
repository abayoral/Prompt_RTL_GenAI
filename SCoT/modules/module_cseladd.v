module top_module (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] sum
);
    // Intermediate signals
    wire [15:0] sum_lower;
    wire carry_lower;
    wire [15:0] sum_upper_1, sum_upper_2;
    wire carry_upper_1, carry_upper_2;
    wire [15:0] sum_upper;

    // Instantiate 16-bit adder for lower 16 bits
    adder_16bit adder1 (
        .A(a[15:0]),
        .B(b[15:0]),
        .Sum(sum_lower),
        .Carry(carry_lower)
    );

    // Instantiate 16-bit adder for upper 16 bits without carry
    adder_16bit adder2 (
        .A(a[31:16]),
        .B(b[31:16]),
        .Sum(sum_upper_1),
        .Carry(carry_upper_1)
    );

    // Instantiate 16-bit adder for upper 16 bits with carry
    adder_16bit adder3 (
        .A(a[31:16]),
        .B(b[31:16]),
        .Sum(sum_upper_2),
        .Carry(carry_upper_2)
    );

    // Instantiate 16-bit 2-to-1 multiplexer
    mux_2to1_16bit mux (
        .A({carry_upper_1, sum_upper_1[15:1]}), // Adjusted to handle carry propagation
        .B(sum_upper_2),
        .sel(carry_lower),
        .Y(sum_upper)
    );

    // Combine lower and upper sums to form a 32-bit sum output
    assign sum = {sum_upper, sum_lower};

endmodule