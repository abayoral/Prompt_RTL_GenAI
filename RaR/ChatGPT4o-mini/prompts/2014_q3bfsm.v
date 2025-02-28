To provide a comprehensive understanding of the problem, let’s rephrase and expand the given task. The goal is to implement a finite-state machine (FSM) based on a provided state transition table.

You are required to design a finite-state machine (FSM) using Verilog based on the state transition table depicted below. This FSM has the following characteristics and requirements:

### State Transition Table
Below is the provided state transition table. The table specifies the current state, the next state based on input `x`, and the output `z`.

```
Present State (y[2:0])   Next State (y[2:0])         Output (z)
                         When x=0   When x=1

000                      000        001              0
001                      001        100              0
010                      010        001              0
011                      001        010              1
100                      011        100              1
```

### Specifications:
1. **Present State (y[2:0])**: The current state of the FSM, represented as a 3-bit binary number.
2. **Next State (y[2:0])**: The next state of the FSM, also represented as a 3-bit binary number. The next state depends on the current input `x` (either 0 or 1).
3. **Output (z)**: The output value of the FSM, which can be either 0 or 1, depending on the present state.

### Inputs and Outputs:
- `clk`: This is the clock signal, which controls the state transitions in a synchronous manner.
- `reset`: This is the synchronous reset signal. When activated, it should reset the FSM to the initial state, which is state `000`.
- `x`: This is the input based on which the state transitions occur.
- `z`: This is the output of the FSM, which is defined for each state as shown in the state transition table.

### Additional Requirements:
- **Reset Functionality**: When the `reset` input is asserted, the FSM should transition to the initial state `000`, regardless of the current state.
- **State Representation**: States are represented using a 3-bit binary number, derived from `y[2:0]`.

### Task:
Implement the described FSM in a Verilog module named `top_module`. The FSM design should consider all state transitions and output definitions as specified in the provided table. You are to create the state registers, state transition logic, and output logic within this module.

Below is a template to get you started with the Verilog implementation:

```verilog
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    // Insert your code here

endmodule
```

Ensure the implementation follows the specified state transitions and output conditions accurately.