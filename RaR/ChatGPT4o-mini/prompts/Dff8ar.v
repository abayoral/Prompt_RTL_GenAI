The task requires you to design and implement a Verilog module that contains eight D flip-flops (DFFs). Each D flip-flop should have the following characteristics:

1. An active high asynchronous reset signal (`areset`). When this signal is asserted (set to high), it will immediately reset the D flip-flop's output (`q`) irrespective of the clock signal (`clk`).

2. The D flip-flops should capture the input data (`d`) on the rising edge (positive edge) of the clock signal (`clk`). 

3. The output of the module should be an 8-bit wide signal (`q`) that represents the current state of all eight D flip-flops.

Additionally, a hint is provided to guide you: The primary distinction between synchronous and asynchronous reset flip-flops is found in the sensitivity list of the always block within Verilog.

Therefore, your task is to complete the implementation of the following Verilog module:

```verilog
module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);

    // Insert your code here

endmodule
```

This module should consist of eight instances of D flip-flops, each properly configured as described.