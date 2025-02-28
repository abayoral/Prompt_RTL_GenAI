Please refine and elaborate on the following request for creating a 4-bit binary counter using Verilog:

Design a 4-bit binary counter using Verilog that counts sequentially from 0 to 15, inclusive, and then wraps around back to 0, creating a full count cycle period of 16 clock cycles. The design should incorporate a synchronous reset mechanism, which, when activated (high), resets the counter value back to 0 regardless of its current state. The reset input is synchronous, meaning it is only effective on a clock edge. Here are the specific inputs and outputs required for the module:

1. **Inputs:**
   - `clk` (clock input): A clock signal that drives the counter.
   - `reset` (synchronous reset input): An active-high reset signal that, when asserted, synchronously resets the counter to 0 at the next clock edge.

2. **Output:**
   - `q` (4-bit output): A 4-bit wide bus representing the current count value, ranging from 0000 (0 in decimal) to 1111 (15 in decimal).

Please structure your Verilog module to accommodate these requirements and include appropriate syntax and comments to guide the implementation of the 4-bit binary counter. Here is the module declaration to be used:

```verilog
module top_module (
    input clk,
    input reset,
    output [3:0] q
);
    // Insert your implementation code here
endmodule
```