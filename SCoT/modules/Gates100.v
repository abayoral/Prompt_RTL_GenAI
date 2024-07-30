module top_module (
    input wire [99:0] in,
    output wire out_and,
    output wire out_or,
    output wire out_xor
);
    // AND reduction operator for out_and
    assign out_and = &in;
    
    // OR reduction operator for out_or
    assign out_or = |in;
    
    // XOR reduction operator for out_xor
    assign out_xor = ^in;
    
endmodule