
### Verilog Design Knowledgebase

#### Background Concepts

1. **Hardware Description Language (HDL)**: Verilog is a Hardware Description Language used to model electronic systems.
2. **Digital Logic**: Understanding of basic digital logic, including flip-flops, gates, and counters.
3. **Finite State Machines (FSMs)**: Conceptual framework for designing sequential logic involving states and transitions.
4. **Clocking and Timing**: Knowledge of how clocks work in digital circuits, including rising and falling edges, clock cycles, and timing constraints.
5. **Bit-width**: Understanding of how data is represented in different bit-widths, e.g., 4-bit, 8-bit, etc.

#### Core Principles in Verilog Design

1. **Modules**: Fundamental building blocks in Verilog. Each module can encapsulate functionality defined by input and output ports.
2. **Always Blocks**: Used for defining behavior in a sequential (clock-sensitive) or combinational (input-sensitive) manner.
3. **Non-blocking vs. Blocking Assignments**:
   - Non-blocking (`<=`): Used in sequential logic.
   - Blocking (`=`): Used in combinational logic.
4. **Reset Logic**:
   - Synchronous reset: Reset occurs in sync with the clock edge.
   - Asynchronous reset: Reset occurs independently of the clock.
5. **Registers and Wires**:
   - `reg`: Used to store values in sequential logic.
   - `wire`: Used to connect different parts of a design in combinational logic.

#### Best Practices

1. **Clarity and Readability**: Write clear, well-commented code for maintainability.
2. **Simulation and Testing**: Use testbenches to verify the functionality of your Verilog modules.
3. **Modularity**: Design reusable and hierarchical modules to simplify complex designs.
4. **Use of Parameters**: Use `parameter` statements for configurable values, making designs more flexible.
5. **Avoiding Latches**: Always specify all possible states to avoid unintended latch inference.
6. **Proper Synchronization**: Ensure all asynchronous inputs are synchronized to the clock domain of the design.
7. **Avoiding Glitches**: Handle combinational loops carefully to avoid glitches.
8. **Complying with Timing Constraints**: Ensure that design meets setup and hold times to avoid timing violations.

#### Common Design Patterns

1. **Synchronous Counters**:
   - Using `always @(posedge clk)` block for counter logic.
   - Implementing clear or reset functionality to restart the counter.
2. **State Machines**:
   - Encoding states efficiently.
   - Using `case` statements to handle state transitions.
3. **Shift Registers**:
   - Sequentially shifting data in registers, often used for serialization and deserialization.
4. **Multiplexers (Muxes)**:
   - Selecting between multiple input signals based on control signals.
5. **Decoders and Encoders**:
   - Translating between different coding schemes, such as binary to one-hot.

#### Timing and Clocking

1. **Clock Domains**: Different parts of the design might operate on different clocks; carefully handle domain crossings.
2. **Metastability**: Ensure that asynchronous inputs are properly synchronized to avoid metastable states.

#### Debugging Tips

1. **Waveform Analysis**: Use simulation tools to analyze waveforms and verify correct behavior.
2. **Assertions**: Use assertions in testbenches to check for conditions that must hold true.

#### Documentation and Commenting

1. **Header Comments**: Provide a high-level overview of the module functionality.
2. **Inline Comments**: Explain logic and important decisions within the code.
3. **Signal Naming**: Use meaningful names for signals and variables to enhance readability.

With this comprehensive knowledge base, another language model can effectively generate accurate and high-quality Verilog modules, adhering to best practices and common design principles.

Task:
// Build a 4-bit binary counter that counts from 0 through 15, inclusive, with a period of 16. The reset input is synchronous, and should reset the counter to 0.

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    // Insert your code here

endmodule
