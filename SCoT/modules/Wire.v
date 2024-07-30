module top_module (
    input wire in,
    output wire out
);
    // Direct connection: out is always the same as in
    assign out = in;
endmodule