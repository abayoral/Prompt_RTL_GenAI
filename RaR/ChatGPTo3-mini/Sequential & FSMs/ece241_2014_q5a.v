Imagine you are a senior Digital Design Engineer at a premier hardware design company, and you have been given the responsibility of developing a critical Verilog module for an upcoming next-generation product. The success of this module is crucial not only for the product itself but also for upholding your company's esteemed reputation in the computer hardware industry.

Your task is to design a serial 2's complement generator that operates as a Moore state machine. The specifics of the design problem are as follows:

• The module must have one serial input (x) and one serial output (z).  
• The input x is a stream of bits that are fed to the module one per clock cycle, starting with the least significant bit of the number.  
• The output z should produce the 2's complement of the input number corresponding to the serial input received, bit by bit.  
• The design should accommodate numbers of arbitrary length, meaning there is no fixed bit-width limitation on the input data; it has to correctly process sequences regardless of their length.  
• An asynchronous reset signal (areset) is included. The circuit should commence the conversion process from x to its 2’s complement when the reset is released, and it should cease operation when the reset is asserted.

The provided Verilog module interface is as follows:

--------------------------------------------------
module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    // Insert your code here

endmodule
--------------------------------------------------

Your objective is to develop the necessary Verilog code that implements the above functionality using a Moore state machine. When designing your solution, ensure that the state transitions and output behavior conform strictly to the requirements of a Moore machine. Remember, the asynchronous reset must be managed properly so that it initiates or terminates the 2's complement conversion process as described.

Do not provide any code solutions at this stage; focus on fully understanding and elaborating on the problem description and its requirements.