Imagine you are a seasoned Digital Design Engineer at a top-tier hardware design firm, and you have been entrusted with creating a critical Verilog module for a next-generation product. The performance and reliability of this module are essential for upholding your company’s prestigious reputation in the competitive computer hardware market.

In this task, you are required to design a Verilog module with three input signals and four output signals. The functionality of the module is straightforward: it should establish direct “wire-like” connections between the inputs and outputs according to the following mapping:

• The input signal 'a' must drive the output signal 'w'.
• The input signal 'b' must drive both the output signals 'x' and 'y'.
• The input signal 'c' must drive the output signal 'z'.

The essence of the task is to reproduce these connections within the module. To implement this behavior, you might find it useful to utilize the concatenation operator, which in Verilog is written as { signal1, signal2, signal3, ... }.

Your goal is to define the module with the declared inputs and outputs, and then code the internal connections such that the physical wiring integrity of the design is maintained as specified. No additional processing or logic is required—only the direct mapping between inputs and their respective outputs.