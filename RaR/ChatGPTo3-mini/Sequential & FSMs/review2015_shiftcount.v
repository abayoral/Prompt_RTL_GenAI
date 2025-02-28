Imagine that you are a senior Digital Design Engineer working for a prominent hardware design company. Your responsibility is to create a critical Verilog module that will be a key component in a next-generation product. The performance and correctness of this module are essential for upholding your company's reputation in the competitive computer hardware market.

Your task is to design and implement a four-bit shift register that also functions as a down counter. The module must handle two different operational modes depending on the control signals provided:

1. When the control signal named "shift_ena" (shift enable) is asserted (i.e., is 1), the module should shift in data into the shift register. The shifting should occur in a most-significant-bit-first order, meaning that the new data appears at the highest order bit and the previous bits shift accordingly.

2. When the control signal named "count_ena" (count enable) is asserted (i.e., is 1), the current value stored in the shift register should be decremented by one, functioning as a down counter.

It is important to note that in the overall system design, these two control signals, "shift_ena" and "count_ena", are never both active at the same time. Consequently, if both signals happen to be high concurrently, the behavior of the circuit in that scenario is irrelevant, and you do not need to worry about specifying which operation takes precedence.

The module interface is provided as follows:

module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    // Insert your code here

endmodule

Your goal is to build a Verilog module that fulfills these requirements. Focus on correctly implementing the dual functionality—either shifting in a new data bit (most-significant bit first) when shift_ena is active, or decrementing the register when count_ena is active—while ensuring that the four-bit register behaves as expected under each condition. Remember, the full system design guarantees that both enable signals won't be active simultaneously, so making decisions about their priority in such a case is not necessary.

Please provide only the enhanced description and rephrased question. Do not include any potential solutions or code implementations.