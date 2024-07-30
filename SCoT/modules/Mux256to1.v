module top_module (
    input wire [255:0] in,   // 256-bit wide input vector
    input wire [7:0] sel,    // 8-bit select signal
    output wire out          // 1-bit output
);

    // Multiplexer logic: out is the bit in `in` at position `sel`
    assign out = in[sel];

endmodule