module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    // Intermediate 16-bit signals
    wire [15:0] sum_lower, sum_upper;
    wire cout_lower, cout_upper;
    wire [15:0] b_lower, b_upper;

    // XOR b with sub (1=add, 0=subtract) for inversion
    assign b_lower = b[15:0] ^ {16{sub}};
    assign b_upper = b[31:16] ^ {16{sub}};

    // Instantiate two 16-bit adders
    add16 adder_lower (
        .a(a[15:0]),
        .b(b_lower),
        .cin(sub),
        .sum(sum_lower),
        .cout(cout_lower)
    );

    add16 adder_upper (
        .a(a[31:16]),
        .b(b_upper),
        .cin(cout_lower),
        .sum(sum_upper),
        .cout(cout_upper)
    );

    // Combine the 16-bit sums into the 32-bit sum output
    assign sum = {sum_upper, sum_lower};

endmodule