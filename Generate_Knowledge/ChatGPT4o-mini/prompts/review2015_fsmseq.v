
### Verilog Design Knowledgebase for Generating Finite-State Machines (FSMs) and General Module Design

#### General Verilog Concepts
1. **Modules and Ports**
   - **Module Definition**: A module is the basic building block in Verilog. It includes a name, a port list, and a body.
   - **Ports**: Ports are used to connect a Verilog module to other modules or to external signals. They can be inputs, outputs, or inouts.
   - **Port Directions**:
     - `input`: Signals driven by external circuits that influence the module.
     - `output`: Signals driven by the module that influence external circuits.
     - `inout`: Bidirectional signals.

2. **Registers and Nets**
   - **Registers (`reg`)**: Used to store values. They can be used in procedural blocks (`always`, `initial`).
   - **Nets (`wire`)**: Used for continuous assignment. They represent connections between different parts of a circuit.

3. **Procedural Blocks**
   - **Always Block**: Executes whenever the sensitivity list changes.
     - Synchronous (`always @(posedge clk)`): Executes on a clock edge.
     - Asynchronous (`always @*`): Executes whenever any signal in the sensitivity list changes.
   - **Initial Block**: Executes once at the beginning of the simulation.

4. **Operators**
   - **Logical Operators**: `&&`, `||`, `!`
   - **Bitwise Operators**: `&`, `|`, `^`
   - **Shift Operators**: `<<`, `>>`
   - **Comparison Operators**: `==`, `!=`, `<`, `>`

5. **Decision Making**
   - **If-Else Statements**: Conditional branching.
   - **Case Statements**: Multipath branching based on different values of a variable.

#### Finite-State Machines (FSM) Design in Verilog
1. **FSM Basics**
   - FSMs consist of states, transitions, and actions. They can be modeled as Moore (outputs depend only on states) or Mealy (outputs depend on states and inputs) machines.
   - State transitions occur based on inputs and may also involve outputs.
   
2. **Components of FSM in Verilog**:
   - **State Encoding**: Use `parameter` or `typedef` to define states.
   - **State Register**: A `reg` that holds the current state.
   - **Next State Logic**: Combinational logic that determines the next state based on current state and inputs.
   - **Output Logic**: Determines the output based on the current state (and possibly inputs, for Mealy FSM).

3. **Best Practices for FSMs**
   - **State Encoding**: Use binary, gray code, or one-hot encoding. One-hot is easy to debug but uses more flip-flops.
   - **Reset Condition**: Synchronously reset the FSM to a known initial state.
   - **Stable Outputs**: Ensure outputs are stable and defined for every state.
   - **Synchronization**: Synchronize asynchronous inputs to the clock domain of the FSM.

4. **Common FSM Patterns**
   - **State Transition**:
     ```verilog
     always @(posedge clk) begin
         if (reset) 
             current_state <= INITIAL_STATE;
         else 
             current_state <= next_state;
     end
     ```
   - **Next State Logic**:
     ```verilog
     always @* begin
         case(current_state)
             STATE1: if (condition) next_state = STATE2;
             // Additional state transitions
         endcase
     end
     ```
   - **Output Logic**:
     ```verilog
     always @* begin
         case(current_state)
             STATE1: output_signal = value;
             // Output logic for other states
         endcase
     end
     ```

#### Synchronous Reset Design Pattern
- **Synchronous Reset**: Incorporate reset functionality within the `always @(posedge clk)` block to ensure reset occurs in synchrony with the clock.
  ```verilog
  always @(posedge clk) begin
      if (reset) 
          // Reset all state variables and outputs
      else 
          // Regular operation
  end
  ```

#### Practical Considerations for FSMs
1. **Testing and Debugging**:
   - **Simulation**: Use testbenches to simulate FSM behavior.
   - **Waveform Analysis**: Use waveform viewers to inspect signal transitions and state changes.
   - **Assertions**: Incorporate assertions to validate key properties and state transitions.

2. **Modularity**:
   - Design FSMs to be modular and reusable. This helps when integrating FSMs into larger systems.
   - Encapsulate state machine logic within dedicated modules with clear interface definitions.

3. **Documentation**:
   - Comment code extensively, especially state transitions and output logic, to clarify the intended operation of the FSM.
   - Use meaningful names for states, signals, and variables to improve readability and maintainability.

By adhering to these principles and practices, one can design robust, efficient, and maintainable Verilog modules capable of performing complex tasks such as the finite-state machine provided in the prompt. This knowledge base forms a foundation for generating and understanding more sophisticated Verilog designs in future tasks.

Task:
// Build a finite-state machine that searches for the sequence 1101 in an input bit stream. When the sequence is found, it should set start_shifting to 1, forever, until reset. Getting stuck in the final state is intended to model going to other states in a bigger FSM that is not yet implemented. We will be extending this FSM in the next few exercises.

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    // Insert your code here

endmodule
