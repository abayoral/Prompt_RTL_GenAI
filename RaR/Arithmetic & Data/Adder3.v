Imagine you are working as a senior FPGA Engineer at a prominent hardware design firm, where you have been entrusted with the task of developing an essential Verilog module for an upcoming, state-of-the-art product. The performance and reliability of this module are crucial, as they play a significant role in sustaining your company's esteemed position within the competitive computer hardware market.

Specifically, your task involves constructing a 3-bit binary ripple-carry adder using Verilog. This adder is designed to perform the addition of two 3-bit binary numbers, along with an additional carry-in bit. The goal is to generate a resulting 3-bit binary sum and an overall carry-out. To create this 3-bit adder, you are required to utilize three separate full-adder instances. Each full-adder should individually take care of one bit of the binary numbers being added, in sequence.

Moreover, the design should keep track of the carry-out from each of these full-adders, ensuring the output reflects not only their sum but also the intermediate carry values. The final carry-out from the last full-adder, named cout[2], represents the ultimate carry-out of this ripple-carry adder—a detail you might frequently encounter in similar designs.

Given this information, you need to develop the corresponding Verilog code within the 'top_module', where:
- Inputs: Two 3-bit numbers 'a' and 'b', and a single 'cin' representing carry-in.
- Outputs: A 3-bit carry-out vector 'cout' and a 3-bit sum vector 'sum', both required to accurately reflect the arithmetic operation undertaken by this ripple-carry adder.

How will you ingeniously insert your Verilog code to fulfill these requirements?