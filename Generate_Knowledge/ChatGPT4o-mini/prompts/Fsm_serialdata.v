
### Background Knowledge for Verilog Design

#### Verilog Basics

1. **Modules**: The primary building blocks in Verilog, encapsulating functionality.
    - Defined using `module` and `endmodule`.
    - Consist of ports (inputs, outputs, inouts) to interface with other modules.
   
2. **Data Types**: 
    - `wire`: Represents combinational logic.
    - `reg`: Stores values and represents sequential logic.
    - `integer`, `real`, `time`, etc.

3. **Operators**:
    - Arithmetic: `+`, `-`, `*`, `/`, `%`
    - Logical: `&&`, `||`, `!`
    - Bitwise: `&`, `|`, `^`, `~`
    - Relational: `==`, `!=`, `>`, `<`, `>=`, `<=`
    - Shift: `<<`, `>>`

4. **Always Blocks**:
    - `always @ (sensitivity list) begin ... end`
    - `always @ (*)` for combinational logic
    - `always @ (posedge clk or negedge reset)` for sequential logic

5. **Assign Statements**: 
    - Continuous assignments using `assign` keyword for combinational logic.

6. **Finite State Machines (FSM)**:
    - Consist of states, transitions, and output logic.
    - `always @ (posedge clk or posedge reset)` for state transitions.
    - `always @ (*)` for next-state logic.

#### Design Principles

1. **Modular Design**
    - Break down functionality into smaller, reusable modules.
    - Each module should have a single responsibility.

2. **Descriptive Naming**
    - Use meaningful names for modules, ports, and signals.
   
3. **Synchronous Design**
    - Prefer synchronous resets and clocks for robust designs.
    - Avoid latch inference by fully specifying outputs within always blocks.

4. **Clock Enable Signals**
    - Use `clk_enable` signals for conditional logic:
      `if (clk_enable) begin ... end`.

5. **Parameterization**
    - Use parameters to make modules configurable and reusable.
      ```verilog
      parameter WIDTH = 8;
      ```

6. **Simulation and Testing**
    - Thoroughly simulate designs using testbenches.
    - Use assertions and coverage to ensure correctness.

#### Common Patterns in Verilog Design

1. **Shift Registers**
    - Commonly used to serially shift data:
      ```verilog
      reg [7:0] shift_reg;
      always @ (posedge clk) begin
        shift_reg <= {shift_reg[6:0], in};
      end
      ```

2. **State Machines**
    - Basic template for FSM:
      ```verilog
      typedef enum reg [1:0] {IDLE, START, DATA, STOP} state_t;
      state_t current_state, next_state;
      always @ (posedge clk or posedge reset) begin
        if (reset)
          current_state <= IDLE;
        else
          current_state <= next_state;
      end
      ```

3. **Debouncers**
    - Filter mechanical/contact noise:
      ```verilog
      reg [2:0] shift_reg;
      always @ (posedge clk) begin
        shift_reg <= {shift_reg[1:0], button};
        debounced <= (shift_reg == 3'b111);
      end
      ```

4. **Clock Dividers**
    - Reduce clock frequency for slow peripherals:
      ```verilog
      reg [15:0] counter;
      always @ (posedge clk) begin
        if (counter == 0) begin
          clk_div <= ~clk_div;
          counter <= DIVISOR - 1;
        end else begin
          counter <= counter - 1;
        end
      end
      ```

#### Best Practices

1. **Use Blocking Assignments for Combinational Logic**:
    - Use `=` for assignments in always blocks intended for combinational logic to avoid unintended latches.
      ```verilog
      always @ (*) begin
        result = a + b;
      end
      ```

2. **Use Non-blocking Assignments for Sequential Logic**:
    - Use `<=` for assignments in always blocks triggered by clock edges.
      ```verilog
      always @ (posedge clk) begin
        reg_a <= a;
      end
      ```

3. **Avoid Mixed-Sensitivity List Always Blocks**:
    - Ensure that each always block has a clear purpose and doesn't mix combinational and sequential logic.

4. **Reset Handling**:
    - Ensure resets are handled explicitly, typically synchronously to avoid metastability issues.
      ```verilog
      always @ (posedge clk or posedge reset) begin
        if (reset)
          reg_a <= 0;
        else
          reg_a <= new_value;
      end
      ```

5. **Resource Sharing**:
    - Share resources like adders or multipliers when possible to reduce hardware utilization.

6. **Minimize Logic Levels**:
    - Keep the combinational path within always blocks short to achieve higher operating frequencies.

7. **Code Readability**:
    - Use proper indentation, comments, and modularization for maintaining readability and manageability of the codebase.

By adhering to these principles and practices, one can ensure that the design is robust, efficient, and easier to verify/debug. This foundational knowledge is integral to crafting reliable Verilog modules for a variety of applications.

Task:
// Assume you have a finite state machine that will identify when bytes have been correctly received when given a stream of bits. It needs to identify the start bit, wait for all 8 data bits, then verify that the stop bit was correct. If the stop bit does not appear when expected, the FSM must wait until it finds a stop bit before attempting to receive the next byte.
// Now that you have a finite state machine that can identify when bytes are correctly received in a serial bitstream, add a datapath that will output the correctly-received data byte. out_byte needs to be valid when done is 1, and is don't-care otherwise.

// Note that the serial protocol sends the least significant bit first.

// Hint: The serial bitstream needs to be shifted in one bit at a time, then read out in parallel.


module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

	// Insert your code below
	
    // Use FSM from Fsm_serial

    // New: Datapath to latch input bits.

endmodule
