module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    // Declare internal wires for intermediate signals
    wire and1, and2, and3, and4;

    // AND gates
    assign and1 = p1a & p1b;
    assign and2 = p1c & p1d;
    assign and3 = p1e & p1f;
    assign and4 = p2a & p2b;

    // OR gates
    assign p1y = and1 | and2;
    assign p2y = and3 | and4;

endmodule