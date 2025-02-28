Consider the following design challenge:

Imagine you are a seasoned Digital Design Engineer at a top-tier hardware company, and you have been tasked with developing an essential Verilog module for an upcoming product. The performance of this module is critical, as it will significantly impact your company’s standing in the competitive computer hardware market.

You have been provided with a basic one-digit BCD (Binary-Coded Decimal) adder module named bcd_fadd. This module takes two 4-bit inputs (representing BCD digits) and an input carry, then computes a 4-bit BCD sum and an output carry. The module's interface is as follows:

• a (4 bits): First BCD digit  
• b (4 bits): Second BCD digit  
• cin: Carry-in bit  
• sum (4 bits): The resulting BCD digit after the addition  
• cout: Carry-out bit

Your challenge is to extend this functionality by creating a 100-digit BCD ripple-carry adder. Specifically, you are required to implement a new Verilog module named top_module that adheres to the following criteria:

1. The module will handle two 100-digit BCD numbers. Since each BCD digit is 4 bits wide, these numbers are represented as 400-bit vectors (inputs a and b).
2. It must also accommodate an input carry (cin) and produce a final carry-out (cout).
3. The resulting sum should be output as a 100-digit BCD number, packed into a 400-bit vector.
4. Internally, you should instantiate 100 copies of the bcd_fadd module. Each instance handles the addition of the corresponding digits from the two 100-digit inputs, as well as propagating the appropriate carry between stages to form a complete ripple-carry adder.
5. It is recommended to use either an instance array or a generate statement to facilitate the replication of the bcd_fadd modules in an efficient and readable manner.

Your task is to design the top_module that effectively connects these 100 instances so that the overall circuit adds two 100-digit BCD numbers along with an input carry, yielding the proper 100-digit sum and final carry-out.

Clarify any assumptions, manage the interconnections, and ensure the carry propagation is correctly implemented, keeping in mind that the ripple-carry approach results in sequential carry propagation from the least significant digit to the most significant digit.

Your answer should include the complete Verilog description of the top_module with the proper instantiation of the bcd_fadd modules, but refrain from providing any simulation or synthesis results, as the focus is solely on the module’s correct design and interconnection.