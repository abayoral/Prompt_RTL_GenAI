module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    wire c0, c1, c2;

    // Full Adder Module
    module Full_Adder(
        input a, b, cin,
        output cout, sum);
        assign {cout, sum} = a + b + cin;
    endmodule