Please develop a Verilog module named `top_module` that implements a counter which counts from 0 to 999, inclusive. The counter should increment by 1 on each clock cycle, completing its entire count range across 1000 cycles. When the count reaches 999, it should wrap around to 0 on the next clock cycle. 

The module should have the following ports:
1. `clk`: an input signal that serves as the clock for driving the counter.
2. `reset`: an input signal for resetting the counter to 0. This reset input should be synchronous, meaning that the counter should reset to 0 on the next rising edge of the clock after the reset signal is asserted.
3. `q`: a 10-bit wide output representing the current value of the counter.

Your task is to define the internal logic of this counter within the provided module template. Specifically, you need to ensure that the counter properly increments with each clock cycle, correctly handles the wrap-around from 999 to 0, and synchronously resets to 0 when the reset signal is active.

Here is the provided module template for your reference:

```verilog
module top_module (
    input clk,
    input reset,
    output [9:0] q);

    // Insert your code here

endmodule
```

Make sure to implement the required functionality accurately within this template.