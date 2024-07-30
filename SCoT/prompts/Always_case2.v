Chain of Thought:

1. **Understand the Requirements**:
    - A 4-bit priority encoder takes a 4-bit input and outputs the binary representation of the position of the highest-order active (high) bit.
    - If no input bits are high (i.e., input is zero), the output should be zero.
    - For example:
      - If `in = 4'b1000`, the output `pos` is `2'b11`.
      - If `in = 4'b0100`, the output `pos` is `2'b10`.
      - If `in = 4'b0010`, the output `pos` is `2'b01`.
      - If `in = 4'b0001`, the output `pos` is `2'b00`.
      - If `in = 4'b0000`, the output `pos` is `2'b00`.

2. **Determine the Inputs and Outputs**:
    - **Inputs**: 4-bit input (in).
    - **Outputs**: 2-bit output (pos).

3. **Define Intermediate Signals**:
    - Intermediate signals might not be inherently necessary if straightforward conditional logic can be employed.

4. **Structuring the Module**:
    - **Module Declaration**:
      - Declare the module with its inputs and outputs.
    
    - **Define the Output Logic**:
      - Use a priority encoder logic to assign the correct value to `pos` based on the value of `in`.
      - This can be done using conditional statements.
    
    - **Handling No High Input**:
      - Default the output `pos` to zero.
      - Check each bit of the input, starting from the highest-order bit, and set `pos` if the bit is high.

5. **Procedure in Natural Language**:
    - Initialize the output `pos` to zero.
    - Check the highest-order bit of the input:
      - If the highest-order bit (bit 3) is high, set `pos` to `2'b11`.
      - Else, check the next highest-order bit (bit 2).
      - If bit 2 is high, set `pos` to `2'b10`.
      - Continue this process for bit 1 and bit 0.
    - If none of the bits are high, `pos` will remain zero.

By following this structured approach, a hardware designer ensures that all conditions are met for implementing a 4-bit priority encoder effectively in Verilog.