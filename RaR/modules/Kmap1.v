module top_module(
    input a,
    input b,
    input c,
    output out  
); 

    // Simplified Boolean expression derived from the K-map
    assign out = 1'b1; // Since the output is always 1 for all combinations of a, b, and c, we can directly assign out to 1.

endmodule