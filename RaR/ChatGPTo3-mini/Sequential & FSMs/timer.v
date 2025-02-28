Imagine you are a senior Digital Design Engineer at a top-tier hardware design company, responsible for creating a critical Verilog module for a next-generation product. The success of this module is essential for preserving your company's stellar reputation in the competitive computer hardware industry.

Your task is to design and implement a timer module in Verilog. This timer functions as a countdown mechanism that operates on clock cycles. The module receives a 10-bit number representing a specified number of clock cycles and, based on this value, counts down until it reaches zero. Once the countdown completes, the module should assert a signal (often referred to as “terminal count” or tc) to indicate that the preset time duration has elapsed.

Key aspects of the module include:

1. At each clock cycle, if the control signal "load" is active (logic high), the module should immediately load the internal counter with the new 10-bit value provided. This loading behavior must occur regardless of whether a previous countdown was in process or had not yet finished, meaning that a new load command can interrupt an ongoing count.

2. If the "load" signal is not active (logic low), the module must simply decrement the internal counter by one in every clock cycle.

3. As soon as the counter reaches 0, the module should assert the output signal "tc" to show that the countdown is complete. Furthermore, after reaching 0, the counter should remain at 0 (effectively freezing or halting the counting process) until the counter is reloaded with a fresh value via the load signal.

Your objective is to write the Verilog code for the timer module that meets these requirements. Do not provide any solutions or answer code—focus solely on making sure you understand and clearly articulate what is expected in the implementation.