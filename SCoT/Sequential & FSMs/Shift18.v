The task is to design and implement a 64-bit arithmetic shift register with a synchronous load capability. This shift register needs to be able to shift its contents either left or right, with the shift distance specified as either 1 bit or 8 bits. The control signals that dictate the operation of the shift register include a load signal, an enable signal, and a 2-bit amount signal which indicates both the direction and distance of the shift.

Key specifications for this module are as follows:

1. **Data Path:**
   - The shift register, denoted as `q`, is 64 bits wide.
   - The input to this register, `data`, is also a 64-bit wide signal.

2. **Control Signals:**
   - **`load` Signal:** When activated, the shift register should load data from the input `data[63:0]`, effectively replacing its current contents without performing any shift operations.
   - **`ena` (Enable) Signal:** When active, this signal allows the shift operation to occur. If it is inactive, the shift register should maintain its current state unless being loaded.
   - **`amount` Signal:** This 2-bit signal determines the shift operation. It has four possible values:
     - `2'b00`: Shift the contents of the shift register to the left by 1 bit.
     - `2'b01`: Shift to the left by 8 bits.
     - `2'b10`: Shift to the right by 1 bit, using an arithmetic right shift approach.
     - `2'b11`: Shift to the right by 8 bits, again utilizing an arithmetic right shift.
     
3. **Arithmetic vs. Logical Shifting:**
   - **Arithmetic Right Shift:** This involves shifting the bits to the right while preserving the sign of the number. In binary representation for a 64-bit number, this means repeatedly copying the most significant bit (MSB, or `q[63]`) to fill the vacated higher order bits. This operation is essential for maintaining the sign of signed integers.
   - **Logical Shifts (Left Shifts):** These are the same as arithmetic left shifts. Both involve simply shifting the bits left, filling with zeroes in the least significant positions.

4. **Operational Clarifications:**
   - When no shift is enabled (via `ena`), the current state of the register should remain unchanged unless the `load` signal is active.
   - The module is clock-driven, meaning all operations (load and shift) are synchronized with the rising edge of the input clock signal (`clk`).

This assignment requires you to implement the logic of such a shift register within the provided `Verilog` module interface, utilizing clocking mechanisms to ensure proper synchronous operation for loading and shifting.