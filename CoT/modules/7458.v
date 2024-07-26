module top_module (
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);
    // Intermediate signals for AND gate outputs
    wire p1_and1, p1_and2, p2_and1, p2_and2;
    // AND gates logic
    assign p1_and1 = p1a & p1b & p1c & p1d;
    assign p1_and2 = p1e & p1f;
    assign p2_and1 = p2a & p2b;
    assign p2_and2 = p2c & p2d;
    // OR gates logic
    assign p1y = p1_and1 | p1_and2;
    assign p2y = p2_and1 | p2_and2;
endmodule