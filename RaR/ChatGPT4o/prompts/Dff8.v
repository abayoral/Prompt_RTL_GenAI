In the given task, you are required to design and implement a Verilog module that serves a specific purpose. This module, named `top_module`, should include eight D flip-flops (DFFs). Each D flip-flop needs to be triggered by the positive (rising) edge of the clock signal (`clk`). The module receives a single clock input (`clk`), an 8-bit input vector (`d`), and should produce an 8-bit output vector (`q`). Each bit of the input vector `d` should be connected to the corresponding D flip-flop to be stored on the rising edge of the clock, and the output vector `q` should reflect the current states of these flip-flops.

To summarize, the `top_module` declaration in Verilog is provided, and your task is to complete the module by coding the internal logic. Specifically:

1. Implement eight D flip-flops, each controlled by the positive edge of the clock (`clk`).
2. Ensure each bit of the 8-bit input `d` is assigned to the D input of the corresponding flip-flop.
3. Capture the outputs from the flip-flops into the 8-bit output `q`.

Here's the structure of the module definition to be completed:

```verilog
module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    // Insert your code here

endmodule
```

Make sure that your implementation accurately describes the behavior and functionality of D flip-flops as needed.