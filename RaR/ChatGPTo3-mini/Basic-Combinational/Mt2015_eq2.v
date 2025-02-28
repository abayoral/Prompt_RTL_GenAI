Imagine you are a senior Digital Design Engineer at a prominent hardware design firm. Your task is to develop a vital piece of Verilog code for an upcoming generation product that plays a crucial role in preserving your company’s prestigious standing in the computer hardware industry.

In detail, your assignment is as follows: Design a digital circuit that accepts two 2-bit inputs, referred to as A and B (each specified as A[1:0] and B[1:0], respectively), and produces a single-bit output labeled z. The design specification requires that the output z must be driven high (logic 1) only when the two inputs A and B are exactly equal in value; conversely, if A and B are not equal, then the output z should be low (logic 0).

Using the provided Verilog module skeleton as a starting point, expand the module by implementing the necessary logic to fulfill these requirements. Your final design should ensure that the equality condition between A and B is evaluated correctly so that z accurately reflects whether the two input pairs are identical.

Below is the initial module framework:
-----------------------------------------------------------
module top_module (
    input  [1:0] A,
    input  [1:0] B,
    output       z
);
    // Insert your code here
endmodule
-----------------------------------------------------------

Your objective is to complete the Verilog module in such a way that it robustly meets the specification, keeping in assurance the integrity and performance of the overall design. Please note, you are expected to focus solely on clarifying and structuring the problem statement rather than providing a ready-made solution.