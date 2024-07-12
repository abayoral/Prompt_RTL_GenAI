module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output wire p1y,
    input p2a, p2b, p2c, p2d,
    output wire p2y );

    wire and1, and2, and3, and4;
    
    // Defining first four AND gates
    assign and1 = p1a & p1b;
    assign and2 = p1c & p1d;
    assign and3 = p1e & p1f;
    assign and4 = p2a & p2b;
    
    // Defining output p1y with two OR gates
    assign p1y = (and1 | and2) | (and3 & and4);

    // Defining output p2y with two AND gates
    assign p2y = (p2c & p2d) | (and3 & and4);

endmodule