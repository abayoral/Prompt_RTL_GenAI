Please create a top-level Verilog module named `top_module` that serves as a 4-bit shift register. This design will be built using four instances of a subcircuit named `MUXDFF`. Here are the detailed requirements for your implementation:

1. **Module Declaration:**
   - Name the top-level module `top_module`.
   - Your module should have the following port declarations:
     - Inputs:
       - A 4-bit wide input `SW` which represents the switches.
       - A 4-bit wide input `KEY` which contains four different control signals:
         - `KEY[0]` is the clock signal (`clk`).
         - `KEY[1]` is the enable signal (`E`).
         - `KEY[2]` is the load signal (`L`).
         - `KEY[3]` is the write input signal (`w`).
     - Outputs:
       - A 4-bit wide output `LEDR` which represents the red LEDs.

2. **Subcircuit Instantiation:**
   - Instantiate four instances of your `MUXDFF` subcircuit within the top-level module. Each instance will handle one bit of the 4-bit shift register.

3. **Connection Details:**
   - Connect the `R` input of each `MUXDFF` instance to the individual bits of the `SW` switches.
   - The clock signal (`clk`) should be connected to `KEY[0]`.
   - The enable signal (`E`) should be connected to `KEY[1]`.
   - The load signal (`L`) should be connected to `KEY[2]`.
   - The write input signal (`w`) should be connected to `KEY[3]`.
   - The output of each `MUXDFF` instance should be connected to the respective bits of the `LEDR` output array.

Below is a template to guide your implementation. You should define your `MUXDFF` subcircuit according to the requirements it needs to fulfill. Insert the necessary code into the provided template:

```verilog
module top_module (
    input [3:0] SW,      // Switches
    input [3:0] KEY,     // Control signals
    output [3:0] LEDR    // LED outputs
);

    // Code to instantiate MUXDFF subcircuits goes here

endmodule

// Define the MUXDFF subcircuit below

module MUXDFF (...);
    // Implementation of MUXDFF subcircuit goes here
endmodule
```

Please ensure that each connection and functionality in your `top_module` and `MUXDFF` subcircuit is appropriately handled according to the described specifications.