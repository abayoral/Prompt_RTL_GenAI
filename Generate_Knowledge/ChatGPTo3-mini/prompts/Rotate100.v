
### Background Knowledge:

1. **Basics of Verilog**:
   - Verilog is a hardware description language used to model digital systems.
   - Modules are the basic building blocks of Verilog code.
   - The `always` block is used for describing sequential logic.
   - `reg` is used to declare storage elements, whereas `wire` is used for combinatorial logic.

2. **Registers and Configurations**:
   - In digital design, registers are used to store data.
   - Synchronous registers change their state only on the edge of the clock signal (either rising or falling).

3. **Rotation vs. Shifting**:
   - A **rotator** moves bits around in a circular fashion, where the bit shifted out from one end is shifted in from the other end.
   - A **shifter** typically shifts bits left or right, introducing zeros from one end.

4. **Control Signals (Enable and Load)**:
   - Control signals such as `load` and `ena` determine the operation mode of the register.
   - `load`: Directly loads the register with the provided data.
   - `ena[1:0]`: Controls whether to rotate bits (rotate right, rotate left, or not rotate).

5. **Bitwise Operations**:
   - Understanding bitwise operations is crucial (e.g., bitwise AND, OR, XOR).
   - Left shift (`<<`), right shift (`>>`), and concatenation (`{}`).

### Principles:

1. **Synchronous Operations**:
   - All state changes should occur on a clock edge.
   - Use non-blocking assignment (`<=`) inside `always @(posedge clk)` for sequential logic.

2. **Non-blocking vs. Blocking Assignments**:
   - Non-blocking (`<=`) is used in the `always` block for synchronous logic, ensuring the correct sequence of updates.
   - Blocking (`=`) is used in continuous assignments and combinational logic.

3. **Avoiding Race Conditions**:
   - Proper use of non-blocking assignments helps avoid race conditions and ensures predictable behavior.
   
4. **Efficiency in Design**:
   - Minimize the number of operations inside the `always` block.
   - Use case statements for clarity and readability when dealing with multiple conditional branches.

### Common Patterns in Verilog Design:

1. **Basic Clocked Register**:
   ```verilog
   always @(posedge clk) begin
       if (reset)
           q <= 0;
       else
           q <= d;
   end
   ```

2. **Conditional Loading**:
   ```verilog
   always @(posedge clk) begin
       if (load)
           q <= data;
       else
           // other operations
   end
   ```

3. **Case Statements for Control Signals**:
   ```verilog
   always @(posedge clk) begin
       case (ena)
           2'b01: // rotate right
           2'b10: // rotate left
           default: // no operation
       endcase
   end
   ```

### Structured Information:

1. **Module Definition**:
   - Define inputs (`clk`, `load`, `ena`, `data`) and outputs (`q`). Use `reg` for the output if it holds state.

2. **Detecting Edge and Conditions**:
   - Analyze `ena` and `load` within an `always` block triggered by `clk`.

3. **Bitwise Rotation**:
   - For right rotation: `q <= {q[0], q[99:1]}`.
   - For left rotation: `q <= {q[98:0], q[99]}`.

4. **Efficient State Transitions**:
   - Optimize the inner logic to minimize redundant checks.
   - Ensure the operations are sequential and conditionally executed based on signal states.

By understanding and applying these principles, concepts, and common patterns, a language model can be better equipped to generate robust, efficient, and clear Verilog code suitable for a variety of design tasks.

Task:
// Build a 100-bit left/right rotator, with synchronous load and left/right enable. A rotator shifts-in the shifted-out bit from the other end of the register, unlike a shifter that discards the shifted-out bit and shifts in a zero. If enabled, a rotator rotates the bits around and does not modify/discard them.

// load: Loads shift register with data[99:0] instead of rotating.
// ena[1:0]: Chooses whether and which direction to rotate.
// 2'b01 rotates right by one bit
// 2'b10 rotates left by one bit
// 2'b00 and 2'b11 do not rotate.
// q: The contents of the rotator.

module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    // Insert your code here

endmodule