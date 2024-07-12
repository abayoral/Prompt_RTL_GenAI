module top_module (
        input wire [255:0] in,
        input wire [7:0] sel,
        output wire out
    );
        // Multiplexer logic: out is in[sel]
        assign out = in[sel];
    endmodule