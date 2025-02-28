
### Verilog Design Knowledge Base

#### Overview of Verilog
- **Verilog** is a hardware description language (HDL) used to model electronic systems.
- It allows for both structural and behavioral descriptions of digital logic circuits.
- Common Verilog constructs include modules, always blocks, assign statements, and initial blocks.

#### Basic Components
- **Modules** represent the fundamental building blocks in Verilog.
- **Ports**: Modules have input, output, and inout ports that facilitate communication with other modules.
- **Data Types**: Commonly used data types include `wire`, `reg`, `integer`, and `parameter`.

#### Verilog Syntax
- **Module Definition**: `module <module_name>` followed by port declarations and the `endmodule` keyword.
- **Comments**: Single-line comments are marked with `//`, and multi-line comments are enclosed in `/* ... */`.

#### Combinational Logic
- Use **`assign` statements** for continuous assignments to `wire` types.
- Use **`always @(*)` blocks** for describing combinational logic using procedural assignments to `reg` types.

#### Sequential Logic
- Implemented using **`always @(posedge clk)`** blocks for edge-triggered behavior (e.g., flip-flops).
- **`initial` blocks** are used for initializing variables and are executed only once at the beginning of simulation.

#### Control Structures
- **`if-else` statements**: Used within `always` blocks for conditional logic.
- **`case` statements**: Useful for designing multiplexers and other selection logic.
- **Loops**: Supported constructs include `for`, `while`, and `repeat`.

#### Common Verilog Constructs
- **Mux (Multiplexer)**: Selects one of several inputs based on control signals.
- **Flip-Flops**: Used for storing state information and commonly employ edge-triggered behavior.
- **Finite State Machines (FSMs)**: Designed using `case` statements within `always` blocks.

#### Best Practices
1. **Clear Hierarchy**: Structure the design in a clear hierarchical manner using modules.
2. **Modular Design**: Break down complex systems into smaller, manageable modules.
3. **Descriptive Naming**: Use descriptive names for modules, signals, and variables.
4. **Commenting**: Write clear comments explaining the purpose and functionality of the code.
5. **Consistency**: Follow consistent coding conventions for readability and maintainability.
6. **Avoid Race Conditions**: Ensure that signals are properly synchronized and avoid clock domain crossing issues.

#### Combinational vs. Sequential Logic
- **Combinational Logic**: Output depends only on current inputs.
  - Example: Mux, decoders, arithmetic operations.
- **Sequential Logic**: Output depends on both current inputs and previous states.
  - Example: Counters, shift registers, state machines.

#### Verilog Coding Styles
- **RTL (Register Transfer Level)**: Describes how data moves between registers and the logic required to execute those transfers.
- **Behavioral**: Describes what the system should do in terms of algorithmic behavior.
- **Structural**: Describes how the components are interconnected.

#### Verilog Statements
- **`assign` Statement**: Continuous assignment used primarily for combinational logic.
- **`always @(*)` Block**: Used for combinational logic, sensitive to any change in the listed signals.
  - Example: `always @(*) begin ... end`
- **`always @(posedge clk)` Block**: Used for sequential logic sensitive to clock edges.
- **Procedural Statements**: Include `if`, `case`, `for`, `while`.
  - Example: `if (condition) begin ... end else begin ... end`

#### Debugging Tips
- **Simulation**: Use testbenches to simulate and verify the functional correctness.
- **Waveform Analysis**: Use waveform viewers to inspect signal transitions.
- **Assertions**: Utilize assertions to check for design invariants and constraints.

By keeping these principles and practices in mind, you can enhance your Verilog designs essentially, leading to more reliable, maintainable, and reusable code. This knowledge base provides a foundation for tackling various design tasks in Verilog, from simple combinational circuits to complex sequential systems.

Task:
// Build a 2-to-1 mux that chooses between a and b. 
// Choose b if both sel_b1 and sel_b2 are true. Otherwise, choose a. 
// Do the same twice, once using assign statements and once using a procedural if statement.

// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 

    // Insert your code here
    
endmodule
