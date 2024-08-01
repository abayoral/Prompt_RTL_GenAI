module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
); 

    // The simplified Boolean expression derived from the given K-map.

    assign out = (~a & ~c) | (b & ~c & ~d) | (c & d);

endmodule