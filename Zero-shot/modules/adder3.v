module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    wire c0, c1, c2;
    
    full_adder U1 (.a(a[0]), .b(b[0]), .cin(cin), .cout(c0), .sum(sum[0]));
    full_adder U2 (.a(a[1]), .b(b[1]), .cin(c0), .cout(c1), .sum(sum[1]));
    full_adder U3 (.a(a[2]), .b(b[2]), .cin(c1), .cout(c2), .sum(sum[2]));
   
    assign cout = {c2, c1, c0};
    
endmodule