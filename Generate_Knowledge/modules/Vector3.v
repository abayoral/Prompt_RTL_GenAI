module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );

    // Concatenate input vectors a, b, c, d, e, f into a single 30-bit vector
    wire [29:0] combined_vector = {a, b, c, d, e, f};

    // Append two '1' bits to get a 32-bit vector
    wire [31:0] extended_vector = {combined_vector, 2'b11};

    // Split the 32-bit extended_vector into four 8-bit output vectors
    assign {w, x, y, z} = extended_vector;

endmodule