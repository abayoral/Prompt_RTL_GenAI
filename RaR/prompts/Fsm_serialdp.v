We want to enhance the serial receiver by incorporating parity checking functionality. In this context, parity checking involves adding an extra bit to each data byte. We will use odd parity, which dictates that the number of '1' bits in the received sequence of 9 bits (8 data bits plus 1 parity bit) must be odd. For instance, the bit sequence 101001011 meets the requirements for odd parity since it contains five '1' bits, which is an odd number. Conversely, the sequence 001001011 does not meet the odd parity requirement as it contains four '1' bits, which is even.

To achieve this, we need to modify the finite state machine (FSM) and datapath to perform odd parity checking. Specifically, the FSM should assert the 'done' signal only if an entire byte is correctly received, along with a successful parity check. Similar to the original serial receiver FSM, the enhanced FSM must:

1. Identify the start bit,
2. Wait for all 9 bits (8 data bits followed by the parity bit) to be received,
3. Verify that the stop bit appears as expected.

If the stop bit does not appear when anticipated, the FSM must enter a state where it waits until the stop bit is detected before attempting to receive the next byte.

You are provided with a module to calculate the parity of the input bit stream. This module consists of a T flip-flop (TFF) with a reset function. The intended use is to provide the bit stream as input to this module and reset it at the appropriate times so that it can count the number of '1' bits within each byte.

The module for calculating parity is defined as follows:

```verilog
module parity (
    input clk,
    input reset,
    input in,
    output reg odd
);
    always @(posedge clk)
        if (reset) odd <= 0;
        else if (in) odd <= ~odd;
endmodule
```

Notes:
- The serial protocol sends the least significant bit (LSB) first.
- The parity bit is sent after the 8 data bits.

The task is to integrate the parity checking capability into the FSM and datapath of your serial receiver module. Given below is the module for the top-level implementation. You will need to insert the appropriate code to modify the FSM and datapath to include parity checking.

```verilog
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
);
    // Insert your code below

    // Modify FSM and datapath from Fsm_serialdata

    // New: Add parity checking.

endmodule
```