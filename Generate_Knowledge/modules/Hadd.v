module top_module( 
    input a, b,
    output cout, sum );

    assign sum = a ^ b;  // Sum is the result of XOR operation
    assign cout = a & b; // Carry out is the result of AND operation

endmodule