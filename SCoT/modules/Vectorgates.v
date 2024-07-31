module top_module(
    input wire [2:0] a,
    input wire [2:0] b,
    output wire [2:0] out_or_bitwise,
    output wire out_or_logical,
    output wire [5:0] out_not
);
    // Bitwise OR calculation
    assign out_or_bitwise = a | b;
    
    // Logical OR calculation (reduce each vector to a single bit, then OR them)
    assign out_or_logical = |a | |b;
    
    // Bitwise NOT calculation and assignment
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a;

endmodule