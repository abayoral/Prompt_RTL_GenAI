Parity checking is commonly implemented to detect errors in data transmission over unreliable channels. Your task is to design a digital logic circuit capable of calculating the parity bit for an 8-bit byte. This extra parity bit will be appended to the last byte to form a 9-bit data sequence. In this problem, we will employ "even" parity, which requires that the parity bit be calculated as the XOR (exclusive OR) of all 8 input data bits.

Specifically, you are to complete the Verilog code for a module named `top_module` that takes an 8-bit input vector `in` and produces a single output bit called `parity`. The `parity` bit must be generated such that the total number of 1's in the 9-bit sequence (the original 8 bits plus the parity bit) is even.

To clarify, here is a detailed breakdown of the task:

- The module `top_module` has the following ports:
  - An 8-bit input vector named `in` (representing the byte).
  - A 1-bit output named `parity`.
  
- Your objective is to implement the logic that calculates the parity bit by performing the XOR operation on all 8 bits of the input vector `in`. This computed parity bit should then be assigned to the output `parity`.

You are required to insert the appropriate Verilog code between the `module` and `endmodule` statements to accomplish this. Ensure that the implementation results in even parity, meaning the resulting 9-bit word (comprising the original 8 bits plus the calculated parity bit) has an even number of 1's.

Below is the partially completed Verilog code provided:

```verilog
module top_module (
    input [7:0] in,
    output parity); 
    // Insert your code here
endmodule
```

Expand and implement the necessary logic within this framework.