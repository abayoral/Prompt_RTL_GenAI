module top_module(
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);
    // Multiplexer logic: Select 4-bit slice from 'in' using 'sel'
    assign out = in[sel*4 +: 4];
endmodule