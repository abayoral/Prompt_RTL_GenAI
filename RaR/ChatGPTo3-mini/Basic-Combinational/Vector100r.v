Imagine you are a seasoned Digital Design Engineer at a top-tier hardware design company, where creating high-performance Verilog modules is part of your everyday responsibilities. Your current assignment involves developing a crucial Verilog module intended for an upcoming, cutting-edge product. This module is vital not only for the functionality of the system but also for upholding the reputation and reliability of our computer hardware solutions in a competitive industry.

The task is as follows:
- You have a 100-bit input vector, indexed from bit 99 down to bit 0.
- Your objective is to produce a 100-bit output vector where the order of the bits is reversed compared to the input vector. In other words, the bit at index 0 of the input should become the bit at index 99 of the output, the bit at index 1 should become the bit at index 98, and so on.

An approach recommended for solving this challenge is to use a combinational always block with a for loop, which efficiently maps each bit from the input to its reversed position in the output. The hint suggests that while a generate block is an alternative option, a combinational always block is preferable for this specific case because you don't need module instantiation functionality that typically comes with generate blocks.

Your task is to write the Verilog module named "top_module" that incorporates this functionality. The module should consist of:
1. An input declaration for a 100-bit vector labeled "in".
2. An output declaration for a 100-bit vector labeled "out".
3. A combinational logic block (using an always block) that effectively implements the bit reversal operation, likely utilizing a for loop.

Remember, this description is meant to guide the implementation and clarify the requirements without providing any complete solution code. Your focus should remain on understanding the exact nature of the task, the bit-level manipulation required, and the recommended method for achieving it within a combinational logic context in Verilog.