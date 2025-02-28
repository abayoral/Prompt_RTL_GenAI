
### Verilog Knowledge Base for Cellular Automaton (CA) Design

#### General Concepts
1. **Cellular Automaton (CA) Overview**:
    - A CA is a discrete model studied in automata theory, consisting of a grid of cells.
    - Each cell changes state according to a local rule based on the states of neighboring cells.
    - CAs can model complex systems with simple rules and have applications in various fields, including physics, computer science, and biology.

2. **Rule 90**:
    - A specific 1D CA where each cell's next state is the XOR of its two immediate neighbors.
    - It exhibits interesting properties and can generate fractal patterns, such as the Sierpiński triangle when starting from a single 'on' cell.

3. **Boundary Conditions**:
    - In finite CAs, boundaries need special handling to prevent accessing invalid cell indices.
    - Common approaches include assuming fixed states (e.g., always 'off'), wrapping (circular array), or reflecting edges.

#### Basic Principles of Verilog Design
1. **Module Definition**:
    - A Verilog module is the basic building block representing a hardware component.
    - Modules include a definition of input and output ports, internal logic, and instantiation of other modules.

2. **Clock and Reset Handling**:
    - Synchronous circuits use a clock signal to coordinate changes in state.
    - Reset signals are used to initialize or reset the state of the system.

3. **Data Storage**:
    - Use registers (`reg`) to store the state of the system.
    - Flip-flops are modeled using always blocks (e.g., `always @(posedge clk)`).

4. **Combinational Logic**:
    - Combinational logic computes outputs instantaneously based on current inputs without involving memory.
    - Use continuous assignment (`assign`) or combinational always blocks (`always @*`).

5. **Parameterized Designs**:
    - Parameters enable scalable designs by defining reusable modules that can operate on different data widths or sizes.

#### Best Practices in Verilog Design
1. **Readable Code**:
    - Use descriptive signal names and consistent formatting for better readability and maintenance.
    - Include comments to describe the functionality of code sections and complex operations.

2. **Modularity**:
    - Break down complex designs into smaller, reusable modules.
    - Encapsulate functionality in modules with clearly defined interfaces (inputs/outputs).

3. **Simulation and Testing**:
    - Verify designs through simulation using testbenches before synthesizing to hardware.
    - Testbenches should comprehensively test all aspects of the design, including edge cases and error conditions.

4. **Resource Management**:
    - Optimize resource usage by minimizing the number of logic elements and memory.
    - Consider trade-offs between speed, area, and power consumption.

#### Common Verilog Design Patterns
1. **Shift Registers**:
    - Typically used to move data through a chain of registers.
    - They can be implemented with a combination of always blocks and non-blocking assignments (`<=`).

2. **State Machines**:
    - Used to model control logic by defining states and transitions based on inputs.
    - Implement with a combination of always blocks capturing the state and transition logic.

3. **Parallel Processing**:
    - Designs can exploit parallelism by performing operations concurrently on multiple pieces of data.
    - Use generate statements for creating repetitive hardware structures.

#### Example Patterns Related to CA
1. **Array Initialization and Updates**:
    - Initialize the state array on reset or load conditions using sequential logic.
    - Update the array based on the rule (e.g., XOR operation) in each clock cycle.

2. **Boundary Handling**:
    - Implement special conditions for cells at the boundaries of the array.
    - Example: Assume boundary cells are always 'off' (0).

3. **Bitwise Operations**:
    - Use bitwise operations (XOR, AND, OR) for efficient cell state updates.

By leveraging this structured knowledge base, language models generating Verilog modules can effectively design, simulate, and optimize complex systems like cellular automata with these general concepts and best practices.

Task:
// Rule 90 is a one-dimensional cellular automaton with interesting properties.

// The rules are simple. There is a one-dimensional array of cells (on or off). At each time step, the next state of each cell is the XOR of the cell's two current neighbours. A more verbose way of expressing this rule is the following table, where a cell's next state is a function of itself and its two neighbours:

// Left	Center	Right	Center's next state
// 1	1	1	0
// 1	1	0	1
// 1	0	1	0
// 1	0	0	1
// 0	1	1	1
// 0	1	0	0
// 0	0	1	1
// 0	0	0	0
// (The name "Rule 90" comes from reading the "next state" column: 01011010 is decimal 90.)


// In this circuit, create a 512-cell system (q[511:0]), and advance by one time step each clock cycle. The load input indicates the state of the system should be loaded with data[511:0]. Assume the boundaries (q[-1] and q[512]) are both zero (off).

// Hint: For an initial state of q[511:0] = 1, the first few iterations are:
//        1
//       10
//      101
//     1000
//    10100
//   100010
//  1010101
// 10000000
// This forms half of a Sierpiński triangle.

module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 

    // Insert your code here

endmodule
