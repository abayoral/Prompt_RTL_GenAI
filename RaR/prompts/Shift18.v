Can you design a 64-bit arithmetic shift register that supports synchronous loading and allows for both left and right shifts? Specifically, the shift register should support shifts of either 1 bit or 8 bit positions, which will be selected based on a given amount.

Here are the specific requirements for the shift register:

1. **Arithmetic Right Shift Behavior:**
    - When performing an arithmetic right shift, the register should shift in the sign bit (i.e., the most significant bit of the number, `q[63]`), instead of zero. This kind of shift maintains the sign of the number, resembling a division by a power of two.
  
2. **Logical vs. Arithmetic Shift:**
    - Note that there is no difference between logical and arithmetic left shifts. Both should operate identically.

3. **Control Signals:**
    - `load`: When `load` is high, the contents of the shift register should be loaded with the external data input, `data[63:0]`, instead of performing a shift.
    - `ena`: When `ena` is high, the register is enabled to shift according to the shift amount and direction specified.
    - `amount`: This 2-bit control signal determines the direction and amount to shift:
        - `2'b00`: Shift left by 1 bit.
        - `2'b01`: Shift left by 8 bits.
        - `2'b10`: Shift right by 1 bit.
        - `2'b11`: Shift right by 8 bits.

4. **Output Register:**
    - `q`: The 64-bit register that holds the contents of the shifter and should be updated based on the input control signals.

**Example Hints:**
- An example of an arithmetic right shift: A 5-bit binary number `11000` when arithmetic right-shifted by 1, would result in `11100`. In contrast, a logical right shift of the same number would produce `01100`.
- Similarly, a 5-bit binary number `01000` when arithmetic right-shifted or logically right-shifted by 1 remains `00100`, since the original number was non-negative.

You need to implement the proposed design using the provided template in Verilog:

```verilog
module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    // Insert your code here

endmodule
```