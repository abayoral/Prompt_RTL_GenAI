The objective is to develop code for programming a finite state machine (FSM) that functions as a control hub for the operation of a motor. This FSM interacts with four inputs - x, y, 'clk' (recognized as 'clock'), and 'resetn' (primarily used for resetting). In turn, it also produces two resultants, identified as f and g, which directly influence the overall performance of the motor.

The FSM initially exists in a state referred to as State A, maintaining a static position as long as the 'resetn' input remains confirmed. However, following the de-assertion of the 'resetn' command, as soon as the clock's edge comes into play, the function of the FSM relies on successfully turning the output f into a value of 1, which should persist for a full clock cycle.

Upon the completion of the aforementioned clock cycle, the programming of the FSM mandates a constant focus on the x input. The FSM is specifically configured to detect a particular sequence of values represented by 1, 0, and 1 provided by the x input over the course of three clock cycles. If such a pattern is observed, the FSM is then instructed to alter the value of g from its current stage to a value of 1 in the very next clock cycle.

Moving forward, the FSM continues to keep the g value as 1 while simultaneously observing the y input values. Should the y input produce a value of 1 within the span of the following two clock cycles, the FSM is prepped to lock the output g at the value of 1 until another reset command is triggered. However, a failure on part of y input to achieve a value of 1 within the set period of two clock cycles, calls for the FSM to revert g back to a value of 0, maintaining it until a reset is instructed again.

It is crucial to remember a specific hint for this FSM's operations, stating that the survey of the x input only commences in the cycle that follows the confirmation of f turning into a value of 1. The preliminary module that sets the FSM's operations into motion is already identified and you are required to develop the coding framework that can actualize these sequences of operations in a timely manner.

The structure of the module is defined as follows:

Module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
);

	// Your code to be inserted here

endmodule