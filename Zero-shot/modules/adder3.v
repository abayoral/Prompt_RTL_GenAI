module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    wire c0, c1;
    
    full_adder FA0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c0));
    full_adder FA1 (.a(a[1]), .b(b[1]), .cin(c0),  .sum(sum[1]), .cout(c1));
    full_adder FA2 (.a(a[2]), .b(b[2]), .cin(c1),  .sum(sum[2]), .cout(cout[2]));

    assign cout[0] = c0;
    assign cout[1] = c1;

endmodule