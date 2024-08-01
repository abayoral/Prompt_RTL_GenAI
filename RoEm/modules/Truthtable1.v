module top_module(
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);

    // Sum-of-products implementation
    assign f = (~x3 & x2 & ~x1) |  // Row 2:  0 1 0
               (~x3 & x2 & x1)  |  // Row 3:  0 1 1
               (x3 & ~x2 & x1)  |  // Row 5:  1 0 1
               (x3 & x2 & x1);     // Row 7:  1 1 1

endmodule