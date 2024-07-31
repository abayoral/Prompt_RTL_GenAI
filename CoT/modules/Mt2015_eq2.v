module top_module (
    input wire [1:0] A,
    input wire [1:0] B,
    output wire z
);
    // Comparison logic: z is 1 if A equals B, otherwise 0
    assign z = (A == B) ? 1'b1 : 1'b0;
endmodule