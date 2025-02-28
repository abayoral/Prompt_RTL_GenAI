The 7400-series integrated circuits are well-known digital chips that each contain a few basic logic gates. Specifically, the 7420 chip includes two separate 4-input NAND gates. In this task, you are required to design a module in Verilog that replicates the exact functionality of the 7420 chip. This module should have eight input pins and two output pins. 

The inputs are labeled as follows:
- p1a, p1b, p1c, p1d: These are the four inputs for the first 4-input NAND gate.
- p2a, p2b, p2c, p2d: These are the four inputs for the second 4-input NAND gate.

The outputs are labeled:
- p1y: The output of the first 4-input NAND gate, which processes inputs p1a through p1d.
- p2y: The output of the second 4-input NAND gate, which processes inputs p2a through p2d.

Your task is to implement the logic that drives the signals p1y and p2y such that they reflect the output of the 4-input NAND gates constructed from the respective groups of inputs.

Here's the module template that you need to complete:

```verilog
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    // Insert your code here

endmodule
```

In your implementation, you need to define the logic inside the module to correctly calculate the outputs p1y and p2y based on the NAND operation applied to the input sets (p1a, p1b, p1c, p1d) and (p2a, p2b, p2c, p2d) respectively. Make sure to keep the functionality consistent with a 4-input NAND gate for each output.