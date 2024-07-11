module top_module(
    input [15:0] a0,
    input [15:0] a1,
    input [15:0] b0,
    input [15:0] b1,
    output [15:0] sum0,
    output [15:0] sum1,
    output cout0,
    output cout1
);
    wire [15:0] s0, s1, s2;
    wire c0, c1, c2;

    add16 U1 (.a(a0), .b(b0), .cin(0), .sum(s0), .cout(c0)); 
    add16 U2 (.a(a1), .b(b1), .cin(c0), .sum(s1), .cout(c1)); 
    add16 U3 (.a(a1), .b(b1), .cin(1), .sum(s2), .cout(c2)); 

    mux2x16 M1 (.d0(s1), .d1(s2), .s(c0), .y(sum0));

    assign cout0 = c0;
    assign sum1 = s0;
    assign cout1 = c1;
endmodule