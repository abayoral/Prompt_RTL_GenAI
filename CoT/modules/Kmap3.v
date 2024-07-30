module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
);
    // Simplified Boolean expression
    assign out = (a & b) | (~a & ~c & ~d);
endmodule