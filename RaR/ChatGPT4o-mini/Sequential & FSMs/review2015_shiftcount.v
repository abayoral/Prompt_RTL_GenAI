As a senior Digital Design Engineer at a prominent hardware design company, you have been given the critical responsibility of designing a Verilog module that is essential for a next-generation product. This task is particularly significant, as the successful implementation of this module is crucial for preserving and enhancing your company’s esteemed reputation in the competitive landscape of the computer hardware industry. 

Your assignment is to create a four-bit shift register that functions not only as a storage element but also as a down counter. The functionality of this module hinges on specific control signals: when the shift enable signal (shift_ena) is activated (set to 1), the data should be shifted into the register starting from the most significant bit (MSB). Conversely, when the count enable signal (count_ena) is activated (also set to 1), the current value contained within the shift register should decrease by one. 

It is worth noting that, in the context of the full system, the two control inputs (shift_ena and count_ena) will never be activated simultaneously. Thus, regardless of the behavior of your circuit when both inputs are set to 1, the focus should primarily be on the individual functionality of each control input. There is some leniency here regarding how your design will handle simultaneous activation, since whether shift_ena or count_ena has higher priority does not affect the overall functioning of the system. 

With this understanding, please consider the following parameters for the implementation: 
- You need to ensure that the shift register can properly handle data input and shifting operations based on the specified control signal.
- You must also incorporate the decrementing feature for the down-counter that responds to the count_ena signal.
- The module should adhere to the expected interface defined by the provided code structure, taking into account the clock input (clk), the data input, and the output (q) that represents the current state of the shift register and counter.

Please proceed to define this module with all the necessary elements that fulfill the stated requirements.