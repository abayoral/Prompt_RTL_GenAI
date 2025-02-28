Imagine you are tasked with designing a critical Verilog module for a next-generation product at a top-tier hardware design company. The project requires you to create a 3-bit binary ripple-carry adder by instantiating three full-adder modules. The adder must handle two 3-bit binary numbers along with an initial carry-in, and it should generate both a 3-bit sum output and a 3-bit carry output. 

Specifically, you need to:

• Create a module (e.g., named "top_module") with two 3-bit inputs (labeled "a" and "b") and one single-bit carry-in ("cin").

• Instantiate three full-adder components within your module. Each full-adder is to be connected in a ripple-carry configuration, which means that the carry-out from one adder must be fed as the carry-in to the subsequent adder.

• Provide outputs for both the sum and the carry-out signals. The sum is a 3-bit output that represents the result of the binary addition, while the carry output must also be a 3-bit signal where each bit (cout[0] to cout[2]) corresponds to the carry generated from each stage of the addition process. Bear in mind that cout[2] represents the final carry-out usually seen at the output of a ripple-carry adder.

Your objective is to ensure that the design clearly instantiates the full-adders and routes the carry signals appropriately so that each stage's carry-out is accessible and correctly cascaded to form the overall 3-bit ripple-carry adder.

Please note: the focus here is solely on clarifying and elaborating the question requirements. You should not provide any code or solutions, but only ensure that the problem statement is well-documented and unambiguous.