module top_module( 
    input a, b, cin,
    output cout, sum );

    // Full adder logic
    assign sum = a ^ b ^ cin;       // Sum is the XOR of all three inputs
    assign cout = (a & b) | (b & cin) | (a & cin); // Carry-out is true if any two of the inputs are true

endmodule