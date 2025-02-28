As the senior Digital Design Engineer at a leading hardware design company, you are tasked with developing a critical Verilog hardware module specifically for a state-of-the-art product that will significantly impact your company's standing in the competitive computer hardware industry. The design focus is on a thermostat system that can expertly manage both heating and cooling operations based on environmental conditions and user preferences. The module's functionality is indispensable, as it directly affects the performance and efficiency of the product, making its precision and reliability paramount.

The thermostat system you are to design will control a heater and an air conditioner in response to temperature conditions and manual user input, ensuring optimal operation throughout changing seasons. It will encompass a dual-mode operation, where the system can be set to either heating mode (designated as mode = 1) or cooling mode (mode = 0).

The design requirements are as follows:

1. **Heating Mode (mode = 1):** In this configuration, the responsibility of the system is to activate the heater when the temperature is detected as too cold (too_cold = 1). During heating mode, the air conditioner must remain inactive.

2. **Cooling Mode (mode = 0):** In this scenario, the system should engage the air conditioner when the temperature is perceived as too hot (too_hot = 1). Conversely, the heater must remain off while in cooling mode.

3. **Fan Operation:** Regardless of whether the system is heating or cooling, the blower fan must turn on in conjunction with either the heater or air conditioner to facilitate air circulation. Additionally, there should be a fan control feature that allows the user to manually activate the fan (fan_on = 1), even in the absence of heater or air conditioner activity.

Your task is to implement this mechanism using Verilog, strictly constrained to utilizing only `assign` statements. This will translate the functional requirements into a network of logic gates, mapping each condition to its corresponding hardware representation. Moreover, consider employing a design approach that might require working backward from the desired outputs—heater, air conditioner, and fan activation statuses—to determine the appropriate input dependencies.

The deliverable is a Verilog module that properly manages these functionalities with precise logic, defined as follows:

```verilog
module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    //Insert your code here
endmodule
```

This challenge invites you to leverage your expertise in digital logic design to translate these thermal and control requirements into a fully functional Verilog description, ensuring both compliance with specifications and an understanding of practical circuit design principles.