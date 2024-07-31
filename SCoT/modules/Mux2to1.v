module top_module (
    input wire a,
    input wire b,
    input wire sel,
    output wire out
);
    // Multiplexer logic: out is b if sel is high, a if sel is low
    assign out = (sel) ? b : a;
endmodule