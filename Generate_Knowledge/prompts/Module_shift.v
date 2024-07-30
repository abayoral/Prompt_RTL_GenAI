
## Background Knowledge on Verilog

### Basic Concepts

1. **Modules**: In Verilog, a module is a block of hardware. A module can represent a component at different levels of abstraction - from gate level to a full system.
   
2. **Inputs and Outputs**: Modules have input and output ports used for interconnecting them. Inputs are signals that read data, and outputs are signals that send data out.

3. **D Flip-Flop (DFF)**: A D flip-flop is a basic sequential circuit element used to store one bit of data. It typically has a clock input `clk`, a data input `d`, and an output `q`.

### Principles of Verilog Design

1. **Hierarchical Structuring**: Verilog allows encapsulating components within modules and then instantiating these modules within other modules to build complex designs hierarchically.

2. **Instantiation**: This is the process of creating instances of a module within another module. Through instantiation, complex designs can be broken down into smaller, manageable, and reusable components.

3. **Clock Signaling**: Often, modules share the same clock signal, which synchronizes operations across the system. This is crucial for synchronous designs like flip-flops and shift registers.

### Best Practices

1. **Consistent Naming**: Use a consistent naming convention for module instances, signals, and ports to improve readability and maintainability.

2. **Comments and Documentation**: Provide comments to describe the purpose of modules, signals, and instantiation of components to enhance the clarity of the design.
   
3. **Parameterization**: Implement modules with parameters for size or bit-widths to make them flexible and reusable.

4. **Modularization**: Break down complex designs into smaller sub-modules. This promotes the reuse of code and makes debugging easier.

### Common Patterns in Verilog Design

1. **Shift Register**: A shift register is a sequential circuit used for shifting data through multiple stages. Each stage can be implemented using D flip-flops.

2. **Interconnection of Modules**: Direct instantiation of smaller modules and interconnection of their signals form the basis of hierarchical designs in Verilog.

3. **Synchronous Logic Design**: Use the clock signal (`clk`) for synchronization. All synchronous elements (like D flip-flops) should use the same clock edge (rising or falling).

4. **Sequential and Combinational Logic Separation**: Clearly separate combinational logic (logic that computes outputs purely from current inputs) from sequential logic (logic that depends on previous inputs, typically involving clocked elements like flip-flops).

## Structured Information

### Flip-Flops and Registers

**D Flip-Flop Characteristics**
- Inputs: Clock (`clk`), Data (`d`)
- Output: Q (`q`)
- Behavior: On the rising edge of `clk`, `q` takes the value of `d`.

**Shift Register Characteristics**
- Composed of a chain of D flip-flops.
- Each flip-flop’s `q` output is connected to the next flip-flop’s `d` input.
- Used for data storage and transfer, signal delay, and synchronization.

### Shift Register Design Steps

1. **Module Declaration**: Define the shift register module with appropriate input and output ports.

2. **Instantiation of D Flip-Flops**: Instantiate the D flip-flop module multiple times within the shift register module.

3. **Interconnection**: Connect the `q` output of one D flip-flop to the `d` input of the next, forming a chain.

4. **Clock Distribution**: Ensure that the same `clk` signal is connected to all the D flip-flops for synchronized shifting.

5. **Output Signal**: The output of the last D flip-flop in the chain will be the output of the shift register.

By following these principles, best practices, and structured information, the language model will be equipped to generate efficient and accurate Verilog modules for various digital design tasks, including complex hierarchical designs and reusable components.

Task:
// You are given a module my_dff with two inputs and one output (that implements a D flip-flop). 
// Instantiate three of them, then chain them together to make a shift register of length 3. 
// The clk port needs to be connected to all instances.

// The module provided to you is: 

module my_dff ( input clk, input d, output q );


module top_module ( input clk, input d, output q );
	//Insert your code here
endmodule
