You are a senior Digital Design Engineer working at a prominent hardware design company, and you've been assigned the pivotal task of developing a critical Verilog module that is integral to the company's forthcoming next-generation product. The outcome of this specific module's development is crucial, as it directly impacts the company's standing and reputation within the highly competitive computer hardware industry.

The task at hand involves implementing a Moore state machine, characterized by having a single input, a single output, and comprising four distinct states. Below is the given state transition table denoting how the state machine should behave based on its current state and input conditions:

1. State A:
   - Transitions back to State A if the input (`in`) is 0, with an output of 0.
   - Transitions to State B if the input (`in`) is 1, with an output of 0.

2. State B:
   - Transitions to State C if the input (`in`) is 0, with an output of 0.
   - Remains in State B if the input (`in`) is 1, with an output of 0.

3. State C:
   - Transitions back to State A if the input (`in`) is 0, with an output of 0.
   - Transitions to State D if the input (`in`) is 1, with an output of 0.

4. State D:
   - Transitions to State C if the input (`in`) is 0, with an output of 1.
   - Transitions back to State B if the input (`in`) is 1, with an output of 1.

Additionally, it's crucial to incorporate an asynchronous reset functionality in the state machine. The purpose of this reset is to ensure that whenever activated, it immediately returns the Finite State Machine (FSM) to the initial state, which in this scenario is designated as State A. This reset functionality must operate independently of the clock signal, ensuring that the FSM can be reset at any instant.

Below is the skeleton Verilog code provided as a framework for you to complete the implementation of this state machine. You need to focus on defining the state transition logic, managing the state flip-flops with the asynchronous reset, and setting the output logic according to the state table described. 

```verilog
module top_module(
    input clk,       // Clock input to drive the state transitions.
    input in,        // Input signal influencing state transitions.
    input areset,    // Asynchronous reset signal to bring the FSM to State A.
    output out       // Output signal determined by the current state.
);

// Insert your code below to define the state transition logic, 
// state flip-flops incorporating the asynchronous reset, 
// and the output logic based on the current state.

endmodule
```

Focus on designing a coherent implementation that faithfully captures the behavior detailed in the state transition table and addresses all specified functional requirements, including the crucial asynchronous reset feature.