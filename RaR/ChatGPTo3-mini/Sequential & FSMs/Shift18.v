Imagine you are a senior Digital IC Design Engineer at a prominent hardware design company. Your current assignment is to develop a critical Verilog module that will be used in a next-generation product. The reputation and success of the product, and by extension your company, depend heavily on the reliability and accuracy of this module.

Your task is to design a 64-bit arithmetic shift register that includes a synchronous load feature. This module should be capable of performing shifts in both left and right directions, and it must support shifting by either one bit or eight bits at a time. The specific operation is controlled by a two-bit signal, "amount," with each value representing a distinct shift operation as described below:

• When amount is 2'b00, the register should shift left by one bit.
• When amount is 2'b01, the register should shift left by eight bits.
• When amount is 2'b10, the register should shift right by one bit.
• When amount is 2'b11, the register should shift right by eight bits.

A key aspect of the design is how the right shifts are handled. For an arithmetic right shift, you must ensure that the most significant bit (q[63]), which represents the sign in a signed number, is preserved and shifted in on the left. This behavior contrasts with a logical right shift, where zeros are shifted in regardless of the sign. Therefore, when performing an arithmetic right shift, if the stored value is signed negative, the sign bit should be propagated into the new bit positions, effectively preserving its sign during the division by a power of two.

Additional details include:
• The synchronous load (indicated by the "load" signal) overrides the shift functionality. When "load" is asserted, the register should be loaded with the new 64-bit data provided via the "data" input.
• The "ena" signal determines whether a shift operation should be performed during a clock cycle. If enabled, the shift operation as defined by the "amount" signal takes place; otherwise, the register’s contents remain unchanged.
• There is no operational difference between an arithmetic left shift and a logical left shift. Both simply shift bits in from the right, so no special handling is necessary on the left side.

As a hint to clarify the concept, consider these examples for a smaller, 5-bit number:
– If the number 11000 is shifted to the right arithmetically by 1, the result should be 11100 (preserving the sign bit), whereas a logical right shift would give 01100.
– If the number 01000 (a non-negative value) is shifted to the right by 1, both arithmetic and logical shifts yield 00100, since there is no need to preserve a negative sign.

The module interface is defined as follows:

module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q
);
    // Your Verilog code will be inserted here.
endmodule

Your goal is to implement this module according to the specifications above, ensuring that the design meets the requirements for synchronous loading, directional shifting, and the preservation of the sign during arithmetic right shifts.