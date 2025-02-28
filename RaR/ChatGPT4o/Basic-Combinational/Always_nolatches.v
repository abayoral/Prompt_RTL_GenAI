You have recently been promoted to a senior position as a Digital Design Engineer at a prestigious hardware design firm, where you have been entrusted with a mission-critical task. You are responsible for creating an essential Verilog module intended to be a core component of an upcoming, state-of-the-art product. The module's success is vital for sustaining your company's esteemed reputation in the competitive hardware industry.

The specific challenge you face involves designing a circuit that processes scancodes from a PS/2 keyboard, which is to be used in a gaming context. Your objective is to determine whether any of the arrow keys—left, down, right, or up—on the keyboard have been pressed, based on the last two bytes of scancodes received. The task can be accomplished by implementing a simple mapping using a case statement (or alternatively, an if-elseif structure) with exactly four cases corresponding to the four arrow keys.

The identified scancenodes for the arrow keys are as follows:
- A scancode of `16'he06b` corresponds to the left arrow.
- A scancode of `16'he072` corresponds to the down arrow.
- A scancode of `16'he074` corresponds to the right arrow.
- A scancode of `16'he075` corresponds to the up arrow.

For any other scancode value, none of the arrow keys should be indicated as pressed.

Your circuit is designed with one 16-bit input, `scancode`, and it needs to produce four binary outputs: `left`, `down`, `right`, and `up`. Each output should be asserted as '1' when its corresponding arrow key is detected, and '0' otherwise.

To prevent the creation of unintended latches, it's crucial to ensure that all four outputs are assigned a value in every possible scenario, not just via a default case. This requirement often leads to extensive and repetitive typing, but a streamlined approach involves pre-assigning default values to the outputs before entering the case statement, as demonstrated in the provided hint.

Your task is to develop the Verilog code that fits within the `top_module` framework, ensuring the proper functioning of the module by detecting the specified scancodes and setting the appropriate outputs accurately.

The Verilog module should be compliant with the Verilog 2001 synthesis standard.