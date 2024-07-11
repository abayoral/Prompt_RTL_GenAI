
Background Knowledge:
1. Verilog: It's a hardware description language (HDL) used to model electronic systems and design digital circuitry. 
2. System-on-Chip (SoC): A system on a chip or system on chip (SoC) is an integrated circuit that integrates all components of a computer or other system into a single chip.
3. Modularity: Verilog supports the modular design of systems. This means a large system can be broken down into smaller, more manageable modules or components. This allows for easier design, testing, and maintenance.
4. Verilog Logic Levels: Verilog supports four logic levels - 0 (Logic 0), 1 (Logic 1), X (unknown logic value), and Z (high impedance state).

Principles:
1. Hierarchy: Verilog is a hierarchical language. This means the design can be visualized as a tree of modules. The top module is the root of the tree and the branches and leaves are the lower-level modules.
2. Encapsulation: Encapsulation means that the internal details of a module are hidden from other modules. Only the interface (inputs and outputs) is visible to other modules.
3. Sequential and Combinatorial logic: Two fundamental types of logic are supported in Verilog: sequential and combinatorial. Sequential logic has memory and depends on both the current inputs and previous states. Combinatorial logic is only dependent on current inputs.

Structured Information:
1. Verilog constructs: Commonly used Verilog constructs include modules, data types (wires, regs), procedural blocks (always, initial), control statements (if, case), loops (for, while), system tasks and functions.
2. Timing Control: # is used for specifying delay in Verilog.
3. Clock signals: are used to sequence the processing of data in synchronous circuits.
4. Reset signals: are used to place a circuit in a known state, either at power up or during operation. 
5. Active-high or active-low reset: An active-high reset means the reset is activated when it is at a high level. An active-low reset means the reset is activated when it is at a low level.
6. Binary Coded Decimal (BCD): A coding method where each decimal digit from 0 to 9 is represented by a group of four binary digits.

Best Practices:
1. Use descriptive names: Make sure to properly name all inputs, outputs, and intermediate signals to improve readability and ease of debugging.
2. Divide and conquer: Break a complex design into smaller, more manageable modules and sub-modules. This allows easier testing, validation, and maintenance.
3. Logical separation: Try to logically separate different functional parts of the design.
4. Follow coding conventions: To write clean and simple code, it is advised to follow some standardized coding conventions. For example, consistently use all caps for names of constants and use underscores to separate words in signal names. 
5. Comment frequently: Adequate and clear comments are important in Verilog designs for ease of understanding and maintenance. 
6. Avoidance of syntax errors: Check for common syntax errors or mistakes such as missing semicolons, parentheses, and incorrect variable names.
7. Signal Initialization: Uninitialized signals may lead to unintended behavior due to undefined states.

Common Patterns:
1. state machine design pattern, where a state register feeds into combinational logic that determines the next state.
2. the shift register pattern, where each bit in a multiple bit signal moves down the line in each clock cycle.
3. Counters: a typical pattern in digital design, which are often used to create time delays or to sequence events.
4. Mux/Demux: Multiplexers and Demultiplexers are devices that can combine multiple inputs into a single line (multiplexer) or break a single input into multiple outputs (demultiplexer).
5. Encoders and Decoders: Patterns also include encoding and decoding information.

Task:
// you're a senior System-on-Chip (SoC) Design Engineer at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining the company's reputation in the industry.

// Build a 4-digit BCD (binary-coded decimal) counter. Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit, q[7:4] is the tens digit, etc. For digits [3:1], also output an enable signal indicating when each of the upper three digits should be incremented.

// You may want to instantiate or modify some one-digit decade counters.

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    // Insert your code here

endmodule
