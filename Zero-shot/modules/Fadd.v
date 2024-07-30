module top_module( 
    input a, b, cin,
    output cout, sum );

    // Full Adder logic
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule