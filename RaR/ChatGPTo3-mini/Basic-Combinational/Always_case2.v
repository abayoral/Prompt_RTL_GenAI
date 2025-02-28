Imagine you're a senior Digital Design Engineer at a well-respected hardware company, and you have been given the crucial task of developing a Verilog module for an upcoming, state-of-the-art product. The module you need to design is a 4-bit priority encoder. In this context, a priority encoder is a circuit that takes a 4-bit input and encodes it into a smaller number of bits that reflects the highest-priority bit among those that are active (i.e., high).

Here are the expanded details for the task:

• Objective: Design a module that implements a 4-bit priority encoder. This encoder should analyze the 4-bit input signals and determine the position of the highest-order high bit. If none of the input bits is set to high (i.e., if the input value is zero), the module must explicitly output zero.

• Input-Output Specification: 
  - Input: A 4-bit signal that represents a number with 16 possible combinations (ranging from 0 to 15).
  - Output: A 2-bit signal representing the position of the highest-order high bit. However, if the entire input is zero (no bits are high), the output should also be zero.

• Practical Considerations: 
  - Given that there are multiple number representation options in Verilog (binary, hexadecimal, decimal), consider using hexadecimal (e.g., 4'hb) or decimal (e.g., 4'd11) literals for brevity and clarity instead of binary representations, which may be more verbose (e.g., 4'b1011).

• Additional Context: 
  - The design is written in Verilog using the Verilog 2001 standard, as indicated by the synthesis directives.
  - The template of the module is provided, including the module declaration and the input/output port definitions. Your task is to implement the required logic within the module.

This expanded description clarifies the requirements and context of the problem without indicating any specific coding approaches or solutions.