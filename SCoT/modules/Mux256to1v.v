module top_module (
    input wire [1023:0] in,  // 1024-bit input vector (256 inputs of 4 bits each)
    input wire [7:0] sel,    // 8-bit selection signal
    output wire [3:0] out    // 4-bit output vector
);
    // Use indexed part select to choose the appropriate 4-bit slice from the 1024-bit input vector
    assign out = in[sel * 4 +: 4];
endmodule