module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire [15:0] sum0, sum1, sum2;
wire [15:0] sum_mux0, sum_mux1;
wire c0, c1, c2;
wire cin1_mux, cin2_mux;

add16 adder0 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum0), .cout(c0));
add16 adder1 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum1), .cout(c1));
add16 adder2 (.a(a[31:16]), .b(b[31:16]), .cin(c0), .sum(sum2), .cout(c2));

mux2_1_16bit mux0 (.a(sum1), .b(sum2), .sel(c0), .out(sum_mux0));
mux2_1_16bit mux1 (.a(c1), .b(c2), .sel(c0), .out(cin1_mux));

assign sum = {cin1_mux, sum_mux0, sum0};

endmodule