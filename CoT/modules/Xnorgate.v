module top_module( 
    input a, 
    input b, 
    output out 
);
    // XNOR logic: out is the negation of the XOR of a and b
    assign out = ~(a ^ b);
endmodule