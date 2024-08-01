module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [15:0] sum1, sum2;
    wire cout1, cout2;
    wire [31:0] inverted_b;

    // create xor gate to Invert b whenever sub is '1'
    assign inverted_b = b ^ {32{sub}};

    // create 16-bit adders
    add16 add16_1(.a(a[15:0]), .b(inverted_b[15:0]), .cin(sub), .sum(sum1), .cout(cout1));
    add16 add16_2(.a(a[31:16]), .b(inverted_b[31:16]), .cin(cout1), .sum(sum2), .cout(cout2));

    assign sum = {sum2, sum1};

endmodule