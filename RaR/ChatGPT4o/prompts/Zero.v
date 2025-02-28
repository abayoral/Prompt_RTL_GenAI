Could you design a digital circuit using Verilog that has no input signals but includes a single output signal? The desired behavior of this output signal is to always maintain a constant value of 0. To help you get started, here is a skeleton of the Verilog module:

```verilog
module top_module(
    output zero
); // This line defines the output signal 'zero'

// The body of the module should be implemented here

endmodule
```

In extending this question, please specify how you would implement the internals of the `top_module` such that the output 'zero' is perpetually set to 0. Remember that the module should operate without any input signals and should only encompass the mechanism required to ensure that 'zero' is consistently outputting a logic low state (0).