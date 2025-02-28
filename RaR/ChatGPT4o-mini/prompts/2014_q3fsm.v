The goal of your task is to design and implement a finite state machine (FSM) using Verilog. The FSM responds to two inputs, `s` and `w`, and generates an output `z` based on specific conditions and state transitions. Here is a detailed breakdown of the requirements and functionality you need to consider:

1. **Initial State and Transition Based on `s`**:
    - The FSM begins in a reset state called `A`.
    - As long as the input `s` is equal to 0, the FSM stays in state `A`.
    - When `s` becomes 1, the FSM transitions from state `A` to state `B`.

2. **Behavior in State `B`**:
    - Once in state `B`, the FSM starts examining the input `w` over the next three clock cycles.
    - During these three clock cycles, it counts the number of times `w` is equal to 1.
    - If `w` equals 1 exactly two times within these three clock cycles, the FSM sets the output `z` to 1 in the fourth clock cycle following these three observed cycles.
    - If `w` does not equal 1 exactly two times, the output `z` is set to 0.
    - The FSM repeats this checking of `w` every three clock cycles sequentially.

3. **Constraints and Optimization**:
    - The FSM should use as few states as possible for an efficient implementation.
    - It’s important to note that the input `s` is relevant only while the FSM is in state `A`. Once the FSM transitions to state `B`, it should only focus on the `w` input.

Your task is to implement this FSM using Verilog and ensure that it correctly transitions between states and generates the appropriate output values as described. Here is the module declaration to use as a starting point:

```verilog
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    // Insert your code here

endmodule
```

Make sure that your implementation accounts for the synchronous reset and the state transitions as described. The behavior of the FSM as specified should be reflected in the logic and state definitions you create within your Verilog module.