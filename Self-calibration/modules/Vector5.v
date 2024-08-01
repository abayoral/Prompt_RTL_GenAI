module top_module (
    input a, b, c, d, e,
    output [24:0] out
);

    // Create two concatenated vectors of the 5 inputs
    wire [24:0] vec1 = { a, a, a, a, a,
                         b, b, b, b, b,
                         c, c, c, c, c,
                         d, d, d, d, d,
                         e, e, e, e, e };

    wire [24:0] vec2 = { a, b, c, d, e,
                         a, b, c, d, e,
                         a, b, c, d, e,
                         a, b, c, d, e,
                         a, b, c, d, e };
    
    // Compute XNOR of the two vectors
    assign out = ~(vec1 ^ vec2);

endmodule