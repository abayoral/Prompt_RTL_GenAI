module top_module (
    input wire sel,
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [7:0] out
);
    // Multiplexer logic: out is b if sel is high, a if sel is low
    assign out = (sel) ? b : a;
endmodule