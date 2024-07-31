module top_module (
    input wire [4:0] a, b, c, d, e, f,
    output wire [7:0] w, x, y, z
);
    // Concatenate the six 5-bit input vectors and two 1 bits to form a 32-bit vector
    wire [31:0] concatenated_vector = {a, b, c, d, e, f, 2'b11};

    // Assign the 32-bit vector to four 8-bit outputs
    assign {w, x, y, z} = concatenated_vector;
endmodule