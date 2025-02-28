Imagine you are a senior Digital IC Design Engineer at a prominent company specializing in hardware design, where you bear the crucial responsibility of developing an essential Verilog module for an innovative next-generation product. The success of this module plays a vital role in upholding the esteemed reputation of your computer hardware company within the competitive industry.

Your task is to create a 64-bit arithmetic shift register that includes a synchronous load feature. This shift register must have the capability to shift both to the left and to the right, with the option to shift by either 1 or 8 bit positions as determined by the selected shift amount. The objective is to handle arithmetic right shifts, which involve shifting in the sign bit of the number present in the shift register (specifically q[63] in this scenario) rather than shifting in zero, as is the case with logical right shifts. An arithmetic right shift must preserve the sign of the signed number, effectively dividing it by a power of two. It is noteworthy that no distinction exists between logical and arithmetic left shifts in this context.

Consider the additional parameters that need to be controlled:

- **Load (load):** This signal determines when the shift register should be loaded with a new data value [63:0] instead of executing a shift operation.
- **Enable (ena):** This signal dictates whether the shifting operation should occur.
- **Amount (amount):** This 2-bit control signal determines both the direction and the magnitude of the shift:

  - `2'b00`: Shift the register contents left by 1 bit.
  - `2'b01`: Shift the register contents left by 8 bits.
  - `2'b10`: Shift the register contents right by 1 bit.
  - `2'b11`: Shift the register contents right by 8 bits.

- **Q (q):** This is the output register that holds the current contents of the shifter.

An example to illustrate the concept of arithmetic versus logical shifting:

- Consider a 5-bit binary number `11000`. When this number undergoes an arithmetic right shift by 1 position, the result should be `11100`, whereas a logical right shift would yield `01100`.
  
- Conversely, if you start with a 5-bit number `01000`, performing an arithmetic right shift would produce `00100`, identical to a logical right shift result since the original number is non-negative.

By understanding these specifications and nuances, you are expected to implement the Verilog module as defined in the requirements above. The solution should be synchronous with a clock input (`clk`) guiding the operations, complying with all specified conditions to ensure the functionality of the 64-bit arithmetic shift register in the final design of your next-generation product.