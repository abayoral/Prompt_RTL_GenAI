
### Verilog Design Knowledgebase

#### 1. Basic Concepts
- **Modules and Hierarchy**: A Verilog module is the basic building block that may contain logic, submodules, and ports. Designs are often hierarchical, with a top-level module connecting submodules.
- **Ports**: Modules interact with external signals through ports defined as `input`, `output`, or `inout`.
- **Data Types**: Key data types in Verilog include `reg`, `wire`, `integer`, and `parameter`.
- **Operators**: Verilog supports various operators including arithmetic (+, -, *, /), logical (&&, ||, !), bitwise (&, |, ^, ~), reduction (&, |, ^), and concatenation/replication operations.

#### 2. Structural vs Behavioral Modeling
- **Structural**: Describes a circuit by specifying its components and their connections. It works like a schematic.
- **Behavioral**: Describes a circuit's behavior using constructs like `always` blocks, `initial` blocks, and procedural assignments.

#### 3. Continuous Assignments and Procedural Assignments
- **Continuous Assignment**: Uses the `assign` statement to drive values on wires. For combinational logic, continuous assignment is common.
- **Procedural Assignment**: Within `always` and `initial` blocks, procedural assignments (`=` and `<=`) drive values on `reg` variables.

#### 4. Best Practices
- **Modular Design**: Break complex designs into smaller, reusable modules.
- **Consistent Naming**: Use consistent and descriptive names for signals and modules.
- **Comments and Documentation**: Include comments and documentation to explain the purpose of modules and signal transformations.
- **Part Selects and Concatenation**: Use part selects (`signal[msb:lsb]`) to manipulate specific bits and concatenation (`{}`) to combine signals.

#### 5. Common Patterns
- **Bitwise Operations**: Use `&`, `|`, and `^` for bitwise AND, OR, and XOR operations respectively. `~` for bitwise NOT.
- **Logical Operations**: Use `&&`, `||`, and `!` for logical AND, OR, and NOT respectively.
- **Reduction Operations**: Use reduction operators (&, |, ^) to reduce a vector to a single bit by performing the operation across all bits.
- **Concatenation**: Use `{}` to concatenate multiple bits or vectors, e.g., `{a, b}`.

#### 6. Special Constructs
- **Part Selects**: Allows assignment or usage of specific bits of a vector. For example, `signal[3:0]` denotes the four least significant bits of `signal`.
- **Concatenation and Replication**: `{a, b}` concatenates `a` and `b`. Replication `{num{signal}}` creates `num` copies of `signal`.

#### 7. Bitwise and Logical Differences
- **Bitwise OR** (`|`): Applies OR to each corresponding bit of two vectors. If any bit is 1, the result is 1.
- **Logical OR** (`||`): Considers the entire vectors as a single boolean value. If any bit in either vector is 1, the result is 1.

#### 8. Design Patterns in Verilog
- **Combinational Logic**: For logic that doesn’t depend on a clock, use continuous assignments (`assign` statements).
- **Sequential Logic**: For clock-dependent logic, use `always @(posedge clk)` or `always @(negedge clk)` blocks.
- **Initialization**: Initialize variables especially in simulation to avoid unknown states.
- **State Machines**: Use `case` or `if-else` statements within `always` blocks to describe state machine behavior.
- **Parameterization**: Use `parameter` to define constants and make modules reusable with different configurations.

#### 9. Debugging Tips
- **Waveform Analysis**: Using simulators to examine signal waveforms and validate the behavior.
- **Testbenches**: Write testbenches to simulate and verify the design under various conditions.
- **Assertion-Based Verification**: Include assertions to check for illegal states and design invariants.

#### 10. Design Flow
- **Specification**: Clearly define the requirements and functionality.
- **Coding**: Write Verilog code following best practices.
- **Simulation**: Simulate and verify functionality using testbenches.
- **Synthesis**: Translate Verilog code to hardware description for implementation on actual hardware.
- **Place and Route**: Physical placement of synthesized components on the target technology.
- **Verification**: Post-synthesis simulation to ensure design correctness.

This knowledgebase provides a comprehensive guide for understanding and implementing Verilog-based designs. It covers essential concepts, best practices, common patterns, and tips for successful Verilog programming and debugging.

Task:
// Build a circuit that has two 3-bit inputs that computes 
// the bitwise-OR of the two vectors, the logical-OR of the two vectors, 
and the inverse (NOT) of both vectors. Place the inverse of b in 
// the upper half of out_not (i.e., bits [5:3]), and the inverse of a in the lower half.

// Hint: Even though you cannot assign to a wire more than once, 
// you can use a part select on the left-hand-side of an assign. 
// You don't need to assign to the entire vector all in one statement.

module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

// Insert your code here

endmodule
