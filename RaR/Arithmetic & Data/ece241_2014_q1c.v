As a senior Digital Design Engineer at a leading hardware design company, you're currently engaged in a pivotal project that requires the development of a sophisticated Verilog module. This specific module is crucial for a next-generation product, and its successful implementation is essential for sustaining and enhancing your company's reputation in the competitive computer hardware industry.

Your task involves handling two 8-bit numbers, each represented in 2's complement format: `a[7:0]` and `b[7:0]`. Your objective is to add these two numbers together and produce an 8-bit result `s[7:0]`. In conjunction with this primary operation, the module must also determine if a signed overflow has occurred during the addition process. 

A signed overflow manifests under specific conditions: when the sum of two positive integers unexpectedly results in a negative integer, or conversely, when the sum of two negative integers yields a positive integer. Recognizing this overflow involves analyzing the signs of both the input and output numbers, and there are multiple strategies available for its detection. These strategies might include checking the sign bits before and after the arithmetic operation, or evaluating the carry-out between specific bits (notably, bits 6 and 7) during the summation process.

You are tasked with designing this module by defining its inputs, outputs, and necessary internal logic in Verilog. This will involve creating a template for the module that specifies the given inputs `a` and `b`, the resultant sum `s`, and the overflow flag. Following the template, the core of your task will involve filling in the logic to correctly compute the sum and robustly detect any signed overflow condition.

Below is the skeleton structure for the module, to which you need to add the appropriate logic:

```verilog
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
    // Insert your code below
    // assign s = ...
    // assign overflow = ...

endmodule
```

Your expertise in digital design will be crucial for ensuring that this module functions accurately and efficiently, thereby contributing to the success and integrity of the product and your company.