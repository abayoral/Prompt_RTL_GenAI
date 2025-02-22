As a senior Digital Design Engineer working at a prestigious hardware design firm, you have been entrusted with the crucial responsibility of crafting an essential Verilog module. This module is intended for integration into a cutting-edge product that the company is developing, and its successful performance is vital to uphold and enhance our firm's esteemed reputation within the competitive field of computer hardware.

The specific task involves designing an efficient decade counter, which is a counter that can count sequentially from 0 to 9 and then wrap back to 0, making a complete cycle of 10 counts. This cycle, or period, repeats as long as the circuit operates. The design requirement specifies that the reset functionality of this counter must be synchronous: this means that the counter must check for reset conditions on the active edge of the clock signal. When the reset input signal is asserted high, the counter should immediately return to the initial count of 0 on the next clock edge, regardless of its current count state.

In crafting this module, named `top_module`, you'll need to specify how the 4-bit wide output, `q`, behaves in terms of both counting and responding to the reset signal. Here is the Verilog module interface that you will work within:

```verilog
module top_module (
    input clk,            // Clock input to synchronize the operation of the counter
    input reset,          // Synchronous active-high reset input to control the counter's reset behavior
    output [3:0] q        // 4-bit output representing the current counter value
);

// Your task is to insert the appropriate Verilog code here to realize the specified decade counter functionality

endmodule
```

Please keep in mind, as you embark on this design task, the importance of adhering to best practices in digital design, including considerations for clock management, potential synchronization issues, and ensuring that your code remains succinct, maintainable, and easy to understand by other team members who may interact with your work in the future.