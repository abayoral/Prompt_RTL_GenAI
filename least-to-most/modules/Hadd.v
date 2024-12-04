module top_module( 
    input a, b,
    output cout, sum );

    // Sum is the XOR of the two input bits
    assign sum = a ^ b;
    
    // Carry-out is the AND of the two input bits
    assign cout = a & b;

endmodule