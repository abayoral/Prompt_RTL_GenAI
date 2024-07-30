
### Knowledge Base for Verilog Design

#### Background Knowledge
1. **Verilog HDL**: A hardware description language used to model digital systems. It supports structural, behavioral, and dataflow modeling.
2. **Galois Linear Feedback Shift Register (LFSR)**: A type of shift register that uses linear feedback to produce a pseudorandom sequence of bits. The feedback is typically tapped from specific positions in the register.

#### Principles
1. **Modules and Hierarchy**: Verilog designs are structured hierarchically using modules. Each module can contain instances of other modules, enabling complex designs to be broken down into simpler sub-components.
2. **Combinational vs. Sequential Logic**: Verilog supports both:
   - **Combinational logic** lacks memory and produces outputs solely based on current inputs.
   - **Sequential logic** involves memory elements (e.g., flip-flops) and depends on both current inputs and past states.
3. **Always Blocks**: There are two major types:
   - **always @(*)** for combinational logic.
   - **always @(posedge clk)** for sequential logic (sensitive to clock edges).

#### Structured Information

1. **Basic Constructs**
   - **Wire and Reg**: 
     - `wire` for connecting combinational logic.
     - `reg` for variables assigned within procedural blocks.
   - **Initial and Always Blocks**:
     - `initial` for setting initial conditions.
     - `always` blocks for defining behavior based on events (e.g., clock edges, level changes).

2. **Clocking and Reset**
   - **Edge-triggered**: Typically `always @(posedge clk)` for positive edge-triggered sequential logic.
   - **Reset Mechanism**: Often implemented as an active-high or active-low signal to initialize the system into a known state.
     - **Synchronous Reset**: Checked within the clocked `always` block.
     - **Asynchronous Reset**: Checked independently of the clock.

3. **Registers and Flip-Flops**
   - D Flip-Flops: The basic building blocks for storing bits. Can create multi-bit registers by using vectors.
   - Shift Registers: Can be implemented using a series of D Flip-Flops.

4. **LFSR Specifics**
   - **Feedback Logic**: For a Galois LFSR, the feedback is typically from the output of one of the flip-flops, XORed with other selected taps, and fed back into the input.
   - **Tap Positions**: Specific bits within the register that are XORed together to create the feedback signal.

5. **Vectors and Arrays**
   - Efficiently handling multiple bits using vectors (e.g., `reg [31:0] q;`).

6. **Operations and Statements**
   - **Concatenation**: Can be used to shift and combine bits (e.g., `{q[30:0], feedback}`).
   - **Blocking vs. Non-Blocking Assignments**:
     - Use `<=` (non-blocking) in sequential `always` blocks.
     - Use `=` (blocking) in combinational `always` blocks or continuous assignments.

#### Best Practices
1. **Code Structuring**
   - Keep combinational and sequential logic separate.
   - Use clear and meaningful signal names.
   - Modularize code for better readability and reusability.

2. **Reset Handling**
   - Ensure that all sequential elements are properly reset during the initialization phase to avoid indeterminate states.

3. **Simulation and Testing**
   - Always simulate your design thoroughly to verify functionality.
   - Use testbenches to automate the testing process.

4. **Optimization**
   - Minimize the use of unnecessary logic.
   - Optimize feedback logic in LFSR for minimal gate delay.

5. **Documentation**
   - Comment your code generously, explaining the purpose and functionality of key parts.
   - Maintain a clear documentation of signal descriptions and module interfaces.

By applying the principles, structured information, and best practices outlined in this knowledge base, a language model can generate efficient and accurate Verilog modules for various digital design tasks.

Task:
// Build a 32-bit Galois LFSR with taps at bit positions 32, 22, 2, and 1.

// Hint: This is long enough that you'd want to use vectors, not 32 instantiations of DFFs.

module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

	// Insert your code here

endmodule