module top_module( 
        input [2:0] a, b,
        input cin,
        output [2:0] cout,
        output [2:0] sum
    );
        wire c1, c2;

        full_adder fa1 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
        full_adder fa2 (.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
        full_adder fa3 (.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(cout[2]));

        assign cout = {c2, c1, cout[2]};

    endmodule