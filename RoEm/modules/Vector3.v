module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z
);

    // Concatenate the input vectors and append two 1 bits
    wire [31:0] concatenated;
    assign concatenated = {a, b, c, d, e, f, 2'b11};
    
    // Split the concatenated result into the output vectors
    assign w = concatenated[31:24];
    assign x = concatenated[23:16];
    assign y = concatenated[15:8];
    assign z = concatenated[7:0];

endmodule