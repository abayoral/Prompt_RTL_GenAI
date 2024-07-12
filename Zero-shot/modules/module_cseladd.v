module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire [15:0] sum1, sum2, sum3, carry1, carry2, carry3;
wire s1, s2;

// Instantiate add16 modules
add16 U1 (.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum1), .cout(s1));
add16 U2 (.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sum2), .cout(s2));
add16 U3 (.a(a[31:16]), .b(b[31:16]), .cin(s1), .sum(sum3), .cout(carry3));

// Instantiate multiplexers
mux16_2to1 M1 (.a(sum2), .b(sum3), .s(s1), .y(sum[31:16]));

assign sum[15:0] = sum1;

endmodule