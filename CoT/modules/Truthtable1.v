module top_module( 
    input wire x3,
    input wire x2,
    input wire x1,  // three inputs
    output wire f   // one output
);

    // Define intermediate signals to hold the results of AND gates
    wire and1, and2, and3, and4;
    
    // Implement the AND gates for each relevant row in the truth table
    assign and1 = ~x3 & x2 & ~x1; // corresponds to row 2
    assign and2 = ~x3 & x2 & x1;  // corresponds to row 3
    assign and3 = x3 & ~x2 & x1;  // corresponds to row 5
    assign and4 = x3 & x2 & x1;   // corresponds to row 7
    
    // OR together the results of the AND gates to implement the sum-of-products form
    assign f = and1 | and2 | and3 | and4;

endmodule