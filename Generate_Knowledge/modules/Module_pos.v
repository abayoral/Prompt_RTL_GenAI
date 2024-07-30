module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    // Instantiating mod_a with positional port mapping
    mod_a u_mod_a (out1, out2, a, b, c, d);

endmodule