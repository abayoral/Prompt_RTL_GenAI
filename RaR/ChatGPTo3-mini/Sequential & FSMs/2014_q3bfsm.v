Imagine you have been assigned the role of a senior Digital Design Engineer at a prominent hardware design company, where your expertise is critical in the development of a Verilog module for an upcoming, next-generation product. This module is of strategic importance, as its successful operation will directly contribute to upholding and enhancing your company's reputation within the highly competitive computer hardware industry.

Your task is to design a finite-state machine (FSM) based on a specific state-assigned table provided below. The table defines both the present states and the corresponding next states, along with the associated output ("z") for the FSM, depending on the input signal "x." Importantly, when a synchronous reset is activated, the FSM must return to the initial state represented by the binary code 000.

The state table is organized as follows:

1. For the present state 000:
   - If the input x is 0, the FSM remains in state 000.
   - If the input x is 1, the FSM transitions to state 001.
   - The output z for this state is 0.

2. For the present state 001:
   - If the input x is 0, the FSM stays in state 001.
   - If the input x is 1, the FSM moves to state 100.
   - The output z for this state is 0.

3. For the present state 010:
   - With x = 0, the next state remains as 010.
   - With x = 1, the next state becomes 001.
   - The output z is 0.

4. For the present state 011:
   - When x is 0, the next state is 001.
   - When x is 1, the FSM transitions to 010.
   - The output z for this state is 1.

5. For the present state 100:
   - If x is 0, the FSM moves to state 011.
   - If x is 1, it remains in state 100.
   - The output z for this state is 1.

You are provided with a Verilog module template that includes inputs for the clock, a synchronous reset, and the signal x, as well as an output signal z. Within this module, you are expected to implement the FSM in Verilog code, ensuring that:
- The FSM performs transitions according to the state table.
- The synchronous reset drives the FSM back to the default state 000.

The module interface is defined as follows:

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    // Your Verilog code implementation goes here

endmodule

Your design effort will involve expertly coding the FSM so that it behaves exactly as specified by the state table and meets the requirement for a synchronous reset. This is a critical assignment, and precision in state transitions, output logic, and reset behavior is essential for ensuring the reliability and performance of the final product.

Remember, your submission should include only the Verilog module implementation according to the provided specifications, and you are not to include any solution or answer explanation beyond the code itself.