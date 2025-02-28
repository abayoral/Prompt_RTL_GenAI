The question you provided involves creating a frequency divider circuit that takes a 1000 Hz input clock signal and derives a 1 Hz output signal named OneHertz. This OneHertz signal will then be used to drive an Enable signal for a set of hour, minute, and second counters in a digital wall clock. To achieve this, the OneHertz signal must be asserted for exactly one clock cycle each second. 

To implement this frequency divider, you are required to use modulo-10 (BCD) counters and minimize the use of additional gates. Additionally, for each BCD counter used in your design, you need to provide an output named c_enable which indicates the enable state for that particular counter. Specifically, `c_enable[0]` should correspond to the fastest counter, and `c_enable[2]` should correspond to the slowest counter among those you will use.

The BCD counter module is provided for you, with the following specifications:
- It takes an input clock (clk), a synchronous reset signal (reset), and an enable signal (enable).
- It outputs a 4-bit value `Q` representing the current count.
- The enable signal must be high for the counter to run.
- When reset is asserted (set high), the counter is synchronously reset to zero.

Your task is to implement the top-level module named `top_module` which:
1. Instantiates the provided BCD counters.
2. Configures them to collectively perform the frequency division to generate the 1 Hz OneHertz signal.
3. Outputs the enable signals for each of the BCD counters used (`c_enable[0]` for the first counter, `c_enable[1]` for the second, etc.).

Here is a template of the provided BCD counter module, and a partially completed top-level module:

```verilog
module bcdcount (
	input clk,
	input reset,
	input enable,
	output reg [3:0] Q
);

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

	// Insert your code below
	
    bcdcount counter0 (clk, reset, c_enable[0]/*, ... */);
    bcdcount counter1 (clk, reset, c_enable[1]/*, ... */);

endmodule
```

You need to complete the `top_module` by:
1. Instantiating the necessary BCD counters.
2. Configuring them to achieve the correct frequency division.
3. Generating and outputting the OneHertz signal.
4. Providing the enable signals for the BCD counters via the `c_enable` array. 

Ensure that each counter operates directly from the supplied 1000 Hz clock, and that the reset signal can correctly initialize the system.