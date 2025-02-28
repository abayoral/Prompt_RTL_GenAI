Imagine you are serving as a senior Digital Design Engineer at a top-tier hardware design company. Your current assignment is of utmost importance: you must develop a Verilog module that forms a critical component of a next-generation hardware product, which is essential for maintaining the company's prestigious reputation in the industry.

The task is to create a module that instantiates eight D-type flip-flops. Each flip-flop should incorporate an active high asynchronous reset feature, meaning that when the reset input is asserted high, the flip-flop should reset immediately, independent of the clock signal. Despite the similarity between synchronous and asynchronous resets in their overall functionality, the key distinction in your implementation lies in how the sensitivity list of the always block is constructed.

Additional details for your module:
• The module should be named "top_module."
• The inputs to the module include:
  - A clock signal "clk," where all flip-flops are triggered on the positive edge.
  - An active high asynchronous reset signal "areset."
  - An 8-bit input "d," representing the data inputs for each of the eight flip-flops.
• The output "q" consists of an 8-bit bus, which holds the current states of the flip-flops.

Remember, the critical difference in code between implementing a synchronous versus an asynchronous reset lies in the sensitivity list of the always block. With an asynchronous reset, the always block must be sensitive to changes in the reset signal in addition to the clock.

Your objective is to design this Verilog module according to these specifications. Do not provide any solutions or code – focus on ensuring you fully understand the requirements and the details of the task.