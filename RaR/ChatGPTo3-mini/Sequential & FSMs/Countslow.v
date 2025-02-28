Imagine you're a lead digital design engineer at a foremost hardware design company. Your current assignment is to create a Verilog module for a next-generation product—a project so critical that its success will directly impact your company's reputation in the highly competitive computer hardware industry.

The design challenge is to implement a decade counter. This counter should cycle through the digits 0 to 9 in a repeating sequence with a total period of 10 counts. Key aspects of the design include:

• A synchronous reset signal that immediately resets the counter back to 0 in sync with the clock edge when activated.  
• An enable control input (named slowena) that allows you to pause the counting process. In other words, the counter should only increment its value on each clock cycle when this enable signal is active, ensuring it does not count continuously without control.

Your Verilog module, named top_module, is expected to integrate these specific inputs: a clock (clk), an enable control (slowena), and the synchronous reset (reset). The output q should be a 4-bit wide signal representing the current count value.

Your task is to detail, design, and structure this module so that it operates precisely under these conditions, meeting all the stated functional requirements without any deviation. Please focus on clarity and adherence to the specified behavior, ensuring that the counter can both pause and resume counting as required and always reset deterministically.