module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

    // out_both: Both in[i] and in[i+1] should be '1'
    assign out_both = in[99:1] & in[98:0];

    // out_any: Either in[i] or in[i-1] should be '1'
    assign out_any = in[98:0] | in[99:1];

    // out_different: in[i] should be different from in[i+1]
    assign out_different = in ^ {in[0], in[99:1]};

endmodule