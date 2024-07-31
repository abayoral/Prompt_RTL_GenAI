
### Knowledge Base for Verilog Design

#### General Verilog Concepts
1. **Modules**: In Verilog, a module is the basic building block. A module can represent a hardware entity, and it is defined using the `module` and `endmodule` keywords.
2. **Ports**: Modules have ports (inputs and outputs) that are wires or registers. These are defined in the module declaration.
3. **Registers (reg) and Wires (wire)**:
   - `reg` is used for storing values (flip-flops, latches).
   - `wire` is used for connecting different parts of a module (combinatorial logic).
4. **Always Blocks**: Code inside an `always` block is executed whenever a specific condition is met (`always @(...)`). 
   - `always @(posedge clk)` triggers on the positive edge of the clock signal.
5. **Sensitivity List**: It specifies when the `always` block should be triggered and can include signals, such as `clk` or `rst`.

#### Design Principles
1. **Reset Logic**: Always implement reset functionality in sequential circuits to initialize registers to a known state.
2. **Clocking**: Ensure proper synchronization of registers using clock signals, typically using the positive edge (`posedge`).
3. **Non-blocking (`<=`) vs Blocking (`=`) Assignments**:
   - Non-blocking assignments (`<=`) are used in sequential logic within `always` blocks.
   - Blocking assignments (`=`) are used in combinational logic within `always` blocks.
4. **State Machines**: For complex control logic, use state machines (FSM - Finite State Machines) to manage different states and transitions.
  
#### Common Design Patterns
1. **Shift Registers**:
   - Shift registers are used for serial-in, parallel-out, or parallel-in, serial-out functionalities.
   - Bits are shifted in using a clock and shift enable signal.
2. **Counters**:
   - Down counters decrement a value stored in registers.
   - Use enable signals to control counting operations.
3. **Data Path and Control Path**:
   - Separate data path (where data is manipulated, e.g., arithmetic operations) from control path (signals that control data path operations).
4. **Debouncing**:
   - Switches and signals may require debounce logic to ensure stable inputs.
   
#### Best Practices
1. **Code Readability**: Use meaningful names for signals and modules. Comment your code to enhance readability.
2. **Modularity**: Break down large designs into smaller, reusable modules.
3. **Parameterization**: Use parameters to create generic, reusable code that can be configured without changes.
4. **Testbenches**: Always create testbenches to simulate and verify the functionality of your design.
5. **Synthesis Constraints**: Be mindful of synthesis constraints like timing, power, area, and ensure your code is synthesizable.

#### Common Verilog Constructs
- **`if-else` Statements**: Used for conditional operations.
- **`case` Statements**: Used for creating multiplexers or state machines.
- **Registers (`reg` types)**: Typically used in conjunction with always blocks to store state.

#### Clock Gating and Power Efficiency
- Use enable signals wisely to ensure registers only update when needed.
- Implement clock gating for power efficiency by controlling the delivery of the clock signal.

### Specific Knowledge for Shift Registers and Counters
1. **Shift Register Design**:
   - Shift bits left or right on a clock edge when a shift enable signal is active.
   - Use concatenation to manage bit shifting, e.g., `{q[2:0], data}` for MSB shift-in.

2. **Down Counter Implementation**:
   - Decrement the register's value on each clock edge when a count enable signal is active.
   - Manage underflow conditions if necessary (optional).

3. **Combining Functionality**:
   - Use a prioritized `if-else` structure to manage shift and count enable signals.
   - Ensure only one operation (shift or count) is active based on the given enable signals.

### Handling Edge Cases
- Since both `shift_ena` and `count_ena` being high simultaneously is "don't care," focus on handling each enable signal independently.
- Potentially use default cases to handle unspecified behaviors cleanly.

With these principles and structured information as a foundation, a secondary language model should be better equipped to generate robust, efficient, and clean Verilog modules for various design tasks including, but not limited to, the specified four-bit shift register with down counter functionality.

Task:
// Build a four-bit shift register that also acts as a down counter. Data is shifted in most-significant-bit first when shift_ena is 1. The number currently in the shift register is decremented when count_ena is 1. Since the full system doesn't ever use shift_ena and count_ena together, it does not matter what your circuit does if both control inputs are 1 (This mainly means that it doesn't matter which case gets higher priority).

module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    // Insert your code here

endmodule
