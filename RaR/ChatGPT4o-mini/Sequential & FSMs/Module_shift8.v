As a senior Digital Design Engineer at a leading hardware design firm, you have been assigned an essential task that involves the creation of a specific Verilog module. This module is crucial not only for the overall functionality of a next-generation product but also for upholding the esteemed reputation of your computer hardware company within a competitive industry. 

Your focus is directed towards a specific module, referred to as `my_dff8`, which has been defined to include two inputs and one output, serving the purpose of implementing a set of 8 D flip-flops. To fulfill your design requirements, you are expected to instantiate three of these `my_dff8` modules. Moreover, your objective is to connect these three instances in such a manner that they collectively function as a shift register capable of handling 8 bits and extending over a length of 3. 

Furthermore, there is a critical requirement to develop a 4-to-1 multiplexer, which has not been provided in this assignment. This multiplexer should be designed to selectively route the output based on a two-bit selector input, `sel[1:0]`. The behavior of the multiplexer should be such that it outputs the value present at the input `d`, or the value at the output of the first, second, or third D flip-flop respectively. Essentially, the `sel` input determines the extent of delay applied to the input signal `d`, allowing for a configurable delay ranging from zero up to three clock cycles.

Your task, therefore, is to implement this functionality within the framework provided in the given module. The following module serves as your starting point:

```verilog
module my_dff8 ( input clk, input [7:0] d, output [7:0] q );
```

From this point, you will need to proceed with the design of the `top_module`, which encapsulates the inputs, outputs, and any structural implementation necessary to realize the intended system behavior. The module prototype is presented as follows:

```verilog
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
```

In this context, please provide clarity on how you would approach the implementation of the design, considering factors such as the instantiation of the `my_dff8` modules, the chaining procedure to form the shift register, and the construction of the multiplexer to fulfill the specified operational requirements. It would also be insightful to understand the design considerations you would take into account to ensure optimal functionality and performance in your implementation.