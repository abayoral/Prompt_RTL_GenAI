Could you provide a detailed solution for creating a full adder in Verilog? A full adder is a digital circuit that takes three input bits (two significant bits and an additional carry-in bit) and adds them together to produce a sum bit and a carry-out bit. The inputs for the full adder module should include:

1. `a` - The first significant bit to be added.
2. `b` - The second significant bit to be added.
3. `cin` - The carry-in bit, which is an input from the carry of a less significant bit addition.

The outputs for the full adder module should include:

1. `sum` - The resulting sum bit from the addition of the three input bits.
2. `cout` - The carry-out bit that represents any overflow from the addition process, to be carried over to more significant bits.

Please include a detailed implementation inside the Verilog module to correctly perform the addition operation and produce both the `sum` and `cout` outputs. Here is the module definition to get started:

```verilog
module top_module( 
    input a, 
    input b, 
    input cin,
    output cout, 
    output sum );

    // Insert your code here

endmodule
```

Ensure to explain each part of the code you write for clarity.