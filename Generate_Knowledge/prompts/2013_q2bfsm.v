
Background Knowledge:

1. Verilog HDL: Verilog is a hardware description language used to model electronic systems. It is predominantly used for logic synthesis and digital system design.

2. Verilog Modules: Modules are like building blocks in Verilog designs. A single Verilog design consists of many modules, and modules can also contain other lower-level modules.

3. Finite State Machines (FSMs): FSMs are critical components in digital logic. FSMs have an initial state and undergo transitions to other states as guided by a set of rules or conditions.

Principles:

1. Module Design: Verilog modules should be written with high cohesion and low coupling in mind. A single module should represent a single entity or function.

2. State Encoding: State representation is a vital aspect of FSMs in Verilog. Encoding technique (Binary, One-Hot, Grey Code, etc.) used in an FSM impacts area, speed, and power of the design.

3. Clock Sensitive Design: In Verilog, hardware description that relies on clock signals should be made synchronous. It ensures sequential order in design and operation.

4. Reset Mechanism: Verilog designs commonly incorporate a reset signal to initialize the state of the system or bring it back to its initial state.

Structured Information:

1. Use of Registers: In Verilog design, registers (reg) retain their value from one procedural statement to the next, making them ideal for storing and manipulating data.

2. Input and Output Variables: The 'input' and 'output' keywords in Verilog are used to define ports that are part of a module's interface. 

3. Edge-sensitive behavior: Certain operations, especially those related to FSMs, are sensitive to clock edges ('negedge' or 'posedge'). This property is critical for the maintenence of synchronous design.

4. Active Low Reset: Some systems use active-low resets ('resetn' in this case). This means the system will reset when the reset signal is at a 'low' level.

Best Practices:

1. Proper Commenting: A key to maintainability of the code is proper documentation through commenting.

2. Consistent Naming Conventions: Using a consistent naming scheme for variables, signals, and modules helps ensure clarity and understanding of the code.

3. Testbench Development: Testbenches are crucial in verifying the functionality of the design and should be designed carefully to cover all possible scenarios.

Common Patterns:

1. FSMs: The implementation of FSMs in Verilog is a common pattern, where combinations of sequential and combinational circuits express states and transitions.

2. Condition Monitoring: The common pattern of monitoring certain input conditions and setting outputs accordingly can be seen in most digital system designs. 

3. One-Hot Encoding: This is a commonly used state encoding method where each state is represented by a bit. This pattern is seen in FSMs with a larger number of states. 

4. Reset Mechanism: Reset mechanisms are very common in hardware designs to ensure the system starts from a known good state.

Task:
// you're a senior A Control Systems Engineer at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining my computer hardware company's reputation in the industry.

// Consider a finite state machine that is used to control some type of motor. The FSM has inputs x and y, which come from the motor, and produces outputs f and g, which control the motor. There is also a clock input called clk and a reset input called resetn.

// The FSM has to work as follows. As long as the reset input is asserted, the FSM stays in a beginning state, called state A. When the reset signal is de-asserted, then after the next clock edge the FSM has to set the output f to 1 for one clock cycle. Then, the FSM has to monitor the x input. When x has produced the values 1, 0, 1 in three successive clock cycles, then g should be set to 1 on the following clock cycle. While maintaining g = 1 the FSM has to monitor the y input. If y has the value 1 within at most two clock cycles, then the FSM should maintain g = 1 permanently (that is, until reset). But if y does not become 1 within two clock cycles, then the FSM should set g = 0 permanently (until reset).

// Implement the FSM

// Hint: The FSM does not begin to monitor the x input until the cycle after f is 1.

module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 

	// Insert your code here

endmodule

