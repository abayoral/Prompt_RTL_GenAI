module top_module (
    input wire a,
    input wire b,
    input wire c,
    output wire out
);
    // Since the output is always 1, we directly assign 1 to out
    assign out = 1;
endmodule