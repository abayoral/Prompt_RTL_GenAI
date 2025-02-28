Your task is to design a simple digital circuit module using Verilog, which is a hardware description language. This circuit should have no input signals and only one output signal. The output signal should always be in a logic high state, which corresponds to a digital value of '1'.

Here is the template of the Verilog module you need to complete:

```verilog
module top_module(
    output one
);

// Insert your code here
    assign one = [fixme];

endmodule
```

To summarize, you need to do the following:
1. Ensure the module `top_module` has no input parameters.
2. Define an output signal named `one`.
3. Assign a constant logic high value to the output signal `one` within the body of the module. Replace the placeholder `[fixme]` with the proper value that will ensure `one` is always logic high.

Make sure to follow Verilog syntax and semantics to achieve this.