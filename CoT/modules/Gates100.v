module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    // Reduction AND for out_and
    assign out_and = &in;
    
    // Reduction OR for out_or
    assign out_or = |in;
    
    // Reduction XOR for out_xor
    assign out_xor = ^in;
    
endmodule