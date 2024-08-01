module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  
);

    // Simplified logic expression from the Karnaugh map
    assign out = (a & ~c) | (b & ~d) | (~b & c & d) | (~a & ~c & ~d);

endmodule