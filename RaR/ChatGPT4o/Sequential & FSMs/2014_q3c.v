As a senior Digital Design Engineer at a cutting-edge hardware design company, you have been tasked with developing a critical Verilog module for an advanced product that your team is working on. This module plays a vital role in the overall success of the product, and its correct functionality is essential in preserving the esteemed reputation your company holds within the competitive computer hardware industry.

The task at hand is to implement the logic functions for outputs Y[0] and z based on the provided state transition table. This table delineates the behavior of the logic circuit with respect to various present and next states and corresponding outputs depending on the input value x. 

The state transition table is structured as follows:

- **Present State [y2:0]**: Denotes the current state of the system in a 3-bit format.
- **Next State [Y2:0]**: Specifies the upcoming state transition based on the given input x, which can be either 0 or 1.
- **Output z**: Represents the output of the system for each current state transition.

For clarity, here is a breakdown of the table:
- When the present state is `000`, the next state transitions to `000` if x is 0, and to `001` if x is 1, with an output z of 0.
- When the present state is `001`, the next state transitions to `001` if x is 0, and to `100` if x is 1, with an output z of 0.
- When the present state is `010`, the next state transitions to `010` if x is 0, and to `001` if x is 1, with an output z of 0.
- When the present state is `011`, the next state transitions to `001` if x is 0, and to `010` if x is 1, with an output z of 1.
- When the present state is `100`, the next state transitions to `011` if x is 0, and to `100` if x is 1, with an output z of 1.

You are required to write a Verilog module called `top_module` that accurately reflects these state transitions and outputs. The module takes a clock signal `clk`, a 3-bit input `y` representing the present state, and a single-bit input `x`. It should produce the next state output `Y0` as well as the output `z` based on the logic defined in the table. 

Please ensure your design is efficient and takes into account the critical nature of the task, as this implementation is integral to the product's success.