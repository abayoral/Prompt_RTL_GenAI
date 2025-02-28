
### Background Knowledge for Verilog Design

#### Verilog Overview
Verilog is a hardware description language used to model electronic systems. It allows designers to describe the structure and behavior of electronic circuits, used primarily in the design and verification of digital circuits at the register-transfer level (RTL).

#### Basic Components
- **Modules**: Basic building blocks in Verilog. Each module can represent a hardware component.
- **Ports**: Interfaces for modules to communicate with other components. Ports can be inputs, outputs, or bidirectional.
- **Registers and Wires**:
  - **Registers (reg)**: Storage elements.
  - **Wires (wire)**: Used for connecting elements and do not store value.
- **Continuous Assignments**: Used for simple logic that does not require state storage.
- **Procedural Blocks**: Represented using `always` blocks. Used for sequential logic.

#### Shift Registers
A shift register is a sequential circuit used for storing and shifting data. It consists of a series of flip-flops connected in a chain, where the output of one flip-flop is connected to the input of the next.

#### Multiplexer (MUX)
A multiplexer is a combinational circuit that selects one of many inputs and forwards the selected input to a single output line.

#### Flip-Flops
Flip-flops are basic memory elements that store a single bit of data. The most common types in digital circuits are D flip-flops.

### Principles and Best Practices

#### Design Modularity
- **Hierarchical Design**: Break the design into smaller, manageable modules.
- **Parameterization**: Use parameters to create reusable and adaptable modules.

#### Naming Conventions
- Use meaningful names for signals and modules.
- Prefix inputs with `i_` and outputs with `o_`.

#### Commenting and Documentation
- Provide comments to explain complex logic.
- Document the purpose of each module and the role of its ports.

#### Simulation and Verification
- Write test benches to simulate and verify the design.
- Use assertions to catch unintended behavior.

### Common Patterns in Verilog Design

#### Sequential Logic
- Always use non-blocking assignments (`<=`) in `always` blocks for sequential logic.
- Use synchronous resets for better timing and predictability.

#### Combinational Logic
- Use continuous assignments (`assign`) for simple combinational logic.
- Use the `always` block with sensitivity lists like `always @(*)` for more complex combinational logic.

#### Debouncing
- Implement debouncing for signals coming from mechanical switches to avoid spurious signals.

#### State Machines
- Use state machines for handling complex control logic, with clear definitions of states and transitions.

### Structured Information

#### Shift Register Module
1. **Ports**:
   - Inputs: Parallel load inputs, shift enable, clock, reset.
   - Output: Shifted data.
   
2. **Implementation**:
   - Create an array of flip-flops.
   - Use a multiplexer to select between the input data or the shift.

#### Multiplexer Design
1. **2-to-1 MUX**:
   - Selects between two inputs based on a control signal.
   - Ports: Two data inputs, one control input, one output.

2. **4-to-1 MUX**:
   - Selects from four inputs.
   - Ports: Four data inputs, two control inputs, one output.

#### Flip-Flop Design
1. **D Flip-Flop**:
   - Stores data on clock edge.
   - Ports: Data input, clock input, reset, output.

#### Top-Level Module Design
1. **Instantiation**:
   - Instantiate lower-level modules (e.g., MUX, DFF).
   - Connect the instantiated modules to form the shift register.

2. **Connectivity**:
   - Tie external inputs/outputs to appropriate internal signals.
   - Ensure proper port mapping.

### Practical Considerations

1. **Floorplanning**: Plan how modules will be placed on the FPGA to minimize delay.
2. **Timing Analysis**: Ensure the design meets timing specifications.
3. **Power Consumption**: Consider power implications of your design choices.
4. **Scalability**: Design with the future in mind. Make your design scalable and adaptable.

This knowledgebase can help guide another language model tasked with generating proficient and efficient Verilog modules by providing a structured and comprehensive foundation.

Task:
// Write a top-level Verilog module (named top_module) for the shift register, assuming that n = 4. Instantiate four copies of your MUXDFF subcircuit in your top-level module. Assume that you are going to implement the circuit on the DE2 board.

// Connect the R inputs to the SW switches,
// clk to KEY[0],
// E to KEY[1],
// L to KEY[2], and
// w to KEY[3].
// Connect the outputs to the red lights LEDR[3:0].

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

endmodule

// Insert your code below

module MUXDFF (...);

endmodule