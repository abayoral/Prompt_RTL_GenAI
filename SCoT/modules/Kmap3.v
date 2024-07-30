module top_module (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out
);

    // Simplified Boolean expression
    assign out = (~a & ~b & c & d) | (~a & ~d & b) | (c & d) | (a & b);

endmodule