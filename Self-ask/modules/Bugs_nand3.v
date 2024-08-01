module top_module (
    input a, 
    input b, 
    input c, 
    output out
); 

    nandgate inst1 ( 
        .out(out), 
        .a(a), 
        .b(b), 
        .c(c)
    );

endmodule