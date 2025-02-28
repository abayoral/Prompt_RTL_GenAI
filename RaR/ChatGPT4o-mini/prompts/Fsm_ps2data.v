The PS/2 mouse protocol transmits data in the form of messages that are exactly three bytes long. In a continuous stream of bytes, it’s challenging to distinguish the beginning and end of these messages. The only clue to identify the start of a message is that the first byte of each message always has its bit[3] set to 1. For the other two bytes of the message, the bit[3] can either be 0 or 1 depending on the specific data.

Our objective is to design a finite state machine (FSM) that processes an input byte stream to detect the boundaries of each three-byte PS/2 message. The FSM should discard any bytes until it encounters a byte with bit[3]=1, which is regarded as the start of a message. From this point, the FSM will continue to accumulate the next two bytes to complete a three-byte message. Upon completion, the system will signal that a full message has been received by asserting a 'done' signal.

We need to enhance this FSM by adding a datapath that captures the incoming bytes and outputs the complete 24-bit (3 byte) message whenever the message is fully received. The structured message should be represented as follows:
- out_bytes[23:16] should contain the first byte of the message,
- out_bytes[15:8] should contain the second byte,
- and out_bytes[7:0] should contain the third byte.

The output 'out_bytes' should be valid and reflect the captured message whenever the 'done' signal is asserted. At other times, the value of 'out_bytes' is irrelevant and can be treated as a don't-care condition.

With this in mind, you are required to modify the provided module to implement the enhanced functionality, making sure that both the FSM and the new datapath work together to correctly detect and capture complete three-byte PS/2 messages in the ongoing byte stream.

Here is the module template you are to work with:

```verilog
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // Insert your code below
    
    // FSM from fsm_ps2

    // New: Datapath to store incoming bytes.

endmodule
```

Incorporate the FSM logic to detect message boundaries and the datapath to store and output the 24-bit messages appropriately.