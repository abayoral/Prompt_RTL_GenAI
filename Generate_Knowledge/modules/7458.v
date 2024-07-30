module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    // Intermediate signals for the AND gate outputs
    wire and1_out, and2_out, and3_out, and4_out;

    // AND gates
    assign and1_out = p1a & p1b;
    assign and2_out = p1c & p1d;
    assign and3_out = p2a & p2b;
    assign and4_out = p2c & p2d;

    // OR gates
    assign p1y = and1_out | and2_out;
    assign p2y = and3_out | and4_out;

endmodule