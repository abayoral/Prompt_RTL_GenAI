As a senior Digital Design Engineer at a prominent hardware design company, I have been assigned the crucial task of developing a Verilog module that plays a key role in the functionality of a next-generation product. This module is vital not only for the technical aspects of the product but also for upholding the reputation of the company within the competitive landscape of the computer hardware industry.

I need to design a 4-bit right shift register, which should also include specific features such as an asynchronous reset function, a synchronous load capability, and an enable signal for shifting operations. Here’s a detailed breakdown of the requirements:

1. **Asynchronous Reset:** The shift register must be able to reset to zero immediately when the asynchronously active-high reset signal (`areset`) is asserted. This feature ensures that the register can be quickly brought to a known state regardless of the clock cycles.

2. **Synchronous Load:** The module should support a loading operation, in which the data input (`data[3:0]`) can overwrite the contents of the shift register when the `load` signal is asserted. This functionality must be designed to take precedence over the shifting operation.

3. **Enable for Shifting:** The shift operation should be enabled via the signal (`ena`). When this signal is active, the shift register should perform a right shift, where the most significant bit (`q[3]`) is set to zero, and all other bits are shifted right, with `q[0]` being lost in the process. 

4. **Priority Logic:** In the scenario where both `load` and `ena` are asserted at the same time, the module should prioritize the `load` operation over the right shift. Therefore, the signal to load new data must take precedence, ensuring that the register behaves predictably in this condition.

5. **Output Specification:** The contents of the shift register should be accessible via the output register (`q[3:0]`), representing the current state of the shift register after applying the reset, load, or shift operations.

In light of these requirements, I am seeking guidance on how best to implement this functionality in Verilog while ensuring that the design remains efficient, reliable, and easy to interpret. How should I proceed to construct this module to meet the outlined specifications effectively?