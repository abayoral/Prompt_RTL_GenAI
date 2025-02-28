
### Comprehensive Knowledge Base for Verilog Design

#### 1. Background Information on Verilog
- **HDL (Hardware Description Language):** Used to describe the structure and behavior of electronic circuits.
- **Verilog:** One of the most widely used hardware description languages, alongside VHDL.
- **Modules:** Fundamental building blocks in Verilog, defining the hardware’s interface and functionality.

#### 2. Core Concepts in Verilog
- **Data Types:**
  - `wire:` Used for combinational logic.
  - `reg:` Holds value over time, used in procedural blocks.
  - `integer, real:` Used in testbenches, not synthesisable.
  
- **Ports:**
  - `input:` Declares input ports.
  - `output:` Declares output ports.
  - `inout:` Declares bidirectional ports.
  
- **Operators:**
  - **Logical Operators:** `!`, `&&`, `||`
  - **Arithmetical Operators:** `+`, `-`, `*`, `/`, `%`
  - **Bitwise Operators:** `~`, `&`, `|`, `^`, `^~` (XNOR)

- **Two Types of Modeling:**
  - **Structural Modeling:** Describes the actual interconnection of the hardware.
  - **Behavioral Modeling:** Describes the behavior of the system.

- **Vectors:** Used to handle multiple bits. `[msb:lsb]` format (e.g., `wire [2:0] my_vector;`).

#### 3. Principles and Best Practices
- **Clarity and Readability:**
  - Use meaningful names for signals, variables, and modules.
  - Comment your code effectively to describe the logic and purposes of each section.
  
- **Modular Design:**
  - Break down large designs into smaller, reusable modules.
  - Use hierarchy effectively to encapsulate functionality.

- **Avoiding Common Pitfalls:**
  - Ensure no conflicting drivers for signals.
  - Properly initialize variables/registers in procedural blocks.

- **Synchronous Design:**
  - Use always blocks for sequential logic with clocked processes.
  - Ensure reset conditions are handled correctly.

- **Combinational Logic:**
  - Use continuous assignment (`assign`) for combinational logic.
  - Avoid latches by ensuring all conditions are covered in always blocks.

- **Parameterization:**
  - Utilize parameters to create versatile and reusable modules.
  - Specify default values for parameters to enhance module flexibility.

#### 4. Common Patterns
- **Continuous Assignment:**
  - Utilized for straightforward signal assignments: `assign out = in;`
  
- **Instantiation:**
  - Modules can be instantiated within other modules to build hierarchical designs.

- **Conditional Logic:**
  - `assign y = (sel) ? a : b;` for simple conditional assignments.

- **For Loops in Initial/Always Blocks:**
  - Used for repetitive tasks in behavioral modeling: `for (i = 0; i < N; i = i + 1)`

- **Case Statements:**
  - Handle multiway branching in procedural blocks: 
    ```verilog
    case (signal)
      2'b00: out = 1;
      2'b01: out = 0;
      ...
    endcase
    ```

- **Initial Block:** 
  - Often used in testbenches for initializing signals: 
    ```verilog
    initial begin
      a = 0;
      b = 1;
    end
    ```

#### 5. Implementing Specificity
- **Splitting Vectors:**
  - Assign elements of a vector to individual bits: `assign out0 = vec[0];`
  - Directly map vectors to other vectors for propagation: `assign outv = vec;`

### Summary
This knowledge base provides fundamental concepts, best practices, and common patterns that are applicable across various Verilog design tasks. Understanding these principles will enable designers to create more efficient, readable, and maintainable Verilog code.

Task:
//Build a circuit that has one 3-bit input, then outputs the same vector, 
// and also splits it into three separate 1-bit outputs. 
// Connect output o0 to the input vector's position 0, o1 to position 1, etc.

module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration

// Insert your code here

endmodule
