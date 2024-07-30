module top_module( 
    input a, b, sel,
    output out
); 
    // Multiplexer logic: out is b if sel is high, a if sel is low
    assign out = (sel) ? b : a;
endmodule