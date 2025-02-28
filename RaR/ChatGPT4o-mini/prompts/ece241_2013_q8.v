Please provide an implementation for a Mealy-type finite state machine (FSM) designed to detect the specific sequence "101" in an input signal named `x`. This FSM should have an output signal, `z`, which should be asserted high (logic-1) whenever the sequence "101" is observed in the input stream. The FSM must recognize overlapping sequences; that is, it should be able to register a new "101" sequence starting immediately after the previous sequence has ended without resetting its state.

Additionally, your FSM must incorporate an active-low asynchronous reset mechanism on an input signal named `aresetn`, which resets the FSM to its initial state when asserted low. You are limited to using only three states in your state transition diagram for this FSM. 

The following code template is provided as a starting point for your implementation:

```verilog
module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z 
); 

    // Insert your FSM implementation code here

endmodule
``` 

Here are some specific requirements and guidelines for your implementation:
1. Design the FSM with exactly three states.
2. Ensure that overlapping sequences of "101" are detected.
3. Implement the asynchronous active-low reset correctly.
4. Use the Verilog hardware description language to implement the FSM.

Your task is to complete the provided code template by implementing the required FSM logic.