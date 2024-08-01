module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (~c & ~d) | (~b & ~d) | (a & d) | (~a & ~b & c) | (b & c & ~d);

endmodule