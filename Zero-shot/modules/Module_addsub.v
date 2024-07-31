module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_xor_sub;
    wire cout1, cout2;
    wire [15:0] sum_lower, sum_upper;

    // XOR b with sub
    assign b_xor_sub = b ^ {32{sub}};

    // First 16-bit addition (lower 16 bits)
    add16 u1 (
        .a(a[15:0]),
        .b(b_xor_sub[15:0]),
        .cin(sub),             // Carry-in is sub
        .sum(sum_lower),
        .cout(cout1)
    );

    // Second 16-bit addition (upper 16 bits)
    add16 u2 (
        .a(a[31:16]),
        .b(b_xor_sub[31:16]),
        .cin(cout1),           // Carry-in from the previous addition
        .sum(sum_upper),
        .cout(cout2)
    );

    // Concatenate the results
    assign sum = {sum_upper, sum_lower};

endmodule