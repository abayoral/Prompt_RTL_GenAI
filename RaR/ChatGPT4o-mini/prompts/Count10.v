Certainly! Below is a rephrased and expanded version of your original question to provide more clarity and context:

---

Design and implement a decade counter using Verilog HDL that counts sequentially from 0 to 9 (inclusive) and then resets back to 0, making a period of 10 counts. The counter should have a synchronous reset, meaning the reset signal should reset the counter to 0 on the rising edge of the clock when the reset signal is high. The reset signal is active-high.

Here are the details for the module:

- The module should be named `top_module`.
- There are three inputs: 
  - `clk`: the clock signal.
  - `reset`: the synchronous active-high reset input. When this signal is high, the counter should reset to 0 on the next rising edge of the clock.
- There is one 4-bit output:
  - `q`: a 4-bit output representing the current value of the counter, ranging from 0 to 9.

Template for the module:

```verilog
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q
);

// Insert your code here

endmodule
```

Ensure the counter:
1. Counts from 0 to 9 inclusively.
2. Resets to 0 on a rising clock edge if the reset signal is high.
3. If the current count is 9 and the counter receives a clock pulse (without reset being high), it should wrap around and the next value of the counter `q` should be 0.

Please fill in the missing implementation within the given template.