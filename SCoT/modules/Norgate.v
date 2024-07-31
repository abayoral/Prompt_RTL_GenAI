module top_module (
    input wire a,
    input wire b,
    output wire out
);
    // Intermediate signal for the OR operation result
    wire or_result;
    
    // OR operation
    assign or_result = a | b;
    
    // Invert the OR result to implement the NOR gate
    assign out = ~or_result;
endmodule