module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum0, sum1, sum2, cout0, cout1, cout2;
    wire select1, select2;

    add16 adder0 (.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum0), .cout(cout0)); 
    add16 adder1 (.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sum1), .cout(cout1));
    add16 adder2 (.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sum2), .cout(cout2));

    mux16 mux1 (.select(cout0), .a(sum1), .b(sum2), .y(sum[31:16]));
    assign select1 = cout0 ? cout2 : cout1;

    assign sum[15:0] = sum0;

endmodule