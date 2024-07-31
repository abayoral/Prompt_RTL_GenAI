module top_module (
    input wire [15:0] in,      // 16-bit input
    output wire [7:0] out_hi,  // Upper byte output
    output wire [7:0] out_lo   // Lower byte output
);
    // Assign the upper 8 bits of 'in' to 'out_hi'
    assign out_hi = in[15:8];
    
    // Assign the lower 8 bits of 'in' to 'out_lo'
    assign out_lo = in[7:0];
endmodule