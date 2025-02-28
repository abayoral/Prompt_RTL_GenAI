As a Senior Digital Logic Design Engineer at a premier hardware design company, you have been assigned a task critical to the next-generation product. The objective is to design a combinational logic circuit in Verilog that accurately implements a three-input, one-output function based on the provided truth table. The successful realization of this module is essential for upholding our company’s reputation in the competitive computer hardware market.

The function is defined over three binary inputs (designated as x3, x2, and x1), which collectively generate eight possible combinations. For each combination, there is a predetermined output value (f). The truth table is outlined as follows, showing that four input combinations yield an output of 1 and the other four yield 0:

 • Row 0: x3 = 0, x2 = 0, x1 = 0 → f = 0  
 • Row 1: x3 = 0, x2 = 0, x1 = 1 → f = 0  
 • Row 2: x3 = 0, x2 = 1, x1 = 0 → f = 1  
 • Row 3: x3 = 0, x2 = 1, x1 = 1 → f = 1  
 • Row 4: x3 = 1, x2 = 0, x1 = 0 → f = 0  
 • Row 5: x3 = 1, x2 = 0, x1 = 1 → f = 1  
 • Row 6: x3 = 1, x2 = 1, x1 = 0 → f = 0  
 • Row 7: x3 = 1, x2 = 1, x1 = 1 → f = 1  

A recommended approach for implementing such a truth table is to express the Boolean function in a sum-of-products (canonical) form. This entails identifying all rows where the output is 1 and forming product (AND) terms for each (by matching each input bit to its respective logic level). These product terms are then combined using a sum (OR) operation to yield the final output.

For instance, the function outputs a '1' when the input combination corresponds to Row 2, Row 3, Row 5, or Row 7. In hardware terms, this means you would implement four 3-input AND gates (each to recognize one of these specific combinations) whose outputs are summed (i.e., ORed) together to produce the final output (f).

Your task is to create the appropriate Verilog module, including the necessary logic gates, to realize this function as per the described truth table. The module starts with the following interface declaration:

  module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
  );

  // Insert your code here

  endmodule

Please develop the Verilog code that implements the combinational logic based on the considerations described above. No actual solutions or code examples should be included in your answer—only ensure that the question and requirements are clearly understood and detailed.