module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
); 
    // Simplified Boolean Expression: F = a'b'd' + a'b'c + cd + bcd
    assign out = (~a & ~b & d & ~c) | (~a & ~b & c) | (c &d) |  (b & c & d);
endmodule