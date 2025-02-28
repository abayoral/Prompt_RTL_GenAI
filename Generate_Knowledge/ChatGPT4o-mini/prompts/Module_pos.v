
### Verilog Design Knowledge Base

#### 1. Fundamental Concepts
- **Modules**: The basic building block in Verilog, representing a hardware component. Each module can have inputs, outputs, and internal logic.
- **Ports**: Interfaces for module communication with the external environment or other modules, including inputs (`input`), outputs (`output`), and bidirectional (`inout`).
- **Nets and Registers**: Verilog has multiple data types, with `wire` commonly used for connections and `reg` for storage in procedural blocks.

#### 2. Hierarchical Design
- **Top-Level vs. Sub-Modules**: The top-level module is the main encapsulating module that integrates multiple sub-modules. Sub-modules perform specific tasks and are instantiated within the top-level module.
- **Port Mapping**: Connecting sub-module ports to the top-level module ports or internal signals. This can be done positionally or by name.

#### 3. Positional and Named Port Mapping
- **Positional Mapping**: Ports are connected in the order they are declared. This is simple but requires careful alignment.
- **Named Mapping**: Ports are connected by their names, making the connections clear and avoiding positional errors.

#### 4. Best Practices in Verilog Design
- **Clarity and Readability**: Use comments, meaningful names, and organized code blocks to improve understanding and maintenance.
- **Encapsulation**: Design modules with clear, self-contained functionality to promote reuse and reduce complexity.
- **Avoiding Race Conditions**: Ensure that synchronous and asynchronous logic are designed to avoid unintended behavior due to timing issues.

#### 5. Structural and Behavioral Modeling
- **Structural Modeling**: Describes how components are connected without detailing internal logic, resembling a netlist. Useful for integrating different modules.
- **Behavioral Modeling**: Describes the functionality of digital circuits using procedural constructs like `always` blocks, `if-else`, `case`, etc.

#### 6. Common Conventions

- **Parameterization**: Use parameters to create modules that can be configured with different widths or settings.
- **Constants and Defines**: Manage magic numbers or frequently used values with `parameter` or `define` directives.

#### 7. Handling Synthesis and Simulation
- **Synthesis**: The process of converting Verilog code into gate-level design. Focus on synthesizable constructs.
- **Testbenches**: Create testbenches for simulating and verifying module behavior before synthesis.

#### 8. Debugging and Verification
- **Assertion-Based Verification**: Use assertions to automatically check for certain conditions during simulation.
- **Waveforms and Simulations**: Utilize waveform viewers and simulation tools to analyze and verify signal interactions.

### Common Patterns in Verilog Design

#### Instantiating Modules
- Example Pattern: Instantiating a module by name or positionally.
  - **By Name**: `mod_a inst_name (.out1(), .out2(), .a(), .b(), .c(), .d());`
  - **By Position**: `mod_a inst_name (out1, out2, a, b, c, d);`

#### Defining and Using Parameters
- Parameters help in creating configurable and reusable modules.
  ```verilog
  module mod_b #(parameter WIDTH = 8) (input [WIDTH-1:0] in, output [WIDTH-1:0] out);
  ```

#### Synchronous and Asynchronous Logic
- Properly handle clocked logic and asynchronous resets.
  ```verilog
  always @(posedge clk or posedge rst) begin
    if (rst)
      // asynchronous reset
    else
      // clocked (synchronous) logic
  end
  ```

#### State Machines
- Used for control logic, following a defined state diagram.
  ```verilog
  always @(posedge clk or posedge rst) begin
    if (rst) 
      state <= IDLE;
    else 
      case (state)
        // State transitions
      endcase
  end
  ```

### Summary

This knowledge base covers the basic concepts, best practices, and common patterns necessary for effectively writing Verilog code. It emphasizes clarity, modularity, and proper connections between modules, providing a solid foundation for generating high-quality Verilog modules.

Task:
// You are given a module named mod_a that has 2 outputs and 4 inputs, in that order. 
// You must connect the 6 ports by position to your top-level module's ports 
// out1, out2, a, b, c, and d, in that order.

// You are given the following module:

module mod_a ( output, output, input, input, input, input );

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

// Insert your code here

endmodule