module top_module (
    input wire [1:0] A,
    input wire [1:0] B,
    output wire z
);
    // Comparison logic: z is 1 if A equals B, otherwise z is 0
    assign z = (A == B);
endmodule