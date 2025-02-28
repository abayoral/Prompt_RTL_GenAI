Imagine being a senior Digital Design Engineer at a premier hardware company, responsible for crafting a Verilog module that will play a crucial role in a next-generation product. Your assignment involves designing an 8-bit priority encoder. The encoder's main function is to analyze an 8-bit input vector and determine which is the first bit (starting from the least significant bit) that is set to a high value (1).

More specifically, your module should:
• Examine the 8-bit input, bit by bit, starting from the least significant bit (position 0).
• Identify the first occurrence where a bit is high.
• Output the corresponding index of that bit as a 3-bit number.
• In the event that all bits in the input vector are low (0), the module should output a zero value.

For example, if the input vector is represented as 8'b10010000, the encoder should detect that the least significant '1' occurs at bit position 4, and therefore output the 3-bit value that represents the number 4 (3'd4).

The Verilog module follows the Verilog-2001 standard. Below is the template for the module:

-------------------------------------------------------------
module top_module (
    input [7:0] in,
    output reg [2:0] pos
);

    // Your code implementation goes here

endmodule
-------------------------------------------------------------

Your task is to implement the logic that fulfills these requirements, ensuring that your code correctly identifies and outputs the position of the first high bit or returns zero if no such bit exists.