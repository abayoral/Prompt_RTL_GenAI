Imagine you are a senior Digital Design Engineer at a prestigious hardware design company. Your responsibility is to create a critical Verilog module that will play a central role in a next-generation product. This module's flawless performance is vital to maintaining your company's strong reputation within the computer hardware industry.

In this design exercise, you are asked to implement a D flip-flop. It is important to note that this particular implementation will behave as a latch, and consequently, the Quartus synthesis tool is expected to generate a warning indicating that a latch has been inferred.

Below is the provided module framework that you should complete by inserting your Verilog code:

-----------------------------------------------------------
module top_module (
    input d, 
    input ena,
    output q
);

// Insert your code here

endmodule
-----------------------------------------------------------

Your task is to furnish the appropriate code within the module so that the design meets the specifications. Remember that the anticipated Quartus warning about latch inference is acceptable for this exercise. Ensure that the final implementation aligns with the requirements for a D flip-flop acting as a latch.