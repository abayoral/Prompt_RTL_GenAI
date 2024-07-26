
Background Knowledge:

1. Verilog is a hardware description language used to model digital circuits.
2. The structure of a Verilog program consists of a series of modules - named blocks of code that represent discrete hardware components.
3. Each module has a known set of inputs and outputs, which are defined in the module declaration.
4. Modules can be instantiated within other modules, allowing for more complex and hierarchical design structures.
5. Data types like wire and reg are used to represent signals and storage devices, respectively.
6. Operations in Verilog are concurrent, meaning they occur simultaneously rather than sequentially.
7. A Full-Adder is a type of digital circuit that performs addition of two bits along with an input carry.

Principles:

1. Keep modules small and manageable for easier testing and debugging.
2. Use descriptive names for modules, inputs, outputs and internal variables.
3. Use parameterized modules for reusability.
4. Always initialize registers and sensitive variables to avoid unpredictable behavior.
5. Make use of internal signals and variables for complex logic to keep the code readable and scalable.
6. When designing, consider propagation delay to achieve desired performance.

Structured Information:

1. Declaration: The name of the module should be followed by the list of input and output ports.
2. Signal Representation: 1-bit signal is represented as 'input' or 'output'. Multi-bit signals are represented as 'input [n-1:0]' and 'output [n-1:0]', where n is the width of the signal.
3. Variable Initialization: In most cases, 'reg' is used to represent state variables and data that are changed in an 'always@' block. The 'wire' data type represents data that are purely driven by continuous assignments or ports of a gate or module instantiation.
4. Addition: Binary full-adder can be formed by instantiating a predefined full-adder module or with bitwise operators.
5. Port Mapping: It's crucial for connecting signals between instantiations of modules.
6. Testing: Write testbenches to simulate each of your modules. This can validate the design and help to find bugs.
7. Debugging: Use $monitor and $display system tasks to print variable's values at certain points in time.
8. Encapsulation: Each piece of hardware (like an adder, multiplier, flip-flop, etc.) should be encapsulated in its own module.
9. Hierarchical Design: A complex digital system can be separated into several small pieces/modules which are manageable.
10. Coding style: Consistent coding style can enhance code readability and maintainability. It includes indentation, spacing, placement of braces, naming conventions, etc.
11. Comments: Proper comments will improve code readability and maintainability.

Task:
// you're a senior  Microarchitecture Engineer at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining the company's reputation in the industry.

// Make 3 instances of full-adder to create a 3-bit binary ripple-carry adder. 
// The adder adds two 3-bit numbers and a carry-in to produce a 3-bit sum and carry out. 
// To encourage you to actually instantiate full adders, also output the carry-out from 
// each full adder in the ripple-carry adder. cout[2] is the final carry-out from the last 
// full adder, and is the carry-out you usually see.

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    // Insert your code here

endmodule


