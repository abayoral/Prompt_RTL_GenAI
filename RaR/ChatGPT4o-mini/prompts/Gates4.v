Expand on the original prompt, providing more detailed instructions and context about the design to ensure clarity for someone who might not be familiar with the task:

---

Design a combinational logic circuit using Verilog HDL that takes a 4-bit input vector and produces three distinct outputs based on different logical operations. The inputs and outputs are defined as follows:

**Inputs:**
- `in[3:0]`: A 4-bit vector input, which provides the values to be used in the logical operations. Each bit in this vector represents a binary input to the logical gates.

**Outputs:**
- `out_and`: This is the output of a 4-input AND gate. The value of this output should be the result of performing a logical AND operation across all four bits of the input vector.
- `out_or`: This is the output of a 4-input OR gate. The value of this output should be the result of performing a logical OR operation across all four bits of the input vector.
- `out_xor`: This is the output of a 4-input XOR gate. The value of this output should be the result of performing a logical XOR operation across all four bits of the input vector.

You are required to implement the `top_module` in Verilog, where:
  - The module should have a single 4-bit input named `in`.
  - It should have three single-bit outputs named `out_and`, `out_or`, and `out_xor`.

Implement the logic such that:
  - `out_and` should be the result of a 4-input AND operation on `in[3:0]`.
  - `out_or` should be the result of a 4-input OR operation on `in[3:0]`.
  - `out_xor` should be the result of a 4-input XOR operation on `in[3:0]`.

Here is the template for your module:

```verilog
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

// Insert your code here

endmodule
```

Use this template as a starting point and insert the appropriate Verilog code to achieve the desired functionality for each of the outputs.