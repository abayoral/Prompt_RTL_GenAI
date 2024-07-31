
## Verilog Design Knowledge Base for Enhancing Performance in Generating Verilog Modules

### Background Knowledge
1. **Verilog HDL Overview**
   - **Verilog** is a Hardware Description Language used to model electronic systems.
   - It allows for describing the structure and behavior of electronic circuits at various levels of abstraction.

2. **Basic Language Elements**
   - **Modules**: The basic building blocks. Defined by the `module` keyword and include input, output, and often inout ports.
   - **Nets and Variables**: Variables like `reg` and nets like `wire` for modeling connections.
   - **Continuous Assignments**: Used for simple combinational logic using the `assign` keyword.
   - **Procedural Blocks**: `always` and `initial` blocks for describing more complex behavior.

3. **Combinational vs. Sequential Logic**
   - **Combinational Logic**: Output depends solely on present inputs. No memory effects.
   - **Sequential Logic**: Circuits with memory where output depends on current inputs and previous states.

### Principles

#### General Principles

1. **Modularity**: Divide large systems into smaller, manageable sub-modules.
2. **Hierarchical Design**: Design circuits in a hierarchical manner where high-level modules instantiate lower-level ones.
3. **Parameterization**: Use parameters to make modules more flexible and reusable.
4. **Code Reuse**: Write reusable code, ideally use libraries where appropriate.

#### Verilog-Specific Principles

1. **Synchronous Design Principles**:
   - Favor synchronous over asynchronous designs for better predictability and reliability.
   - Use clocking blocks correctly to ensure stability in sequential circuits.
   
2. **Procedural Assignments**:
   - For complex combinational logic, use `always @(*)` blocks.
   - For sequential logic, use `always @(posedge clock)` or `always @(negedge clock)`.

3. **Non-blocking vs. Blocking Assignments**:
   - Use non-blocking assignments (`<=`) for sequential logic within `always` blocks.
   - Use blocking assignments (`=`) for combinational logic.

4. **Conditional Statements**:
   - Use `if-else`, `case`, and ternary operators to handle conditional logic.

### Best Practices

1. **Initialization**: Always initialize your flip-flops and registers.
2. **Synchronous Resets**: Prefer synchronous resets over asynchronous ones unless necessary.
3. **Naming Conventions**: Use clear, descriptive names for signals, modules, and nets.
4. **Commenting**: Comment your code for clarity.
5. **Simulation and Verification**: Maintain a robust testbench to verify the functionality of your design.
6. **Avoid Mixing Blocking and Non-Blocking Assignments**: Maintain a clear distinction between the two within each procedural block.
7. **Drive Strength**: Be cautious of drive strength, use the appropriate data types and signal strengths.

### Common Patterns

#### Signal Assignment
- Use `assign` for direct continuous assignments.

#### Multiplexing
- Commonly implemented using conditional operators or case statements to select between different input sources.

#### State Machine
- Often used for control logic, encoded with `always @(*)` for combinational logic and `always @(posedge clock)` for sequential operation.

#### Clock Gating
- Control signal enabling/disabling a clock input to modules.

### Concepts

1. **Finite State Machines (FSMs)**
   - **Types**: Mealy and Moore machines.
   - **Components**: States, transitions, inputs, outputs.
   
2. **Timing Analysis**
   - **Setup and Hold Times**: Ensure your signals meet these requirements.
   - **Clock Skew**: Minimize skew to avoid state transition problems.
   
3. **Metastability**
   - **Definition**: A condition where a signal fails to stabilize to a logic high or low.
   - **Mitigation**: Use synchronizers for clock domain crossing.

4. **Design for Testability (DFT)**
   - Incorporate features that make it easier to test the fabricated hardware.
   
5. **Power Consumption**
   - Optimize logic to reduce power usage, especially in battery-operated systems.

### Structured Information

1. **Top-Level Design**:
   - Start with defining module name and ports (inputs and outputs).
   - Example: `module my_module (input a, input b, output c);`

2. **Continuous Assignments**:
   - Use the `assign` keyword for simple combinational logic.
   - Example: `assign c = a & b;`

3. **Procedural Blocks**:
   - Segregate `always @(*)` for combinational logic, `always @(posedge clk)` for sequential logic.

4. **Conditional Logic**:
   - Use if-else or case constructs to implement decision-making logic.
   - Example: 
     ```verilog
     always @(*) begin
       if (condition) begin
         // Statements
       end else begin
         // Statements
       end
     end
     ```

5. **Instantiation of Modules**:
   - Call lower-level modules within higher-level modules.
   - Example: 
     ```verilog
     my_submodule instance_name (
       .input_port(signal),
       .output_port(other_signal)
     );
     ```

By adhering to this comprehensive knowledge base, one can develop efficient, high-quality Verilog code adaptable to diverse design requirements.

Task:
// A heating/cooling thermostat controls both a heater (during winter) and an air conditioner (during summer). 
// Implement a circuit that will turn on and off the heater, air conditioning, and blower fan as appropriate.

// The thermostat can be in one of two modes: heating (mode = 1) and cooling (mode = 0). 
// In heating mode, turn the heater on when it is too cold (too_cold = 1) but do not use the air conditioner. 
// In cooling mode, turn the air conditioner on when it is too hot (too_hot = 1), but do not turn on the heater. 
// When the heater or air conditioner are on, also turn on the fan to circulate the air. 
// In addition, the user can also request the fan to turn on (fan_on = 1), even if the heater and air conditioner are off.

// Try to use only assign statements, to see whether you can translate a problem description into a collection of logic gates.

// Hint: When designing circuits, one often has to think of the problem "backwards", 
// starting from the outputs then working backwards towards the inputs. 

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
