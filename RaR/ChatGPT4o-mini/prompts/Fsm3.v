In the context of designing a Moore state machine in Verilog, the provided state transition table showcases the behavior of the state machine, which includes one input signal, one output signal, and four distinct states labeled A, B, C, and D. Each state has defined transitions dependent on the binary input signal ('in') and an associated output value. The state table specifies the next state for each combination of the current state and input signal, as well as the output for each state. Additionally, the state machine must feature an asynchronous reset that resets it to state A.

The breakdown of the state transition table is as follows:
- When in state A:
  - If the input ('in') is 0, it stays in state A.
  - If the input ('in') is 1, it transitions to state B.
  - The output is 0.

- When in state B:
  - If the input ('in') is 0, it transitions to state C.
  - If the input ('in') is 1, it remains in state B.
  - The output is 0.

- When in state C:
  - If the input ('in') is 0, it transitions to state A.
  - If the input ('in') is 1, it transitions to state D.
  - The output is 0.

- When in state D:
  - If the input ('in') is 0, it transitions to state C.
  - If the input ('in') is 1, it transitions to state B.
  - The output is 1.

Given this state machine description, your task is to implement this state machine in Verilog, ensuring that the state machine adheres to the described state transitions and output behavior, while incorporating an asynchronous reset mechanism that initializes or resets the state machine to state A when activated.

Here is a skeleton of the Verilog module to start with:

```verilog
module top_module(
    input clk,
    input in,
    input areset,
    output out);

    // Insert your code below to implement the following:

    // 1. State transition logic: Define the logic that determines the next state based on the current state and the input ('in').

    // 2. State flip-flops with asynchronous reset: Implement flip-flops to store the current state, with an asynchronous reset to set the state to A when 'areset' is active.

    // 3. Output logic: Define the output ('out') based on the current state.

endmodule
```

Ensure to include the state encoding, which could use either binary or one-hot encoding, the state transition logic inside the always block sensitive to clock and asynchronous reset, and the combinational logic for the output.