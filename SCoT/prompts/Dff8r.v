Understand the Requirements:
    The task is to create a module with 8 D flip-flops, each having active high synchronous reset.
    Each flip-flop should capture the value of its corresponding bit in the input vector `d` on the rising edge of `clk`.
    If the `reset` signal is high, each flip-flop should output 0 regardless of the value of `d`.
    The flip-flop outputs are collected in the output vector `q`.

Determine the Inputs and Outputs:
    Inputs: clk, reset, d[7:0]
    Outputs: q[7:0]

Define Intermediate Signals:
    No intermediate signals are needed as each flip-flop directly maps to one bit of `d` and `q`.

Structuring the Module:
    Start with the module declaration, specifying the inputs and outputs.
    Use an always block triggered on the rising edge of `clk`.
    Inside the always block:
        - First, check if `reset` is active (high).
        - If `reset` is high, assign 0 to every bit of `q`.
        - If `reset` is low, assign the value of `d` to `q` on each rising edge of `clk`.
    Each flip-flop can be implemented in this way ensuring synchronous reset functionality, sharing a single always block.