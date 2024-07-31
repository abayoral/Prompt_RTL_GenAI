module top_module(
    input a,
    input b,
    input c,
    output out
); 
    // Simplify the K-map: The function f(a, b, c) is always 1 regardless of the values of a, b, and c
    assign out = 1;

endmodule