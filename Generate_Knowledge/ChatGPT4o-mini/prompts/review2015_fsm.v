
### Comprehensive Knowledge Base for Verilog FSM Design

#### 1. **Verilog Design Basics**
- **Modules**: The fundamental building block in Verilog. Each module describes a component of the hardware design with inputs, outputs, and internal logic.
- **Always Blocks**: Used to describe sequential logic. Triggered by events like clock edges or changes in signals.
- **Continuous Assignments**: Used to model combinational logic with `assign` statements.
- **Reg and Wire**: `reg` is used for variables that hold values across procedural assignments, typically within `always` blocks. `wire` is used for combinational signals.
- **Parameter**: Used to define constants within a module, enhancing code readability and maintainability.

#### 2. **Finite State Machines (FSM)**
- **FSM Types**: Two main types are Moore and Mealy machines. 
  - **Moore Machine**: Outputs depend only on the current state.
  - **Mealy Machine**: Outputs depend on the current state and inputs.
- **FSM Components**:
  - **State Register**: Holds the current state. Typically implemented using a `reg`.
  - **Next State Logic**: Determines the next state based on current state and inputs.
  - **Output Logic**: Determines the outputs based on the current state (and possibly inputs for Mealy machines).

#### 3. **FSM Design Principles**
- **State Encoding**:
  - **Binary Encoding**: States are represented using binary numbers. It is efficient in terms of storage.
  - **One-hot Encoding**: Each state is represented by a unique bit. Only one bit is 'hot' (1) at any time. It simplifies state transition logic but uses more flip-flops.
  - **Gray Encoding**: Ensures only one bit changes at a time during state transitions, useful for minimizing glitches.
- **Reset Condition**: Define a reset state to ensure FSM starts in the correct state.
- **State Transitions**: Use case statements within an always block to handle different states and transitions.
- **Edge Sensitivity**: For synchronous FSMs, make use of the positive or negative edge of clock signals.

#### 4. **Best Practices in Verilog FSM Design**
- **Parameterized States**: Use `parameter` to define state values for clarity.
- **Synchronous Reset**: Avoid asynchronous reset within synchronous design to minimize metastability.
- **State Transition Diagrams**: Before coding, design state transition diagrams to visualize state changes, facilitating better code structuring.
- **Avoid Latches**: Ensure all signals, especially within combinational logic blocks, are fully specified to avoid inadvertent latch inference.
- **Code Modularity**: Separate FSM control logic and data path logic into different modules for clarity and maintainability.

#### 5. **Common Patterns and Techniques**
- **State Transition Block**:
  ```verilog
  always @(posedge clk or posedge reset) begin
      if (reset) current_state <= RESET_STATE;
      else current_state <= next_state;
  end
  ```
- **Next State Logic**:
  ```verilog
  always @(*) begin
      case (current_state)
          STATE1: if (condition1) next_state = STATE2;
          ...
          ...
          default: next_state = RESET_STATE;
      endcase
  end
  ```
- **Output Logic**:
  ```verilog
  always @(*) begin
      case (current_state)
          STATE1: begin
              output1 = 1'b0;
              ...
          end
          ...
          ...
          default: begin
              output1 = 1'b0;
              ...
          end
      endcase
  end
  ```

#### 6. **Illustrative Example: Pattern Detection**
- **Pattern Detection**: To detect a sequence like `1101`, use shift registers or sequence matchers within the FSM states.
- **Shift Enable**: Assert for a specific number of clock cycles using counters within the FSM.
- **Counting and Acknowledgment**: Maintain states to wait for external signals such as `done_counting` and `ack`.

### Application to the Prompt
- **Initialization**: Define a reset state that starts the pattern detection.
- **Pattern Matching**: Use sequence detector within FSM to identify `1101`.
- **Shift Enable Phase**: Transition to a state that asserts `shift_ena` for 4 cycles.
- **Counting Phase**: Transition to a state that waits for `done_counting`.
- **Notification Phase**: Transition to state that asserts `done` and waits for `ack` before resetting.

### Conclusion
Quality FSM in Verilog relies on understanding and application of these foundational principles and best practices. Using structured logic flow and clear state management are key elements for designing robust FSMs capable of handling various hardware control tasks, ensuring accurate control sequences, and improving simulation and synthesis efficiency.

Task:
// We want to create a timer that:

// First, is started when a particular pattern (1101) is detected,
// Second, shifts in 4 more bits to determine the duration to delay,
// Third, waits for the counters to finish counting, and
// Fourth, notifies the user and waits for the user to acknowledge the timer.
// Fifth, In this problem, implement just the finite-state machine that controls the timer. The data path (counters and some comparators) are not included here.

// The serial data is available on the data input pin. When the pattern 1101 is received, the state machine must then assert output shift_ena for exactly 4 clock cycles.

// After that, the state machine asserts its counting output to indicate it is waiting for the counters, and waits until input done_counting is high.

// At that point, the state machine must assert done to notify the user the timer has timed out, and waits until input ack is 1 before being reset to look for the next occurrence of the start sequence (1101).

// The state machine should reset into a state where it begins searching for the input sequence 1101.

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    // Insert your code here

endmodule
