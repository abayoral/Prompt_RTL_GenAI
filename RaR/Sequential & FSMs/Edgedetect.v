Imagine that you are a seasoned Digital Design Engineer working at a prominent hardware design firm. You have been entrusted with the crucial task of developing a Verilog module that is integral to a next-generation product. The performance and functionality of this module are vital as they play a significant role in preserving the esteemed reputation of your computer hardware company within the competitive industry.

Your assignment involves detecting specific changes in a given 8-bit vector. More precisely, you need to implement a mechanism where, for each individual bit in this 8-bit vector, you can identify when there is a transition from a logic '0' in one clock cycle to a logic '1' in the subsequent cycle. This functionality is akin to detecting a positive edge transition for each bit. The desired behavior is such that the corresponding output bit should be asserted in the clock cycle immediately following the detection of a 0 to 1 transition in the input signal.

The module you are tasked with designing, titled `top_module`, has the following interface:
- `clk`: This is the clock signal that synchronizes the operations within the module.
- `in`: This is an 8-bit wide input vector, each bit of which needs to be individually monitored for the specified transition.
- `pedge`: This is an 8-bit wide output vector that indicates, for each respective input bit, whether a positive edge transition was detected.

Your goal is to fill in the logic within this module that accurately performs this transition detection for all bits in the `in` vector, ensuring that the `pedge` output is set correctly according to the transition detection requirement described. Consider the necessary use of sequential logic elements to achieve this task, as changes are detected across clock cycles. This task is critical and requires meticulous attention to detail to maintain the high standards of quality and performance expected from your company’s products. 

```verilog
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);

    // Insert your code here

endmodule
```