
### Background Knowledge
Understanding the fundamentals of Verilog design and the underlying hardware concepts is crucial for generating effective Verilog modules. Here are some key background elements:

1. **Hardware Description Language (HDL):** Verilog is an HDL used for modeling electronic systems. It enables designers to describe the structure and behavior of digital circuits.

2. **Clock Signals:** Most digital circuits use clock signals to synchronize operations. Verilog supports edge-triggered events, typically on the positive (posedge) or negative edge (negedge) of clock signals.

3. **Flip-Flops:** Flip-flops are basic memory storage elements that capture and store binary data. Common types of flip-flops include D flip-flops, T flip-flops, JK flip-flops, and SR flip-flops.

4. **Sensitivity Lists:** Verilog always blocks use sensitivity lists to determine when the block should execute. These lists can include clock edges (posedge, negedge) and other signals.

5. **FPGA Limitations:** Field-Programmable Gate Arrays (FPGAs) have specific hardware constraints. For example, FPGAs typically do not support dual-edge triggered flip-flops. Instead, designers can simulate dual-edge behavior using various design techniques.

### Principles and Best Practices

1. **Modularity:** Break down designs into reusable and manageable modules. This improves readability and maintainability.

2. **Clear Signal Naming:** Use descriptive names for signals and variables to make the code more understandable.

3. **Clock Domain Management:** Be cautious of different clock domains and the potential for metastability. Use proper synchronization techniques.

4. **Parameterization:** Use Verilog parameters to make modules more flexible and adaptable to different design requirements.

5. **Testbenches:** Always accompany design modules with testbenches to verify functionality and correctness through simulation.

6. **Avoiding Latches:** Be careful with the use of inferred latches, as they can lead to unintended behavior. Ensuring proper use of conditional statements in always blocks can help avoid this.

7. **Non-blocking vs Blocking Assignments:**
   - Use non-blocking assignments (`<=`) in sequential (`always @ (posedge clk)`) blocks.
   - Use blocking assignments (`=`) in combinational (`always @ (*)`) blocks.

### Common Verilog Design Patterns

1. **Edge Detection:**
   - Detect transitions on signals using `posedge` and `negedge`.

2. **Debouncing:**
   - Handling mechanical switch noise by filtering out spurious transitions.

3. **Synchronization:**
   - Cross clock domains safely using synchronizer flip-flops.

4. **Shift Registers:**
   - Used for serial-to-parallel or parallel-to-serial data conversion.

5. **Finite State Machines (FSM):**
   - Model complex control logic using state diagrams and corresponding Verilog code.

6. **Counters:**
   - Count events, often used for timing and control purposes.

7. **Multiplexers and Demultiplexers:**
   - Route signals based on select lines.

### Structured Information for Verilog Design

1. **Module Definition:**
   - Start with `module [name] ([port_list]);` and end with `endmodule`.
   
2. **Port Declaration:**
   - Specify input, output, and inout ports with their bit-widths.

3. **Data Types:**
   - Common types include `reg`, `wire`, `integer`, and `parameter`.

4. **Always Blocks:**
   - Used for sequential and combinational logic.
   - Sequential Block: `always @(posedge clk or negedge rst)`
   - Combinational Block: `always @(*)`

5. **Initial Blocks:**
   - Used for simulation purposes, not synthesizable.

6. **Continuous Assignments:**
   - Use `assign` for simple combinational logic.

7. **Control Structures:**
   - If-Else: Conditional logic.
   - Case: Multipath branch logic.

8. **Instantiate Modules:**
   - Integrate sub-modules using instantiation.

### Applying Knowledge to Design Tasks

1. **Dual-Edge Triggered Flip-Flop Emulation:**
   - Use both positive and negative edge triggered flip-flops to capture data.
   - Combine the outputs of these separate flip-flops to functionally emulate dual-edge triggering.

2. **Synchronizer for Cross-Clock Domains:**
   - Chain of two or more flip-flops to ensure safe data transfer between different clock domains.

3. **Synthesizable Constructs:**
   - Stick to constructs supported by synthesis tools, like `case`, `if-else`, and `always` blocks.

By integrating these principles, structured information, and common patterns, a language model tasked with generating Verilog modules would have a robust foundation to create effective and accurate Verilog designs.

Task:
// You're familiar with flip-flops that are triggered on the positive edge of the clock, or negative edge of the clock. A dual-edge triggered flip-flop is triggered on both edges of the clock. However, FPGAs don't have dual-edge triggered flip-flops, and always @(posedge clk or negedge clk) is not accepted as a legal sensitivity list.

// Build a circuit that functionally behaves like a dual-edge triggered flip-flop

// Hint: You can't create a dual-edge triggered flip-flop on an FPGA. But you can create both positive-edge triggered and negative-edge triggered flip-flops.
// This problem is a moderately difficult circuit design problem, but requires only basic Verilog language features. (This is a circuit design problem, not a coding problem.) It may help to first sketch a circuit by hand before attempting to code it.

module top_module (
    input clk,
    input d,
    output q
);

	// Insert your code here

endmodule