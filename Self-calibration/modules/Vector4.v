module top_module (
    input [7:0] in,
    output [31:0] out 
);
    // Extend the sign (bit[7] of 'in') 24 times and concatenate with 'in'
    assign out = { {24{in[7]}}, in };
endmodule