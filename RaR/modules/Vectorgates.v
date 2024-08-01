module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    // Bitwise OR operation
    assign out_or_bitwise = a | b;
    
    // Logical OR operation
    assign out_or_logical = |(a | b); // Reduce or to compute the logical OR
    
    // Bitwise NOT operation
    assign out_not[5:3] = ~b; // Upper half containing bitwise NOT of b
    assign out_not[2:0] = ~a; // Lower half containing bitwise NOT of a

endmodule