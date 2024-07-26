module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_invert;
    wire [15:0] sum1, sum2, a_lower, a_upper, b_lower, b_upper;
    wire cout1, cout2;

    assign a_lower = a[15:0];
    assign a_upper = a[31:16];
    assign b_lower = b_invert[15:0];
    assign b_upper = b_invert[31:16];

    // XOR gate to invert the b's 32 bits if sub is 1
    assign b_invert = b ^ {32{sub}};

    // 16 bit adder instantiation 1
    add16 adder1 ( .a(a_lower), .b(b_lower), .cin(sub), .sum(sum1), .cout(cout1));

    // 16 bit adder instantiation 2
    add16 adder2 ( .a(a_upper), .b(b_upper), .cin(cout1), .sum(sum2), .cout(cout2));

    // Joining the 2 16 bit results to create the final 32 bit result
    assign sum ={sum2, sum1};

endmodule