
**Verilog Design General Knowledgebase**

### Background Knowledge

1. **Verilog HDL (Hardware Description Language)**:
   - Verilog is used for modeling electronic systems. It facilitates the description of a circuit's behavior and structure.

2. **Modules**:
   - A Verilog module is the basic building block. It encapsulates inputs, outputs, and internal logic.

3. **Finite State Machines (FSMs)**:
   - FSMs are used to design sequential logic where the output depends not only on the current input but also on the history of inputs (represented as states).
   - An FSM can be described by states, transitions between states, and actions that occur on transitions.

4. **Synchronous vs. Asynchronous Systems**:
   - Synchronous systems use a clock signal to coordinate actions.
   - Asynchronous systems operate without a global clock.
  
5. **Synchronous Reset**:
   - A synchronous reset clears the system state based on the clock's edge, ensuring predictable behavior.

### Principles and Best Practices

1. **FSM Design**:
   - Define explicit states: Use an enumerated type or parameters to define readable state names.
   - Separate different aspects of the design: Have distinct blocks for state transition, state registers, and output logic.
   - Keep state transition logic combinational and state update logic sequential.
   
2. **State Encoding**:
   - Binary Encoding: Uses the minimum number of bits.
   - One-Hot Encoding: Each state is represented by a bit, and only one bit is high at any time.

3. **Design for Clear and Maintainable Code**:
   - Use meaningful names for signals and states.
   - Comment the code adequately to explain transitions and operations.
   - Avoid magic numbers; use parameters or `localparam` for constants.

4. **Clock Domain Crossing**:
   - When dealing with multiple clock domains, use synchronizers for reliable data transfer.
  
5. **Glitches and Metastability**:
   - Use proper synchronizers to prevent glitches and handle metastability, especially for asynchronous inputs.

### Common Patterns in Verilog Design

1. **State Transition Logic**:
   - Typically written in a combinational always block.
   - Example structure:
     ```verilog
     always @(*) begin
         next_state = current_state;
         case (current_state)
           // Define state transitions
         endcase
     end
     ```

2. **State Register**:
   - Typically written in a sequential always block.
   - Example structure:
     ```verilog
     always @(posedge clk) begin
         if (reset)
             current_state <= initial_state;
         else
             current_state <= next_state;
     end
     ```

3. **Output Logic**:
   - Can be defined within a combinational or sequential always block based on the next state or current state.
   - Example structure:
     ```verilog
     always @(*) begin
         case (current_state)
           // Define output logic based on state
         endcase
     end
     ```

4. **Parameterized Modules**:
   - Use parameters to create reusable and configurable modules.
   - Example:
     ```verilog
     module example #(parameter WIDTH = 8) (
         input clk,
         input rst,
         // Other ports
     );
     ```

5. **Reset Logic**:
   - Ensure reset effectively initializes all necessary registers.
   - Example:
     ```verilog
     always @(posedge clk) begin
         if (reset) begin
             // Initialize registers
         end else begin
             // Normal operations
         end
     end
     ```

6. **Sensitivity Lists**:
   - Use `always @(*)` for combinational logic blocks to automatically capture any signal dependencies.

7. **Debouncing and Synchronization**:
   - Debounce mechanical switch inputs to remove noise.
   - Use multiple flip-flops for synchronizing asynchronous inputs to the clock domain.

By leveraging the above principles, best practices, and common patterns, another language model can be better equipped to generate efficient, reliable, and maintainable Verilog modules for various design tasks.

Task:
// The PS/2 mouse protocol sends messages that are three bytes long. However, within a continuous byte stream, it's not obvious where messages start and end. The only indication is that the first byte of each three byte message always has bit[3]=1 (but bit[3] of the other two bytes may be 1 or 0 depending on data).

// We want a finite state machine that will search for message boundaries when given an input byte stream. The algorithm we'll use is to discard bytes until we see one with bit[3]=1. We then assume that this is byte 1 of a message, and signal the receipt of a message once all 3 bytes have been received (done).

// The FSM should signal done in the cycle immediately after the third byte of each message was successfully received.

// Although in[7:0] is a byte, the FSM only has one input: in[3].
// You need ~4 states. Three states likely wouldn't work because one of them needs to assert done, and done is asserted for only one cycle for each received message.

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    // Insert your code below

    // State transition logic (combinational)

    // State flip-flops (sequential)
 
    // Output logic

endmodule