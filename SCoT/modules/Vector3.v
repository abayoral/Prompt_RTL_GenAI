module top_module (
    input wire [4:0] a,
    input wire [4:0] b,
    input wire [4:0] c,
    input wire [4:0] d,
    input wire [4:0] e,
    input wire [4:0] f,
    output wire [7:0] w,
    output wire [7:0] x,
    output wire [7:0] y,
    output wire [7:0] z
);
    // Concatenating the inputs and appending two '1' bits
    wire [31:0] concatenated;
    assign concatenated = {a, b, c, d, e, f, 2'b11};

    // Assigning the 8-bit segments to outputs
    assign w = concatenated[31:24];
    assign x = concatenated[23:16];
    assign y = concatenated[15:8];
    assign z = concatenated[7:0];

endmodule