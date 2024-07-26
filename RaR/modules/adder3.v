module top_module(
    input wire [2:0] a,
    input wire [2:0] b,
    input wire cin,
    output wire [2:0] sum,
    output wire [2:0] cout
);
    wire c0, c1;

    FullAdder FA0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c0));
    FullAdder FA1 (.a(a[1]), .b(b[1]), .cin(c0), .sum(sum[1]), .cout(c1));
    FullAdder FA2 (.a(a[2]), .b(b[2]), .cin(c1), .sum(sum[2]), .cout(cout[2]));

endmodule