module top_module (
    input wire [99:0] in,
    output wire [98:0] out_both,
    output wire [98:0] out_any,
    output wire [99:0] out_different
);
    // out_both: Each bit of this output vector indicates whether both the corresponding input bit and its neighbour to the left are '1'
    assign out_both = in[99:1] & in[98:0];

    // out_any: Each bit of this output vector indicates whether any of the corresponding input bit and its neighbour to the right are '1'
    assign out_any = in[99:1] | in[98:0];

    // out_different: Each bit of this output vector indicates whether the corresponding input bit is different from its neighbour to the left
    // Treat the vector as wrapping around, so in[99]’s left neighbour is in[0].
    assign out_different = in ^ {in[0], in[99:1]};
    
endmodule