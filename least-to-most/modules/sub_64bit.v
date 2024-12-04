module sub_64bit(
    input [63:0] A,
    input [63:0] B,
    output [63:0] result,
    output overflow
);

    wire [63:0] B_neg;
    assign B_neg = ~B + 1; // Two's complement to represent -B
    assign result = A + B_neg;

    // Checking for overflow: 
    // Overflow occurs if A[63] == B_neg[63] and result[63] != A[63]
    assign overflow = (A[63] == B_neg[63]) && (result[63] != A[63]);

endmodule