module comparator_4bit(
    input  [3:0] A,
    input  [3:0] B,
    output       A_greater,
    output       A_equal,
    output       A_less
);

  // Extend both inputs to 5 bits (MSB = 0) and perform subtraction.
  // In unsigned arithmetic, if A < B the MSB of the result (i.e. bit 4) will be 1, indicating a borrow.
  wire [4:0] sub;
  assign sub = {1'b0, A} - {1'b0, B};

  // If a borrow (sub[4]) is produced, then A is less than B.
  assign A_less = sub[4];

  // If there is no borrow and the lower 4 bits of the result are all zero, then A and B are equal.
  assign A_equal = (~sub[4]) && (sub[3:0] == 4'b0000);

  // If there is no borrow and the result is non-zero, then A is greater than B.
  assign A_greater = (~sub[4]) && (sub[3:0] != 4'b0000);

endmodule