Imagine you are a senior Digital Design Engineer at a prominent hardware company tasked with creating a vital Verilog module for a cutting-edge product. The reputation of your company hinges on the successful development of this module, so precision and effectiveness are paramount.

The task involves working with the PS/2 mouse protocol, which communicates by sending messages comprised of three bytes. In a continuous stream of bytes, it is challenging to determine where one message begins and the next one ends because the bytes arrive back-to-back. However, there is a key detail: the first byte of every three-byte message always has its fourth bit (bit[3]) set to 1. Note that for the subsequent two bytes, bit[3] may be either 0 or 1 depending on the actual data.

Your first objective is to design a finite state machine (FSM) that scans through the incoming stream of bytes, discarding bytes until it detects a byte where bit[3] is 1. When such a byte is found, it is assumed to be the first byte of a three-byte message. The FSM must then capture the next two bytes, with the three bytes collectively forming a complete message. Once all three bytes have been received, the FSM should assert a signal (done) that indicates the message is complete.

Building upon the FSM you already developed for parsing PS/2 packets, the expanded requirement is to integrate a datapath capable of storing and outputting the complete three-byte message. The datapath should combine these three bytes into a single 24-bit output signal, where:
• out_bytes[23:16] corresponds to the first byte (the one with bit[3] = 1),
• out_bytes[15:8] corresponds to the second byte,
• and out_bytes[7:0] corresponds to the third byte.

It is critical that the combined 24-bit output (out_bytes) is valid and correctly represents the three-byte sequence at the moment when the done signal is asserted. At any other times, the content of out_bytes can be treated as a don't-care.

Your final module should have the following interface:

• Inputs:
  - clk: the clock signal for synchronizing operations.
  - in: the 8-bit input data coming from the PS/2 byte stream.
  - reset: a synchronous reset signal to initialize or reset the state machine and datapath.

• Outputs:
  - out_bytes: the 24-bit output that holds the assembled three-byte message.
  - done: a signal that indicates when a complete message (all three bytes) has been received and is available on out_bytes.

Write a Verilog module that implements this specification. The module should integrate your FSM from the PS/2 packet parsing design with the new datapath that captures and consolidates the incoming bytes into a 24-bit message. Be sure that out_bytes is fully reliable when the done signal goes high. No solutions or code details are required in your explanation at this point—focus solely on understanding, clarifying, and elaborating this design challenge.