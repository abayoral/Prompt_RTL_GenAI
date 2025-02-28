Could you provide more details on how to design a 100-bit binary adder using SystemVerilog? The adder needs to take two 100-bit binary numbers, represented by `a` and `b`, as inputs, along with an additional carry-in bit `cin`. The module should output a 100-bit binary sum and a carry-out bit `cout` after performing the addition. Note that manually instantiating all the necessary full adders would be impractical due to the large number involved, so a behavioural approach utilizing the language's ability to handle vectors and arithmetic operations directly is preferred.

Here's the provided skeletal module to work with:

```verilog
module top_module( 
    input [99:0] a, b,   // 100-bit binary input 'a' and 'b'
    input cin,           // Additional carry-in bit 'cin'
    output cout,         // Carry-out bit 'cout'
    output [99:0] sum    // 100-bit binary output 'sum' representing the sum of 'a', 'b', and 'cin'
);

    // Insert your code here

endmodule
```

It is expected that the implemented adder correctly computes the sum and carry-out for the given inputs.