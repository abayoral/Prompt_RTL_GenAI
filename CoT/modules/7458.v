module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y 
);
    // Intermediate signals for AND gate results
    wire and_p1ab, and_p1cd, and_p1e, and_p1f;
    wire and_p2ab, and_p2cd;

    // AND gates for p1y
    assign and_p1ab = p1a & p1b;
    assign and_p1cd = p1c & p1d;
    assign and_p1e = p1e;
    assign and_p1f = p1f;

    // OR gate for p1y combining all AND gate results
    assign p1y = and_p1ab | and_p1cd | and_p1e | and_p1f;

    // AND gates for p2y
    assign and_p2ab = p2a & p2b;
    assign and_p2cd = p2c & p2d;

    // OR gate for p2y combining both AND gate results
    assign p2y = and_p2ab | and_p2cd;

endmodule

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y 
);
    // OR gate for p1y combining the results of four AND gates
    assign p1y = (p1a & p1b) | (p1c & p1d) | (p1e) | (p1f);

    // OR gate for p2y combining the results of two AND gates
    assign p2y = (p2a & p2b) | (p2c & p2d);
    
endmodule