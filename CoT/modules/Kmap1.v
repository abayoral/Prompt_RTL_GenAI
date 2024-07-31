module top_module(
    input a,
    input b,
    input c,
    output out
); 
    // Since the Karnaugh map shows all output values as 1, assign 1 to out directly.
    assign out = 1'b1;

endmodule