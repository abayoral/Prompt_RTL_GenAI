Imagine you are a senior Digital Design Engineer working at a top-tier hardware design company, and you have been assigned to create a vital Verilog module for an upcoming next-generation product. This module is so critical that its performance will have a significant impact on your company’s reputation in the computer hardware industry.

Your task involves designing a single-output digital system that has four input signals named a, b, c, and d. The system is required to output a logic high (1) under the following conditions: when the 4-bit number formed by the inputs (with a, b, c, and d representing the binary digits) equals 2, 7, or 15. For instance, the number 7 is represented by the input combination a=0, b=1, c=1, and d=1. Conversely, the system must produce a logic low (0) when the inputs form any of the following numbers: 0, 1, 4, 5, 6, 9, 10, 13, or 14.

It is important to note that the input scenarios corresponding to the numbers 3, 8, 11, and 12 are never encountered in this application. This aspect should be kept in mind, as these conditions might be treated as “don’t care” conditions during the logic minimization process.

Your design challenge is two-fold:

1. Determine the minimized expression for the output (named out_sop) in its Sum-of-Products (SOP) form.
2. Determine the minimized expression for the same output (named out_pos) in its Product-of-Sums (POS) form.

A partial Verilog module template is provided below to get you started:

--------------------------------------------------
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

// Insert your code here

endmodule
--------------------------------------------------

Your goal is to clearly derive and present the minimized SOP and POS representations for the specified output based on the conditions given. Keep in mind that you should ensure optimal design practices to achieve minimal logic realization, and you are not required to consider the cases that are declared as never occurring.