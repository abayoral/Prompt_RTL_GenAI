
Background Knowledge:
1. Verilog is a hardware description language (HDL) used in digital design and FPGA programming. It allows designers to design at various levels of abstraction.
2. It supports various data types such as regs, wires, integers, and real. The "reg" keyword is used to declare a register, for something that can hold a value across clock cycles. The "wire" keyword is used for nets, or connections between devices.
3. In Verilog, modules can be viewed as black boxes with their inputs and outputs. These inputs and outputs can be a single bit, multiple bits (bus), or no bits at all.
4. Verilog has various operator types including; Logic, Bit-Wise, Reduction, Shift, Concatenation, Arithmetic, Relational, Equality and Conditional Operators.

Principles:
1. Always try to keep the design modular. This allows for better readability, testing, and reusability. Reusability is particularly useful as it creates an opportunity to build a library of general-purpose modules that can be used in future designs.
2. Although, in many cases, synthesis tools can infer latches and flip-flops from "always" blocks, it is generally a better practice to use sequential and combinatorial "always" blocks for more clear and intuitive descriptions.
3. Use blocking assignments when the ordering is important; such as for assigning value to variables within the same 'always' block. Use non-blocking assignments when ordering does not matter, such as for assigning to registers or flip-flops. It ensures that all right-hand side (RHS) expressions are evaluated before any changes are made on the left-hand side (LHS).

Structured Information:
1. Module Structure: Each Verilog module has a defined structure, including a name, list of port declarations (input, output, inout), port direction (input, output, inout), and port type (wire, reg).
2. Combinational Logic: It includes logic that is not dependent on clock signals or past states. It is defined with an "assign" keyword in Verilog.
3. Sequential Logic: Logic that is dependent on clock signals and past states. It is defined within "always" blocks in Verilog. There are two types of "always" blocks, combinational and sequential, distinguished by their sensitivity list.
4. Testbenches: A Verilog Testbench is used for applying stimulus to the Design Under Test. It is essential for debugging and verification.
5. Synthesis: Synthesis is the process of converting a Verilog program into a digital circuit. It does this by transforming high-level descriptions of design objectives into detailed, manufacturable layouts. 

Best Practices:
1. Always initialize variables and states.
2. Avoid inferring latches unintentionally as they can cause unwanted behavior that can be hard to debug.
3. Make sure the code is synthesizable; certain Verilog constructs are allowed in simulation languages that are not synthesizable.
4. Always use a default case in switch statements to catch unidentified values or states.
5. Never use real and shortreal datatypes for synthesis. Simulation tools support these datatypes, but synthesis tools usually do not.

Task:
// you're a senior Digital Design Engineer at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining the company's reputation in the industry.

// Build a priority encoder for 8-bit inputs. Given an 8-bit vector, 
// the output should report the first (least significant) bit in the vector that is 1. 
// Report zero if the input vector has no bits that are high. 
// For example, the input 8'b10010000 should output 3'd4, because bit[4] is first bit that is high.

// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );

    // Insert your code here

endmodule
