module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire and1, and2, and3, and4;
    
    // Drive intermediate AND gates
    assign and1 = p1a & p1b;
    assign and2 = p1c & p1d;
    assign and3 = p1e & p1f;
    assign and4 = p2a & p2b;
    
    // Drive OR gates P1Y and P2Y
    assign p1y = and1 | and2;
    assign p2y = and3 | and4;
  
endmodule