
### Background Knowledge and Principles for Generating Verilog Modules

#### 1. Verilog Basics
- **Modules and Ports**: Modules are the fundamental building blocks in Verilog, encapsulating a specific piece of hardware design. Ports (input, output, inout) are the interface through which data flows in and out.
- **Data Types**: Basic data types include `wire` and `reg`. `wire` is used for continuous assignments, while `reg` is used for storage in procedural blocks.
- **Continuous Assignment**: Statements using the `assign` keyword are continuously executed and updated in real-time as inputs change.

#### 2. Digital Design Principles
- **Combinational Logic**: Designs without memory elements, where outputs depend solely on current inputs.
- **Sequential Logic**: Incorporates storage elements (like flip-flops), and outputs depend on both current inputs and historical states.
- **Hierarchical Design**: Breaking down complex designs into smaller, reusable modules.

#### 3. Boolean Algebra and Logic Gates
- **AND, OR, NOT**: Basic logic gates for combining signals (`&`, `|`, `~` respectively in Verilog).
- **NAND, NOR, XOR**: Derived gates for more complex functions (e.g., `~&`, `~|`, `^` respectively).
- **De Morgan’s Laws**: Facilitates simplification and optimization of logic expressions.

#### 4. Best Practices in Verilog Design
- **Clear Module Interface Definition**: Clearly define input and output ports, making module reuse easier.
- **Code Modularity**: Encapsulate functionalities in smaller, coherent modules.
- **Use of Parameters**: For creating configurable and reusable modules.
- **Synchronous Design**: When dealing with sequential logic, synchronize operations to a clock to avoid timing issues.
- **Simulation**: Thoroughly simulate designs to verify functionality before synthesis.
- **Documentation and Comments**: Adding comments to explain complex logic for future maintainability.

#### 5. Common Verilog Design Patterns
- **Decoders and Encoders**: Convert binary information from one form to another (e.g., n-bit input to 2^n outputs for decoders).
- **Multiplexers**: Select one signal out of many inputs based on select lines (`assign Y = sel ? A : B;`).
- **Demultiplexers**: Distribute a single input to one of many outputs based on select lines.
- **Flip-Flops and Registers**: Common structures for storing state information synchronously.
- **Finite State Machines (FSMs)**: Modeling both combinational logic (for state transitions) and sequential logic (for state memory).

#### 6. Design Approach for Problem Solving
- **Reverse Engineering from Outputs to Inputs**: As suggested, start from the output requirements and work back to determine required inputs and conditions.
- **Use of Conditional Assignments**: Leverage conditional statements to define complex output behaviors (e.g., using `assign`).

#### 7. Common Constructive Logic Constructs
- **Conditional Expressions (`? :`)**: Simplifies readability and implementation of conditional assignments.
- **Bitwise Operations**: For direct manipulation of signals.
- **Logical Operations**: Leveraging logical conditions to determine states.

Given this comprehensive knowledge base, another language model can use the principles and best practices outlined above to generate robust and efficient Verilog modules for various design tasks in digital circuits. This approach ensures adherence to good design principles, leading to reliable and maintainable hardware designs.


Task:
// Suppose you are designing a circuit to control a cellphone's ringer and vibration motor. 
// Whenever the phone needs to ring from an incoming call (input ring), your circuit must either 
// turn on the ringer (output ringer = 1) or the motor (output motor = 1), but not both. 
// If the phone is in vibrate mode (input vibrate_mode = 1), turn on the motor. Otherwise, turn on the ringer.

// Try to use only assign statements, to see whether you can translate a problem description into a collection of logic gates.

// Design hint: When designing circuits, one often has to think of the problem "backwards", 
// starting from the outputs then working backwards towards the inputs. This is often the opposite 
// of how one would think about a (sequential, imperative) programming problem, where one would look 
// at the inputs first then decide on an action (or output). For sequential programs, one would 
// often think "If (inputs are ___ ) then (output should be ___ )". On the other hand, hardware 
// designers often think "The (output should be ___ ) when (inputs are ___ )".
// For this particular problem, one should be thinking "The motor is on when ___", rather than "If (vibrate mode) then ___".

module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

	// Insert your code here

endmodule


