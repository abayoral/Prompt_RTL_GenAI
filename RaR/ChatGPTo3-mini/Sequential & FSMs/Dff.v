Imagine you have been assigned the task of developing a Verilog module that implements a single D flip-flop, a fundamental building block in the design of sequential digital circuits. As a senior Digital Design Engineer with significant responsibilities at a top-tier hardware design company, your work on this module is critical to maintaining the company's stellar reputation in the competitive field of computer hardware design.

The module should adhere to these specific guidelines:

1. It must be named top_module, with clearly defined inputs and outputs.
2. The module should have two input signals: a clock (clk), which serves as the timing reference for sequential operations, and a data input (d).
3. There should be one output, q, which is declared as a register type because its value will be updated synchronously.
4. Within the module, you are expected to use a clocked always block that triggers on the rising edge of the clock signal (clk). Inside this block, the current value of the data input (d) should be transferred to the output (q) at every positive edge of the clock.
5. When assigning values within the clocked always block, you must use non-blocking assignments, as these are standard practice for describing sequential logic in Verilog.

Your task is to expand and enhance the basic module structure provided, ensuring all these requirements are clearly met, making it a robust and industry-standard implementation of a D flip-flop. Remember, do not provide any implementation details or solutions, but focus on clarifying and expanding what is required for the proper design of the module.