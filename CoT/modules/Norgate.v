module top_module( 
    input wire a, 
    input wire b, 
    output wire out 
);
    // NOR gate logic: out is the complement of a OR b
    assign out = ~(a | b);
endmodule