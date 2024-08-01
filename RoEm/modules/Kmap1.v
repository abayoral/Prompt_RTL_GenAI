module top_module(
    input a,
    input b,
    input c,
    output out
); 

    // The Karnaugh map provided simplifies to the function:
    // out = 1
    // Since all minterms are covered and produce '1', the output is always '1'.
    assign out = 1;

endmodule