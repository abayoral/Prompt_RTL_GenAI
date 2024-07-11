module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] inverted_b1, inverted_b2;
    wire [15:0] sum1, sum2, sum3, sum4, c1, c2, c3, c4;

    assign inverted_b1 = b[15:0] ^ {16{sub}};
    assign inverted_b2 = b[31:16] ^ {16{sub}};

    add16 adder1(.a(a[15:0]), .b(inverted_b1), .cin(sub), .sum(sum1), .cout(c1));
    add16 adder2(.a(a[31:16]), .b(inverted_b2), .cin(c1), .sum(sum2), .cout(c2));

    assign {sum[31:16], sum[15:0]} = {sum2, sum1};

endmodule