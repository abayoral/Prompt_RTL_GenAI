We need to design a Finite State Machine (FSM) to control the shift register within a module. The FSM should have the capability to enable the shift register for exactly 4 clock cycles upon detection of a specific bit pattern. Here’s a more detailed breakdown of the requirements:

1. **FSM Behavior on Bit Pattern Detection:**
    - The FSM should monitor the input for a particular bit pattern (unmentioned here but assumed as part of the system's logic).
    - When the specified bit pattern is detected, the FSM should enable (`shift_ena` signal) the shift register for exactly 4 clock cycles. After the 4 clock cycles, the `shift_ena` should be deasserted until the next detection of the bit pattern.

2. **Reset Behavior:**
    - On receiving a synchronous reset signal (`reset`), the FSM should assert (`shift_ena` high) for 4 clock cycles.
    - Once the 4 clock cycles have elapsed, `shift_ena` should remain deasserted (low) indefinitely, or until another reset occurs.

3. **Implementation Details:**
    - The FSM should have states that manage the count of the clock cycles while `shift_ena` is asserted.
    - Proper state transitions need to be managed to ensure `shift_ena` is asserted for exactly 4 clock cycles upon reset and upon detection of the bit pattern.

Given the above specifications, implement the FSM within the `top_module`. Start by defining the necessary states for the FSM, manage the state transitions based on the clock and reset inputs, and control the `shift_ena` output accordingly. Your implementation should account for the synchronous nature of the reset and ensure precise control over the number of clock cycles `shift_ena` remains asserted.

```verilog
module top_module (
    input clk,
    input reset,      // Synchronous reset
    output reg shift_ena
);

    // Define the states for the FSM
    typedef enum logic [1:0] {
        STATE_IDLE,
        STATE_SHIFT1,
        STATE_SHIFT2,
        STATE_SHIFT3,
        STATE_SHIFT4
    } state_t;

    state_t current_state, next_state;

    // Insert your code here
    
endmodule
```