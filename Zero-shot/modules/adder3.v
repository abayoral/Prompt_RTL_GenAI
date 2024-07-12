module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    // Declaration of wire for intermediate carry
    wire c0, c1;

    // Full Adder for 0th bit
    full_adder FA0(
      .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout[0])
    );

    // Full Adder for 1st bit
    full_adder FA1(
      .a(a[1]), .b(b[1]), .cin(cout[0]), .sum(sum[1]), .cout(cout[1])
    );

    // Full Adder for 2nd bit
    full_adder FA2(
      .a(a[2]), .b(b[2]), .cin(cout[1]), .sum(sum[2]), .cout(cout[2])
    );

    // Full Adder Module
    module full_adder(
      input a, b, cin,
      output sum, cout
    );

    // Create XOR gate for sum bit
    assign sum= a^b^cin;

    // Create OR gate for carry out
    assign cout= (a&b) | (b&cin) | (a&cin);

    endmodule