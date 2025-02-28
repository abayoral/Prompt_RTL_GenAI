
### Verilog Design: Knowledge Base

#### 1. Fundamental Concepts of Verilog
- **Verilog Hierarchy**: Modules, ports, instances, and nets
- **Data Types**: Wire, reg, integer, and parameter
- **Basic Constructs**: Always blocks, initial blocks, always_ff, always_comb
- **Operators**: Arithmetic, logical, equality, relational, and reduction

#### 2. Module Definition
- **Module Declaration**: `module module_name (port list); ... endmodule`
- **Ports**: Inputs, outputs, and inouts
  - **Naming Convention**: Clear and descriptive names
  - **Vector Ports**: `[N:0]` notation for multi-bit inputs/outputs

#### 3. Design Principles
- **Combinational Logic**:
  - Use `always @*` (or always_comb in SystemVerilog) for combinational logic
  - Avoid inferring latches: ensure all paths to output are defined
- **Sequential Logic**:
  - Use `always @(posedge clk or negedge rstn)` for synchronous logic
  - Proper reset handling
- **Finite State Machines (FSM)**:
  - Distinguish between state encoding: binary, Gray, one-hot

#### 4. Best Practices
- **Coding Style**:
  - Follow consistent indentation and naming conventions
  - Write modular and reusable code
- **Documentation**:
  - Comment your code: explain complex logic and design decisions
- **Testing and Simulation**:
  - Develop comprehensive testbenches
  - Use assertions and coverage tools to validate design
  
#### 5. Common Patterns
- **For Loops**:
  - Syntax: `for (initialization; condition; increment/decrement) begin ... end`
  - Used in both procedural (`always`) and declarative (`generate`) contexts
  
#### 6. Example Constructs (Not Actual Code)

1. **Always Block for Combinational Logic**:
   - `always @*` ensures all inputs changes trigger reevaluation.
     ```verilog
     always @* begin
         // combinational logic
     end
     ```
     
2. **For Loop Usage**:
   - Loop through vectors or parameterized values
     ```verilog
     integer i;
     for (i = 0; i < 100; i = i + 1) begin
         // logic inside for loop
     end
     ```
     
3. **Parameterization**:
   - Use parameters to make designs scalable
     ```verilog
     parameter WIDTH = 100;
     reg [WIDTH-1:0] vector;
     ```

#### 7. Hardware Design Considerations
- **Clock Domain**: Ensure proper synchronization across clock domains
- **Timing Analysis**: Consider setup, hold times, and clock skew
- **Resource Utilization**: Optimize for LUTs, FFs, and block RAMs in FPGAs
  
#### 8. Design Abstraction Levels
- **Behavioral**: Describe what the design does
- **RTL (Register-Transfer Level)**: Describe data flow between registers
- **Gate Level**: Detailed logic gates and connections (lower abstraction)
  
#### 9. Debugging Tips
- **Waveform Analysis**: Use simulation tools to visualize signal interactions
- **Assertions**: Embed checks within the code
  ```verilog
  assert (condition) else $error("Error message");
  ```

#### 10. Reversing a Bit Vector
- **Problem Domain**: Bit manipulation tasks commonly involve loops.
- **Reversal Pattern**:
  - Accessing individual bits from both ends and swapping
    ```verilog
    always @* begin
        for (i = 0; i < WIDTH; i = i + 1) begin
            out[i] = in[WIDTH - 1 - i];
        end
    end
    ```

---

This knowledge base provides a comprehensive understanding of the core concepts, best practices, and methodologies in Verilog that are applicable across various design tasks. It aims to support and enhance the capability of any language model or designer working in the context of Verilog module generation.

Task:
// Given a 100-bit input vector [99:0], reverse its bit ordering

// Hint: A for loop (in a combinational always block or generate block) would be useful here. 
// I would prefer a combinational always block in this case because module 
// instantiations (which require generate blocks) aren't needed.

module top_module( 
    input [99:0] in,
    output [99:0] out
);
	// Insert your code here
endmodule
