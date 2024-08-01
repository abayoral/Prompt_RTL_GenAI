module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);

    assign f = (~x3 & x2 & ~x1) |  // Row 2: 010 -> 1
               (~x3 & x2 & x1)  |  // Row 3: 011 -> 1
               (x3 & ~x2 & x1)  |  // Row 5: 101 -> 1
               (x3 & x2 & x1);     // Row 7: 111 -> 1

endmodule