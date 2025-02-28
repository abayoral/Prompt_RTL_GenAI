Here is a clearer and more detailed version of your question to build a 4-bit shift register with specific functionalities:

Design and implement a 4-bit shift register that supports the following features:

1. **Asynchronous Reset (`areset`)**: When the asynchronous reset is asserted (high), the shift register should immediately reset all its bits to zero, regardless of the clock signal.

2. **Synchronous Load (`load`)**: When the load signal is asserted (high), on the next rising edge of the clock, the shift register should load the provided 4-bit data (`data[3:0]`) into the register instead of performing a shift operation.

3. **Enable (`ena`)**: When the enable signal is asserted (high) and the load signal is not asserted, on the next rising edge of the clock, the register should perform a right shift operation. In this operation, `q[3]` should become zero, and each bit should shift one position to the right (`q[0]` is shifted out and effectively disappears).

4. **Priority Handling**: If both `load` and `ena` signals are asserted at the same time, the `load` operation should take priority over the shift operation.

The inputs and outputs for the module are as follows:
- **clk**: The clock signal that synchronizes the shifting and loading operations.
- **areset**: Asynchronous active-high reset input to reset the register to zero.
- **load**: Synchronous active-high load input to directly load data into the register.
- **ena**: Enable input to allow the register to shift right on the rising edge of the clock.
- **data[3:0]**: 4-bit input data to be loaded into the register when the load signal is asserted.
- **q[3:0]**: 4-bit output representing the current contents of the shift register.

Write the Verilog code for this 4-bit shift register, considering the provided inputs and outputs, and including the appropriate logic to handle the asynchronous reset, synchronous load, and enable functionalities with proper priority management.

```
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    // Insert your code here

endmodule
```