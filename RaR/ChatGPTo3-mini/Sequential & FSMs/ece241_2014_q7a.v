Imagine that you are a seasoned Digital Design Engineer at a top hardware company. Your next-generation product depends on the flawless operation of a critical Verilog module that you must design. In this task, you are required to create a counter that counts from 1 through 12, and it must integrate seamlessly with existing internal components to ensure proper operation.

The module must handle the following inputs and outputs:

• The module has a synchronous, active-high reset input. When asserted, the reset should force the counter to immediately output a value of 1, regardless of its previous state.

• There is an enable input. When the enable signal is high, the counter should operate (i.e., count on successive clock cycles); conversely, when it is low, the counter should hold its current state.

• A positive edge-triggered clock (clk) input is provided. Your design should correctly sample inputs and update the counter output on the rising edge of this clock signal.

• The 4-bit output Q[3:0] will represent the current value of the counter.

In addition to the primary counter output, your design must also generate three control signals:
 
• c_enable – a control output that drives the enable input of an internal 4-bit counter module.
  
• c_load – a control output for enabling synchronous parallel loading in the 4-bit counter module. Note that within the internal counter, the load signal has higher priority than the enable signal.
  
• c_d[3:0] – a 4-bit data control output that connects to the data inputs of the internal counter module.

To assist you in this design, you are provided with a 4-bit binary counter module (referred to as count4). This module features both an enable input and a synchronous parallel-load input. Your task is to instantiate this provided count4 module within your design in such a way that the internal signals (c_enable, c_load, and c_d[3:0]) can be used to verify correct functionality.

Your Verilog module should be defined as follows:

module top_module (
    input       clk,
    input       reset,
    input       enable,
    output [3:0] Q,
    output      c_enable,
    output      c_load,
    output [3:0] c_d
);

    // Insert your implementation here, ensuring that the provided count4 module is instantiated properly.
    count4 the_counter (clk, c_enable, c_load, c_d /* additional parameters as needed */ );

endmodule

Your challenge is to design a reliable and accurate module that meets these specifications by carefully integrating the provided count4 module and any necessary logic gates. Ensure that your implementation correctly handles the reset behavior, counting logic (from 1 to 12), and the generation of the internal control signals for verification purposes.