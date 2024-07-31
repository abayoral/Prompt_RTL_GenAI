module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    // Bitwise OR of the two vectors
    assign out_or_bitwise = a | b;

    // Logical OR of the two vectors
    assign out_or_logical = a != 3'b000 || b != 3'b000;
    
    // Inverse (NOT) of both vectors
    assign out_not[2:0] = ~a;
    assign out_not[5:3] = ~b;

endmodule