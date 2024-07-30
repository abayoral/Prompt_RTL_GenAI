module top_module (
    input wire [99:0] a,
    input wire [99:0] b,
    input wire sel,
    output wire [99:0] out
);
    // Multiplexer logic: out is b if sel is high, a if sel is low
    assign out = (sel) ? b : a;
endmodule