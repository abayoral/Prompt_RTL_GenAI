module top_module( 
    input a, b,
    output cout, sum );

    assign sum = a ^ b; // Sum is the XOR of the inputs
    assign cout = a & b; // Carry-out is the AND of the inputs

endmodule