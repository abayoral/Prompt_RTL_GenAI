module top_module (
    input wire [255:0] in,
    input wire [7:0] sel,
    output wire out
);
    // Multiplexer logic: Selecting one of the 256 inputs based on the 8-bit select signal
    assign out = in[sel];
endmodule