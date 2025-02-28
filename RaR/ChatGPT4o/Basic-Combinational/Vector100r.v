Imagine you are a senior Digital Design Engineer at a prominent hardware design company known for its cutting-edge technology products. You have been entrusted with a critical task to develop a Verilog module that is essential for a revolutionary next-generation product. The success of this module is crucial not only for the performance of the product itself but also for safeguarding your company's reputation as an industry leader in computer hardware innovation.

The challenge ahead involves a 100-bit input vector labeled as [99:0] in Verilog notation. Your objective is to create a module that takes this input vector and systematically reverses the order of its bits to produce an output vector. This means that the least significant bit of the input should become the most significant bit of the output and vice versa, continuing this swap for each pair of corresponding bits in the input and output.

Consider utilizing a for loop within a combinational always block to achieve this bit-reversal functionality efficiently. This approach is preferred over using a generate block with module instantiations, as the latter is unnecessary for this specific operation. 

The module you need to design is defined with a basic structure, where you have the placeholder for inserting your code. Here is the skeleton of the module you are tasked to complete:

```verilog
module top_module( 
    input [99:0] in,
    output [99:0] out
);
    // Insert your code here
endmodule
```

As you proceed, keep in mind the significance of this module to the broader development efforts and the impact it could have on product launch timelines and company prestige.