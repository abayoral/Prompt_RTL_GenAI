Imagine you are a senior digital design engineer working on a crucial Verilog module for a next-generation hardware product. The reliable operation of this module is essential for upholding your company's esteemed reputation in the computer hardware industry.

Your task is to design a thermostat module that controls a heating system, an air conditioning unit, and a blower fan. The thermostat operates in one of two modes—heating or cooling—depending on the environmental conditions and user input. Here are the requirements broken down in detail:

• The thermostat works in two modes: heating (mode = 1) and cooling (mode = 0).

• In heating mode:
  – If the signal too_cold equals 1 (indicating the temperature is below the desired threshold), the module should activate the heater.
  – In this mode, the air conditioner must remain turned off.
  – When the heater is on, the fan should also be activated to circulate the warm air.

• In cooling mode:
  – If the signal too_hot equals 1 (indicating the temperature exceeds the desired level), the module should activate the air conditioner.
  – In this mode, the heater must remain turned off.
  – Similarly, if the air conditioner is on, the fan should be turned on to circulate the cool air.

• Independently of the temperature or mode, there is an option for the user to force the fan to turn on by setting the fan_on input signal to 1. This means that even when neither the heater nor the air conditioner is active, the fan should run when requested by the user.

The design challenge specifies that you implement this functionality using only assign statements, essentially mapping the problem description directly into combinational logic. You might find it helpful to approach the design by starting with the required outputs and reasoning backwards to determine the necessary input conditions.

Here is the module declaration that you need to complete:

---------------------------------------------------------
module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 

    // Your Verilog code implementation using assign statements goes here.

endmodule
---------------------------------------------------------

Your expanded assignment involves translating these operational requirements directly into a set of combinational logic expressions in Verilog, ensuring that every possible condition (mode, temperature conditions, and manual fan control) is properly addressed. Remember, no coding shortcuts—your solution should only use assign statements to model the logic, which mimics a circuit's collection of logic gates.