Imagine you are a seasoned digital design engineer working for a top-tier hardware company, and you have been assigned a mission-critical task: designing a Verilog module for a new, next-generation product. The integrity and performance of this module are essential, as they directly impact your company’s reputation in the competitive computer hardware market.

Here’s the scenario you need to address:

A PS/2 mouse communicates data using a protocol in which each complete message consists of three bytes. However, within a continuous stream of bytes, it isn’t inherently clear where one complete message ends and the next one begins. There is one key clue to help delineate the messages: the very first byte of every three-byte message always has its bit position 3 (i.e., bit[3]) set to 1. Note that in the subsequent two bytes of the message, bit[3] can be either 0 or 1; there is no reliable pattern there.

The challenge is to design a finite state machine (FSM) that can continuously scan through an incoming byte stream and correctly identify the boundaries of each three-byte message. The strategy is straightforward: ignore or discard incoming bytes until you encounter a byte where bit[3] == 1. This byte is then considered as the first byte of a new message. After identifying it, the FSM should collect the next two bytes, thereby accumulating a complete three-byte message. Immediately after the third byte is received (in the very next clock cycle), the FSM should assert a signal, labeled “done,” to indicate that a complete message has been successfully detected.

There are some additional constraints and details:

• Although the module receives an 8-bit input (in[7:0]), your FSM will use only the bit at position 3 (in[3]) for determining message boundaries.

• You are tasked with developing this FSM using roughly 4 states. A design with only 3 states might be insufficient because you need an extra state to properly handle the “done” signaling, which must be true for exactly one cycle immediately following the receipt of the third byte.

• The module skeleton is provided below, and you are expected to fill in the necessary state transition logic, state flip-flops, and output logic within the module:

--------------------------------------------------
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    // Insert your code below

    // State transition logic (combinational)

    // State flip-flops (sequential)
 
    // Output logic

endmodule
--------------------------------------------------

Your task is to develop this Verilog FSM such that it meets the requirements mentioned above. Be sure that it can reliably discard extraneous bytes until a valid start of message is detected (i.e., an incoming byte with bit[3] equal to 1) and then properly sequence through the next two bytes. Finally, ensure that the “done” signal is activated just one clock cycle after the third byte is received, so that it correctly signifies the reception of a complete PS/2 mouse message.

Remember: your solution should focus solely on the design of this FSM and ensuring its correct behavior, without providing any further simulation or operational code details.