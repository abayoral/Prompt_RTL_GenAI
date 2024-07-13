module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] sum1;
    wire [15:0] sum2;
    wire cout1;
    wire cout2;
    
    add16 adder1 (.a(a[15:0]), .b(b[15:0] ^ {16{sub}}), .cin(sub), .sum(sum1), .cout(cout1));
    add16 adder2 (.a(a[31:16]), .b(b[31:16] ^ {16{sub}}), .cin(cout1), .sum(sum2), .cout(cout2));
    
    assign sum = {sum2, sum1};

endmodule