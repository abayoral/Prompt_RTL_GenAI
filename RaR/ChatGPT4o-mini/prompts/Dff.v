Can you provide a detailed implementation of a D flip-flop in Verilog within a module named `top_module`? Here are the specific requirements and additional context for the task:

- **Inputs and Outputs:**
  - The module should have three ports: 
    - `input clk`: This will serve as the clock signal, which is typically used in sequential circuits to synchronize changes in the state of the flip-flop.
    - `input d`: This is the data input signal that the flip-flop should latch onto.
    - `output reg q`: This output signal should reflect the stored state of the flip-flop.

- **Behavioral Description:**
  - The `q` output should be updated to match the value of the `d` input at every rising edge (positive edge) of the `clk` signal.
  - To model the behavior of the D flip-flop accurately, you need to incorporate a clocked always block in your Verilog code.
  - Within this clocked always block, use a non-blocking assignment to ensure the correct sequential behavior and proper simulation practice.

Please provide a complete example incorporating these elements within the structural and behavioral framework described.