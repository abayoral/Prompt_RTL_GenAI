Imagine you are a seasoned Digital Design Engineer at a top-tier hardware design company, and you have been assigned to create a critical Verilog module for an upcoming, next-generation product. The functionality and reliability of this module are essential, as they directly impact your company’s stellar reputation in the computer hardware industry.

Your task is to design and implement a D flip-flop with a synchronous reset. The module should follow the structure provided in the template below:

• The module is named "top_module".
• It has the following inputs: 
  – clk: the clock signal that drives the sequential logic,
  – d: the data input that should be stored in the flip-flop,
  – r: the synchronous reset signal which, when active during a clock cycle, initiates a reset of the stored data.
• The module outputs a single signal, q, representing the current state of the flip-flop.

Key aspects to keep in mind:
• The reset mechanism is synchronous, meaning that the reset signal should be evaluated in line with the clock signal (typically on its rising edge). 
• Your implementation must ensure that during a clock cycle, if the reset is active, the flip-flop resets its state rather than capturing the value of d.

You are encouraged to use modern digital design principles and best coding practices (such as the proper use of non-blocking assignments) to construct a robust and efficient solution. This module is not only a fundamental building block in the product but also plays a crucial role in maintaining your company’s market leadership through dependable hardware design.

Remember, your focus is on clearly understanding the requirements and laying out a well-documented, precise implementation strategy to meet the design specifications outlined above.