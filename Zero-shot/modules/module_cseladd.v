module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum1, sum2, sum3, c1, c2, c3;
    assign c1 = sum1[15];
    assign c2 = sum2[15];
    assign c3 = sum3[15];

    add16 adder1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum1), .cout(c1));
    mux2to1_16 mux1(.a(sum1), .b(sum2), .sel(c1), .y(sum[15:0]));

    add16 adder2(.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sum2), .cout(c2));
    mux2to1_16 mux2(.a(sum1[15:0] + sum2), .b(sum1[15:0] + sum3), .sel(c2), .y(sum[31:16]));

    add16 adder3(.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sum3), .cout(c3)); 

endmodule