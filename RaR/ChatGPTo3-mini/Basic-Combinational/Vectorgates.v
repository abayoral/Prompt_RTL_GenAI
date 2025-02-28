Imagine you are a seasoned Digital Design Engineer working at a prominent hardware design firm. Your latest assignment involves creating a Verilog module that is critical for a next-generation product. The module you develop will play a crucial role in upholding your company's reputation for innovation and quality within the competitive computer hardware industry.

Your task is to design a circuit that meets the following specifications:

1. The module has two 3-bit input vectors: one labeled 'a' and the other labeled 'b'.
2. The circuit must compute:
   • The bitwise OR of the two input vectors, resulting in a 3-bit output.
   • The logical OR of the two input vectors, resulting in a single-bit output.
   • The bitwise inversion (logical NOT) of each input vector individually.
3. The inverted outputs must then be combined into a single 6-bit output vector named 'out_not.' Specifically:
   • The upper half of 'out_not' (bits 5 down to 3) should be assigned the inversion of input vector 'b.'
   • The lower half of 'out_not' (bits 2 down to 0) should contain the inversion of input vector 'a.'

A useful hint: Although Verilog does not allow multiple assignments to the same wire, you are permitted to use part selects on the left-hand side of an assignment. This means you can separately assign different sections of the 'out_not' vector in multiple statements rather than completing the assignment in a single declaration.

The module declaration is provided as follows:

----------------------------------------------------------
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    // Insert your code here
endmodule
----------------------------------------------------------

Your goal is to implement the module according to these guidelines without providing multiple assignments to a single wire in a way that violates Verilog's rules. Focus on correctly handling the bitwise and logical operations as specified, and remember to carefully organize the outputs in the proper bit positions.

This is the complete specification of the problem. Please craft your implementation accordingly.