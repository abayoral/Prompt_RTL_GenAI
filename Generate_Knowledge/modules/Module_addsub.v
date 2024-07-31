module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_xor_sub;
    wire cout1, cout2;

    // XOR b with the replicated sub signal
    assign b_xor_sub = b ^ {32{sub}};

    // Instantiate the first 16-bit adder
    add16 u1 (
        .a(a[15:0]),
        .b(b_xor_sub[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(cout1)
    );

    // Instantiate the second 16-bit adder
    add16 u2 (
        .a(a[31:16]),
        .b(b_xor_sub[31:16]),
        .cin(cout1),
        .sum(sum[31:16]),
        .cout(cout2)
    );

endmodule