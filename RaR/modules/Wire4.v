module top_module( 
    input a, 
    input b, 
    input c, 
    output w, 
    output x, 
    output y, 
    output z 
);
    // Establishing the specified connections
    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;
endmodule