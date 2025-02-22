As a senior Digital Design Engineer at a leading hardware design company, you have been entrusted with the critical task of developing a Verilog module for a new and cutting-edge product. The successful completion and implementation of this module are crucial for sustaining your company's esteemed reputation in the competitive computer hardware industry. Specifically, you are required to design a counter that can cycle through numbers 1 to 12. 

This counter must be responsive to the following inputs:

1. **Reset**: This is a synchronous active-high reset signal that, when activated, should immediately force the counter to a starting value of 1. The nature of its synchronous behavior implies that it operates in alignment with the clock signal.

2. **Enable**: This signal controls whether the counter operates. When this signal is high, the counter should be permitted to count; if it is low, the counter should not increment.

3. **Clk (Clock)**: The counter is driven by a positive edge-triggered clock input. This means that the counting process is synchronized with the rising edge of the clock signal.

The outputs of your counter should be as follows:

1. **Q[3:0]**: A 4-bit output representing the current count of the counter. As it cycles from 1 to 12, the output should appropriately reflect these values in binary form.

Additionally, you need to manage and verify control signals fed into a provided 4-bit binary counter (referred to as `count4`). This counter includes both Enable and synchronous parallel-load inputs, with the load input having priority over enable. Your task is to instantiate this `count4` module within your circuit. You have access to:

1. **c_enable**: This is the internal signal that corresponds to the enable input of the `count4` module. You need to control this signal to manage when the internal counter is active.

2. **c_load**: This is the load control signal for the `count4`. Since the load input has a higher priority, it’s crucial to determine the appropriate times for it to be active.

3. **c_d[3:0]**: This 4-bit signal represents the data to be loaded when the load operation is enabled, it sets the count4 to a specified number.

You have at your disposal basic digital logic gates to assist in the logic development of the module. The task involves not only ensuring that the counter accurately counts from 1 to 12 but also confirming that the internal `c_enable`, `c_load`, and `c_d` outputs mirror the correct control signals to the `count4` module for proper operation verification. How will you implement this in Verilog, while ensuring these control signals are correctly handled and verified?