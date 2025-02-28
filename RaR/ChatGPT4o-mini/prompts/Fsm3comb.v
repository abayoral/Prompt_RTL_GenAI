The following table describes the behavior of a Moore state machine with one input, one output, and four states. Using the state encoding A=2'b00, B=2'b01, C=2'b10, and D=2'b11, the state transition table is provided. Your task is to implement only the combinational logic portion of this state machine, which includes the state transition logic (determining the next state based on the current state and input) and the output logic (determining the output based on the current state).

### State Transition Table:
| Current State | Input = 0 | Input = 1 | Output |
|---------------|------------|-----------|--------|
| A (00)         | A (00)    | B (01)    | 0      |
| B (01)         | C (10)    | B (01)    | 0      |
| C (10)         | A (00)    | D (11)    | 0      |
| D (11)         | C (10)    | B (01)    | 1      |

### Module Definition:
Create a Verilog module named `top_module` that has the following:
- Inputs: 
  - `in`: A single bit representing the input of the state machine.
  - `state`: A 2-bit vector representing the current state.
- Outputs:
  - `next_state`: A 2-bit vector representing the next state.
  - `out`: A single bit representing the output of the state machine.

### Parameters:
- Define constants for each state using the `parameter` keyword: `A=0`, `B=1`, `C=2`, `D=3`.

### Tasks:
1. Implement the state transition logic: Determine the value of `next_state` based on the current state (`state`) and the input (`in`).
2. Implement the output logic: Determine the value of `out` based on the current state (`state`).

Here is the partial code for the module where you need to insert your implementation:

```verilog
module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output reg out); //

    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;

    // Insert your code below

    // State transition logic: next_state = f(state, in)

    // Output logic: out = f(state) for a Moore state machine

endmodule
```

Ensure to fill in the logic for both state transitions and output determination.