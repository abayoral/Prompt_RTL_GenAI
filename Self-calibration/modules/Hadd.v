module top_module( 
    input a, b,
    output cout, sum );

    // Sum is the XOR of the inputs
    assign sum = a ^ b;

    // Carry out is the AND of the inputs
    assign cout = a & b;

endmodule