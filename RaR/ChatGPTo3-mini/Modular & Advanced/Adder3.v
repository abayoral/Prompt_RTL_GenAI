Imagine you're a seasoned Digital Design Engineer working at a top-tier hardware design company. Your current assignment involves creating a vital Verilog module that forms the cornerstone of a next-generation product. The reliability and performance of your design are crucial, as they directly impact the reputation of your computer hardware company in the competitive industry.

Your task is to design a 3-bit binary ripple-carry adder by instantiating three individual full-adder modules. In this configuration:

• You will add two 3-bit binary numbers along with an additional carry-in.
• The adder should produce a 3-bit result for the sum.
• In addition to the main sum, you are required to output the carry-out from each of the three full-adder instances. Note that the third full-adder’s carry-out (designated as cout[2]) represents the final carry-out, which is typically the one observed in practical applications.

The module interface is provided below as your starting point:

---------------------------------------------------------
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    // Insert your code here

endmodule
---------------------------------------------------------

Your goal is to write the Verilog code that effectively instantiates and connects three full-adder modules to implement this 3-bit ripple-carry adder. Please note: this task emphasizes the importance of instantiating individual full-adder components rather than creating a monolithic design. Ensure that each full-adder's carry output is captured and made available through the corresponding pin of the output vector. 

Take into account the proper handling of the intermediate carry signals between full-adder instances, and carefully map the module's inputs and outputs to orchestrate the desired addition operation correctly. 

Remember, you should focus on clarifying your design by explicitly instantiating full-adders and managing the ripple of the carry bits appropriately across the three stages.