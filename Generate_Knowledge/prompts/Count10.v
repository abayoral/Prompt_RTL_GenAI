
**Verilog Design Knowledgebase**

### 1. Fundamental Concepts

#### Digital Design Basics
- **Flip-Flops and Registers**: Core building blocks for storing data, sensitive to clock edges.
- **Synchronous vs. Asynchronous Signals**: Synchronous signals (like resets) occur with the clock edge, while asynchronous signals can occur at any time.
- **Combination vs. Sequential Logic**: Combinational logic's output depends only on current inputs, whereas sequential logic's output depends on current inputs and past states.

#### Verilog Syntax and Semantics
- **Modules**: Basic building blocks; a module defines a block of functionality with a name, inputs, and outputs.
- **Always Blocks**: Used to model combinational or sequential logic. The sensitivity list includes signals that trigger an event.
  - `always @(posedge clk)`: Triggers on the rising edge of the clock.
  - `always @(posedge clk or posedge reset)`: Triggers on either the rising edge of the clock or the reset signal.
- **Non-blocking (`<=`) vs. Blocking (`=`) Assignments**: Non-blocking is used in sequential logic generally within an `always` block; blocking can be used within combinational logic.

### 2. Verilog Design Principles

#### Design for Synthesis
- **Avoid Latches**: Ensure all registers are driven every clock cycle to avoid accidentally inferring latches.
- **Parameterized Modules**: Use parameters to create reusable and versatile modules.
- **Correct Reset Handling**: Synchronous vs. asynchronous reset handling suited to design requirements, ensuring correct initialization.

#### Code Readability and Organization
- **Meaningful Names**: Use descriptive names for signals and modules to improve code readability.
- **Comments and Documentation**: Annotate code to explain functionality, especially in complex designs.
- **Modularity**: Break large designs into smaller, manageable sub-modules.

### 3. Common Patterns in Verilog Design

#### Counters
- **Simple Counters**: Increment a register on clock edges, rollover/limit the count.
- **Parameterized Counters**: Define maximum count as a parameter for reusability.
- **Bcd/Decade Counter**: Counts from 0 to 9; resets after reaching the maximum value.

#### State Machines
- **Finite State Machines (FSM)**: Model with states, transitions, and outputs based on state and inputs.
- **State Encoding**: Use one-hot, binary, or gray coding depending on implementation efficiency.

#### Clock and Reset Management
- **Clock Synchronization**: Handle domain crossings carefully to avoid metastability.
- **Reset Synchronization**: Ensure resets are synchronized to avoid race conditions particularly in multi-clock designs.

### 4. Best Practices in Verilog Coding

#### Synchronous Design Methodology
- **Edge-Triggered Behavior**: Use `always @(posedge clk)` to ensure changes happen at clock edges.
- **Reset Logic**: Proper handling of reset conditions; typically initialize registers to a known state.

#### Combinational Logic
- **Combinational Blocks**: Use continuous assignments or `always @*` blocks for purely combinational logic.
- **Avoiding Inferred Latches**: Ensure all outputs in a combinational block are assigned in all paths.

### 5. Optimization Techniques

#### Resource Sharing
- **Reuse Resources**: Share hardware resources like counters or adders if they are not used simultaneously.
- **Data Path Optimization**: Optimize the critical path to improve performance.

#### Power Management
- **Clock Gating**: Stop toggling of flip-flops when not required to save power.
- **Low Power Design Techniques**: Consider utilizing design techniques aimed at power reduction.

### 6. Verification

#### Testbenches
- **Stimulus Generation**: Create inputs that cover all possible states and edge cases.
- **Assertions and Checks**: Use assertions to validate design behavior during simulation.
- **Waveform Analysis**: Review simulation waveforms to ensure correct timing and logic flow.

#### Simulation and Debugging Tools
- **Simulators**: Use simulators to run and verify Verilog designs.
- **Linting Tools**: Use linting tools to catch common coding errors and enforce coding standards.

By adhering to these principles and embedding these patterns within your design workflow, a Verilog designer can create robust, efficient, and scalable digital circuits. This knowledge base serves to guide the design process, ensuring best practices are followed and common pitfalls are avoided.

Task:
// Build a decade counter that counts from 0 through 9, inclusive, with a period of 10. The reset input is synchronous, and should reset the counter to 0.

module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    // Insert your code here

endmodule
