Imagine you are a seasoned Digital Design Engineer at a top-tier hardware design firm, and you are responsible for developing a crucial Verilog module for a highly anticipated next-generation product. The performance and accuracy of this module are essential for upholding your company's esteemed reputation in the computer hardware industry.

Your task is as follows: design a Verilog circuit that accepts a single 3-bit input vector. The module should have two main functionalities. First, it must provide a 3-bit output that is exactly the same as the input vector. Second, the module should produce three separate 1-bit outputs, each representing one individual bit of the 3-bit input. Specifically, assign each bit of the input vector to its corresponding 1-bit output—bit 0 of the vector should be routed to output o0, bit 1 to output o1, and bit 2 to output o2.

The module template is already defined as shown below, and you are to insert your implementation in the indicated area. The module declaration is as follows:

module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0
);

// Your implementation should begin here

endmodule

Your objective is to ensure that the module accurately replicates the input vector on the multi-bit output and correctly decomposes the 3-bit input into three individual 1-bit outputs with the specified bit-to-output assignments. No solution is needed at this stage—just ensure the question is clearly understood and the requirements are fully elaborated.