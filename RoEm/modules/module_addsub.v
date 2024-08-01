module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] sum_lower, sum_upper;
    wire cout_lower, cout_upper;
    wire [31:0] b_xor_sub;

    assign b_xor_sub = b ^ {32{sub}}; // Apply XOR with sub across all 32 bits of b

    // Instantiating the 16-bit adders
    add16 adder_lower (
        .a(a[15:0]),
        .b(b_xor_sub[15:0]),
        .cin(sub),
        .sum(sum_lower),
        .cout(cout_lower)
    );

    add16 adder_upper (
        .a(a[31:16]),
        .b(b_xor_sub[31:16]),
        .cin(cout_lower),
        .sum(sum_upper),
        .cout(cout_upper)
    );

    assign sum = {sum_upper, sum_lower};

endmodule