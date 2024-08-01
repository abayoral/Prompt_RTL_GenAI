The task is to design a digital circuit using Verilog that acts as a 2-to-1 multiplexer (MUX) with a one-bit wide data path. The multiplexer should have two data inputs, labeled `a` and `b`, and one select input, labeled `sel`. The output of the multiplexer, labeled `out`, will be determined based on the value of the `sel` input. Specifically:

- When `sel` is 0, the output (`out`) should be assigned the value of input `a`.
- When `sel` is 1, the output (`out`) should be assigned the value of input `b`.

The ternary operator in Verilog notation (cond ? iftrue : iffalse) is suggested as it can make the implementation simpler and more readable. 

Write the necessary Verilog code within the provided module template to implement this functionality.

Here is the Verilog module template to start with:

```verilog
module top_module( 
    input a, b, sel,
    output out ); 

    // Insert your code here

endmodule
```

Make sure to utilize the ternary operator for clarity and conciseness in your code.