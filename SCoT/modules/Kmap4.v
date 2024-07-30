module top_module (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out
);
    // SOP Expression: a'b + ab' + c'd' + cd
    assign out = (~a & b) | (a & ~b) | (~c & ~d) | (c & d);
endmodule