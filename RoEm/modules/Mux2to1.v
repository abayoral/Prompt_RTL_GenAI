module top_module( 
    input a, b, sel,
    output out ); 

    // Use the ternary operator to select between a and b based on sel
    assign out = sel ? b : a;

endmodule