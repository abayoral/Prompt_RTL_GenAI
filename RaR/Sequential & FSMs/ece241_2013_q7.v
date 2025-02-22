Imagine you are a senior Digital Design Engineer at a prominent hardware design company, renowned for its cutting-edge product development in the field of computer hardware. You have been entrusted with a mission-critical task: designing a Verilog module that forms an essential component of a next-generation product. This module, specifically a JK flip-flop, plays a vital role in upholding your company's esteemed reputation within the industry.

The task at hand requires you to implement a JK flip-flop using only a D-type flip-flop and additional logic gates. To guide your implementation, refer to the truth table provided below, which specifies the desired behavior of the JK flip-flop:

- When both J and K inputs are 0 (J = 0, K = 0), the output remains unchanged from the previous state (Qold).
- When J is 0 and K is 1 (J = 0, K = 1), the output is set to 0.
- When J is 1 and K is 0 (J = 1, K = 0), the output is set to 1.
- When both J and K inputs are 1 (J = 1, K = 1), the output toggles to the complement of the previous state (~Qold).

As part of your task, you are required to construct this JK flip-flop in Verilog, specifying its design within the given module template. Ensure you utilize only a D-type flip-flop and appropriate logic gates to achieve the desired functionality. The module has the following inputs and outputs: 

- An input called `clk`, which serves as the clock signal for the flip-flop.
- Inputs `j` and `k`, which are the JK flip-flop control inputs.
- An output `Q`, representing the flip-flop's state.

Engage with this challenge by carefully considering the relationship between the JK and D-type flip-flops and strategically incorporating the necessary logic gates to emulate the JK flip-flop behavior. The subsequent Verilog code should be inserted where indicated, within the provided `module top_module`.