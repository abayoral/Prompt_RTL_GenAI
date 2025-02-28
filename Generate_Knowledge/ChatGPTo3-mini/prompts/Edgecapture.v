
### Knowledge Base for Verilog Design Tasks

#### 1. **Basic Verilog Syntax and Constructs:**
   - **Modules and Ports:**
     - Define modules using the `module` keyword.
     - Specify input and output ports.
     - Use the `endmodule` keyword to denote the end of the module.
   - **Data Types:**
     - Use `wire` for continuous assignments.
     - Use `reg` for storage elements inside always blocks.
   - **Operators:**
     - Logical: `&&`, `||`, `!`
     - Bitwise: `&`, `|`, `^`, `~`
     - Reduction: `&`, `|`, `^`

#### 2. **Always Blocks:**
   - Used to describe synchronous and combinational logic.
   - **Edge Sensitivity:**
     - `always @(posedge clk or posedge reset)` for synchronous processes.
   - **Procedural Assignments:**
     - Use `<=` for non-blocking assignments in sequential logic.
     - Use `=` for blocking assignments in combinational logic.

#### 3. **Sequential Logic:**
   - **Flip-flops and Registers:**
     - Synchronous reset: Reset operation within clock edges.
     - Asynchronous reset: Reset operation independent of the clock.
   - **SR Flip-flop Behavior:**
     - Set and Reset conditions.
     - Priority when both set and reset signals are high.

#### 4. **Combinational Logic:**
   - **Continuous Assignment:** 
     - Use `assign` for simple combinational logic outside procedural blocks.

#### 5. **Best Practices:**
   - **Reset Signals:**
     - Prefer synchronous reset over asynchronous reset to avoid metastability.
   - **Avoiding Race Conditions:**
     - Ensure proper use of blocking (`=`) and non-blocking (`<=`) assignments.
   - **Code Readability:**
     - Use comments to explain functionality.
     - Use meaningful names for signals and modules.

#### 6. **Design Patterns:**
   - **State Machines:**
     - Encoding states using parameters.
     - State transition logic within a single always block.
   - **Shift Registers:**
     - Shifting data with each clock cycle.
   - **Debouncing Circuits:**
     - Removing noise from buttons and input signals.

#### 7. **Common Constructs in Verilog Designs:**
   - **Initialization at Start:**
     - Initialization of registers typically in the reset condition.
   - **Clock Gating:**
     - Reducing power consumption by controlling clock distribution.
   - **Parameterization:**
     - Using `parameter` keyword for making designs scalable.

#### 8. **Simulation and Verification:**
   - **Test Benches:**
     - Creating test modules to verify functionality.
   - **Waveform Analysis:**
     - Inspecting signal transitions and timing using simulation tools.

#### 9. **Interfacing and Integration:**
   - **Hierarchical Design:**
     - Breaking larger designs into smaller modules.
   - **Bus Interfaces:**
     - Standard buses (e.g., AXI, AHB) for communication between modules.

#### 10. **Handling Multi-bit Signals:**
   - Use `for-loops` in procedural blocks for iterating over bit vectors.
   - Apply bitwise operations to vectors (`&`, `|`, `^`, `~`).

### Detailed Considerations for the Problem Statement

#### 1. **Bit Transition Detection:**
   - Detecting a '1' to '0' transition:
     - Previous state storage: Store the previous value of the input signal.
     - Comparison: Compare the current value to the previous value.

#### 2. **SR Flip-flop Behavior Per Bit:**
   - **Set Condition:**
     - If current bit of input is 0 and previous bit was 1, set the output bit.
   - **Reset Condition:**
     - On synchronous reset, reset all output bits to 0.

#### 3. **Priority Handling:**
   - Reset has precedence over the set operation.
   - Typically, check reset conditions first within the always block.

#### 4. **Output Storage:**
   - Use registers to store output values.
   - Update output values based on the detected conditions.

This structured knowledge base can guide the design of Verilog modules efficiently and helps ensure adherence to best practices and common design patterns.

Task:
// For each bit in a 32-bit vector, capture when the input signal changes from 1 in one clock cycle to 0 the next. "Capture" means that the output will remain 1 until the register is reset (synchronous reset).

// Each output bit behaves like a SR flip-flop: The output bit should be set (to 1) the cycle after a 1 to 0 transition occurs. The output bit should be reset (to 0) at the positive clock edge when reset is high. If both of the above events occur at the same time, reset has precedence. In the last 4 cycles of the example waveform below, the 'reset' event occurs one cycle earlier than the 'set' event, so there is no conflict here.

module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

	// Insert your code here

endmodule