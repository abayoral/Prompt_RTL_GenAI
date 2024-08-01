module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_xor_sub;
    wire cout1, cout2;
    wire [15:0] sum1, sum2, sum3, sum4;

    // 32-bit wide XOR gate to invert b when sub is 1
    assign b_xor_sub = b ^ {32{sub}};

    // Instantiate the 16-bit adders
    add16 U1 (a[15:0], b_xor_sub[15:0], sub, sum1, cout1);
    add16 U2 (a[31:16], b_xor_sub[31:16], cout1, sum2, cout2);

    // Combine the results
    assign sum = {sum2, sum1};

endmodule