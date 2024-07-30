module top_module (
    input wire a,
    input wire b,
    input wire c,
    output wire w,
    output wire x,
    output wire y,
    output wire z
);
    // Assigning inputs to outputs using concatenation
    assign {w, x, y, z} = {a, b, b, c};
    
endmodule