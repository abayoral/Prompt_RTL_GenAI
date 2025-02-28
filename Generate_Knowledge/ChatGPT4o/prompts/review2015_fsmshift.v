
## Knowledgebase on Verilog Design Principles and Patterns

### 1. Fundamentals of Verilog Design
- **Module Structure**: Each Verilog file or design unit often starts with a module declaration that specifies the module name and its input/output ports.
- **Always Blocks**: The 'always' block is a fundamental construct used to model sequential logic, combining combinational and clock-edge-sensitive logic.
- **Sensitivity List**: Always blocks may include sensitivity lists, specified by `@(posedge <signal>)` or `@(negedge <signal>)`, indicating the conditions under which the block executes.
- **Registers and Wires**: Verilog differentiates between 'reg' (used for variables that retain value across processes like flip-flops) and 'wire' (continuous assignment like combinational logic).

### 2. FSM (Finite State Machine) Design
- **State Declaration**: States are typically declared using `parameter` or `localparam` constructs for readability and manageability.
- **State Encoding**: Common encoding strategies include binary, one-hot, and gray code.
- **State Transitions**: Controlled using conditional statements within always blocks, transitioning between defined states based on input conditions and previous states.
- **State Register and Next-State Logic**: The state of the FSM is updated on clock edges, with next-state logic determining the upcoming state based on current inputs and the current state.

### 3. Synchronous Design Practices
- **Clock Domains**: Design all sequential logic to be synchronous to a clock signal, promoting stability and predictability.
- **Edge-Triggered](https://hdl.readthedocs.io/en/latest/VHDL/flip_flop.html)**: Flip-flops are typically triggered on rising (`posedge`) or falling (`negedge`) edges of the clock signal.
- **Synchronous Reset**: Implement reset logic within clock-edge sensitive blocks to ensure reliable initialization.

### 4. Shift Register Control
- **Enabling Shift Registers**: Control signals like `shift_ena` are often used to determine when data is shifted within the register.
- **Cycle Counting**: Create counters that can count specific number of clock cycles to drive the enable signals.

### 5. Verilog Patterns and Constructs
- **Case Statements**: Utilize `case` statements for more readable state transition logic.
- **Non-Blocking Assignments (`<=`)**: Use non-blocking assignments in sequential logic to ensure correct event ordering among registering computations.

### 6. Best Practices
- **Modularity**: Design your modules to be as modular and reusable as possible. This promotes code reuse and easier debugging.
- **Parameterized Modules**: Use parameters for easily scalable and configurable designs.
- **Design for Readability**: Code should be written in a clear, concise, and commented manner to ensure it is readable and maintainable.
- **Simulation and Testbenches**: Always verify your designs using simulation testbenches before synthesizing them.
- **Resource Optimization**: Be mindful of resource usage such as flip-flops and combinational logic to optimize for area, power, and performance.

### 7. Common Patterns and Idioms
- **Four State FSM for Control Logic**:
  1. An initial idle state.
  2. A detect state upon detecting a specific condition.
  3. An active state where actions are performed for a specified number of cycles.
  4. A return state transitioning back to idle after fulfilling the requirements.

- **Counter Implementation**: Use an internal counter to keep track of clock cycles while in a specific state.

- **Reset Logic**: Implement state reset logic consistently to ensure states are correctly initialized.

### Summary
These principles and patterns provide a solid foundation for Verilog design. They cover the basics of creating and understanding Verilog modules, including FSM design, synchronous logic, and best practices, aiding in the development of clear, efficient, and maintainable hardware descriptions.

Task:
// As part of the FSM for controlling the shift register, we want the ability to enable the shift register for exactly 4 clock cycles whenever the proper bit pattern is detected. Design an FSM handles enabling the shift register for 4 cycles.

// Whenever the FSM is reset, assert shift_ena for 4 cycles, then 0 forever (until reset).

module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    // Insert your code here
    
endmodule
