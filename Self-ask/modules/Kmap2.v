module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
);
    assign out = (~c & ~d) | (~c & b) | (~a & c) | (a & c & d);
endmodule