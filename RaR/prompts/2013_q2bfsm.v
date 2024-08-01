Consider a scenario where you need to design a finite state machine (FSM) for controlling a motor. The FSM takes two inputs, x and y, from the motor, and produces two outputs, f and g, that are used to control the motor's operation. In addition to these inputs and outputs, the FSM also has a clock input (clk) and an active-low synchronous reset input (resetn).

Here are the detailed operational requirements for the FSM:

1. Initially, as long as the reset input (resetn) is active (i.e., low), the FSM should remain in its initial state, referred to as state A.
2. Once the reset input is de-asserted (i.e., set to high), on the next rising edge of the clock (clk), the FSM should transition from state A and set the output f to 1 for exactly one clock cycle.
3. Following this transition, the FSM enters a mode where it continuously monitors the value of the input x.
   - The FSM should specifically look for the sequence 1, 0, 1 on the input x over three successive clock cycles.
   - When this sequence (1, 0, 1) is detected, the output g should be set to 1 on the subsequent clock cycle.
4. Once g is set to 1, the FSM should then monitor the input y for up to two clock cycles.
   - If the input y becomes 1 within these two clock cycles, the output g should remain 1 indefinitely (until the reset is asserted again).
   - If y does not become 1 within the two clock cycles, the output g should be set to 0 permanently (again, until the reset is asserted).

A critical detail to note is that the monitoring of the input x does not begin until the clock cycle following the setting of the output f to 1.

With these requirements in mind, you should implement the FSM using a Verilog module structure as provided. The module should have the following ports:
- clk: the clock input.
- resetn: the active-low synchronous reset input.
- x: input from the motor (monitored for the sequence 1, 0, 1).
- y: input from the motor (checked within the two-clock-cycle window after g is set to 1).
- f: the control output that is set to 1 for one clock cycle after the reset is de-asserted.
- g: the control output that is set to 1 or 0 based on the conditions described.

The Verilog module to implement these functionalities begins as follows:

```verilog
module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output reg f,
    output reg g
); 

    // Insert your code here

endmodule
```

Make sure to handle various states and transitions carefully to ensure the FSM meets all the specified conditions.