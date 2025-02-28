Imagine you are a seasoned Digital Design Engineer at a prominent hardware design company, and you're tasked with creating a critical Verilog module that will be a key part of your company's next-generation product. The reliability of this module is crucial for upholding the company’s reputation in the competitive computer hardware industry.

The module you need to develop accepts a four-bit input vector, labeled as in[3:0]. Your assignment is to derive three distinct output vectors, each representing specific relationships between each bit in the input vector and its neighboring bit as described below:

1. Output Vector: out_both  
   - This vector represents whether a given input bit and its adjacent left neighbor (i.e., the bit with the next higher index) are both set to ‘1’.  
   - For instance, out_both[2] should be high (1) if and only if both in[2] and in[3] are ‘1’.  
   - Note that in[3] does not have any neighbor to its left, so the corresponding output bit for that position isn’t required.

2. Output Vector: out_any  
   - This vector indicates if at least one between a given input bit and its neighbor to the right (i.e., the bit with the next lower index) is ‘1’.  
   - As an example, out_any[2] should be high if either in[2] or in[1] has a ‘1’.  
   - Since in[0] lacks a neighbor on its right, the corresponding output for that bit does not need to be defined.

3. Output Vector: out_different  
   - This vector is meant to signal whether each input bit differs from its neighbor to the left.  
   - For example, out_different[2] would indicate if in[2] is different from in[3].  
   - Here, the comparison is performed with a wrap-around: the left neighbor of in[3] is instead taken as in[0].

Hint: The implementation is expected to use simple two-input logic operations—specifically, an AND operation for out_both, an OR operation for out_any, and an XOR operation for out_different. The solution can effectively be realized using just three assign statements by appropriately leveraging vector operations.

Your task is to design this Verilog module within the skeleton provided below. Remember, the implementation should solely consist of the Verilog code needed to meet the functionality described for each output vector. No solution code should be provided in this explanation.

module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different 
);
    // Insert your code here
endmodule

In summary, your challenge is to create a Verilog module that accurately computes the relationships between bits of a given four-bit input and their defined neighbors using basic two-input logic gates, as outlined above.