Imagine you are a senior digital design engineer working at a premier hardware design company. Your current challenge involves designing a critical Verilog module for a next-generation product—a design whose success is essential to upholding your company's reputation in the competitive computer hardware industry.

The task is to create an 8x1 memory circuit that functions as follows:

1. Memory Storage Through Shifting:
   • Build an 8-bit shift register composed of 8 D-type flip-flops.
   • Name the outputs of these flip-flops Q[0] through Q[7].
   • The register should accept a serial input labeled S. This S input is applied to the D input of the first flip-flop (Q[0]), ensuring that the most significant bit (MSB) is shifted in first.
   • Include an enable control signal that determines whether the shift operation should occur.

2. Memory Reading with Random Access:
   • Add three extra inputs—A, B, and C—that serve as a binary coded address.
   • Incorporate an output labeled Z.
   • Define the read operation such that the output Z reflects the value stored in the shift register at the address specified by A, B, and C. For example, when the binary address ABC is 000, then Z should equal Q[0]; when ABC is 001, Z should equal Q[1]; and so on through to ABC = 111 corresponding to Q[7].

3. Implementation Restrictions:
   • The design must only use the 8-bit shift register (constructed from D-type flip-flops) and multiplexers. No additional logic elements or storage devices are allowed.
   • This arrangement essentially forms a 3-input look-up table (LUT), where the multiplexers serve to select one of the eight stored bits based on the three-bit address.

You are to create a module named top_module with the following port signature:

    module top_module (
        input clk,
        input enable,
        input S,
        input A, B, C,
        output Z
    );

Within this module, you will implement the shift register and the selection logic to realize the described 8x1 memory behavior with its dual mode of operation for writing (via serial shifting) and reading (via random access through a multiplexer based on inputs A, B, and C).

Your objective is to thoroughly design and implement this circuit in Verilog, ensuring it meets all the specified requirements and constraints. No solution is provided here; your focus should be solely on understanding and clarifying the challenge before proceeding with your design.