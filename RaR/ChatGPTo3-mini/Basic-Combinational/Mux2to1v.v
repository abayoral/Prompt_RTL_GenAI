Imagine you are a seasoned Digital Design Engineer working at a top-tier hardware design company. Your latest assignment is to develop a vital Verilog module that will play a key role in the advancement of a next-generation product. The successful implementation of this module is critical, as it directly impacts your company’s reputation for producing industry-leading computer hardware.

Your task is to design a multiplexer with the following specifications:

• The multiplexer must handle 100-bit wide data inputs.
• It is a 2-to-1 multiplexer, meaning there are two data inputs.
• The two 100-bit inputs are labeled as 'a' and 'b'.
• There is a single control signal 'sel' which dictates the output:
  – When sel = 0, the multiplexer should select input 'a' as the output.
  – When sel = 1, it should select input 'b' as the output.

A hint is provided to use the ternary operator (cond ? if_true : if_false) in your Verilog code, as it often makes the logic more straightforward to comprehend.

The Verilog module structure is already outlined as follows:

-----------------------------------------------------------
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

// Insert your code here

endmodule
-----------------------------------------------------------

Your objective is to complete this module by inserting the appropriate Verilog code inside the module that satisfies the following:
  • Implements a 2-to-1 multiplexer with a 100-bit data width.
  • Uses the provided 'sel' control signal to choose between inputs 'a' and 'b', ensuring that when sel=0, the module outputs 'a', and when sel=1, the module outputs 'b'.

This is a crucial piece of work where attention to detail is necessary to ensure proper functionality in the overall design of the next-generation product. Please rework and enhance your implementation based on these requirements.