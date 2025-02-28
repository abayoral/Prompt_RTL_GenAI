Imagine you are a senior Digital Design Engineer at a top-tier hardware design company. Your assignment involves creating an integral Verilog module that will drive a timer mechanism for one of your company’s flagship next-generation products. The performance and reliability of this timer are critical, as it influences not only the functionality of the product but also the overall reputation of the company in a highly competitive industry.

Your task is to design a finite-state machine (FSM) that forms the control core of a timer. Note that while the FSM controls the timer's operational flow, the data path components—such as counters and comparators—are not part of this assignment.

Here are the functional requirements for the FSM:

1. The FSM should continuously monitor a serial input data line. It must begin a timer sequence upon detecting a specific bit pattern, "1101".
   
2. Once the pattern "1101" is successfully recognized, the FSM must enable an output signal (shift_ena) for exactly four consecutive clock cycles. This activation allows an external mechanism to shift in an additional 4 bits, which define the timer's delay duration.
   
3. After shifting in the duration bits, the FSM transitions to a state where it asserts another output signal (counting). This indicates that the FSM is now waiting for the completion of the counting process by external limit counters.
   
4. The FSM stays in the “waiting” state until it detects that those counters signal the end of the counting process (by asserting the done_counting input).
   
5. Once the counting is finished, the FSM asserts a ‘done’ output to notify the user that the timer period has elapsed. At this stage, the FSM remains in a holding state until it recognizes a user acknowledgment signal (ack). After receiving the acknowledgment, the FSM resets its internal states to commence a new search for the initial "1101" pattern, thus starting a fresh cycle.

Your module's interface should include:
- Input signals: clock (clk), synchronous reset (reset), serial data input (data), a flag indicating counter completion (done_counting), and user acknowledgment (ack).
- Output signals: shift enable (shift_ena), counter waiting indicator (counting), and timer expiration notification (done).

The Verilog module header is provided as follows:

------------------------------------------------------
// Example module header
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    // Insert your code here
endmodule
------------------------------------------------------

Keep in mind that for this assignment, you are solely responsible for implementing the finite-state machine (FSM) logic that orchestrates the timer’s behavior as described above. The integration of the actual counter (data path) is beyond the scope of your design in this problem.

Your goal is to write clear, robust Verilog code that meets these specifications, ensuring that your FSM correctly sequences through detecting the pattern, shifting in bits for the delay, waiting for external counting, and finally notifying the user upon the timer’s expiration.

Remember: Do not include any solution code with your response—focus only on clarifying and elaborating on the problem statement.