Consider the following design challenge:

You are a senior Digital Design Engineer at a well-respected hardware design company. Your task is to develop a critical Verilog module for an upcoming next-generation product. The successful implementation of this module is extremely important for preserving your company’s reputation in the competitive computer hardware industry.

The module you need to create must process serial communication data where the transmission scheme includes special formatting bits. In many older serial communication protocols, data is framed by appending additional bits to each byte: specifically, a start bit is transmitted before the eight data bits and a stop bit is transmitted afterward. Under this scheme, the transmission format is as follows:
• The line idles at a logic level of 1.
• A start bit (logic 0) indicates the beginning of a byte.
• Eight sequential data bits immediately follow the start bit.
• A stop bit (logic 1) marks the end of the data byte.

Your Verilog module should implement a finite state machine (FSM) that correctly detects when a full byte has been received. The FSM must perform the following steps:
1. Detect the start bit.
2. Sequentially capture and process the eight data bits that follow.
3. Check for the presence of the stop bit at the appropriate time.
4. If the stop bit is not found when expected, the FSM must continue to monitor the incoming bit stream until a stop bit is detected, even if this means discarding the current sequence, before resuming the reception of subsequent bytes.

The module has the following interface:
• A clock signal (clk) that governs the timing.
• An input signal (in) which represents the very serial bit-stream.
• A synchronous reset signal (reset) that should clear the FSM to its initial state.
• An output signal (done) that indicates when the FSM has successfully detected a complete and correctly framed byte.

You are to write your solution in Verilog within the provided module skeleton:

--------------------------------------------------
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
);

    // Insert your code here

endmodule
--------------------------------------------------

Your task is to devise a robust FSM-based design that meets the above requirements without leaving any ambiguity in the bit framing. Be sure to consider all edge cases, such as the scenario when the expected stop bit is missing. Once a stop bit is eventually detected, the FSM should correctly synchronize its state to begin the reception of the next byte.

Remember: Do not include any solution code or specific implementation details. Focus solely on clarifying and expanding the design question as presented.