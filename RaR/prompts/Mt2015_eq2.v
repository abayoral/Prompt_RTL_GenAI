Please design and implement a digital circuit using Verilog HDL that accepts two 2-bit binary inputs, denoted as `A[1:0]` and `B[1:0]`. The circuit should also produce a single-bit output `z`. The functionality of the circuit should be such that the output `z` is set to `1` if the two inputs `A` and `B` are equal. Conversely, `z` should be set to `0` if `A` and `B` are not equal. Ensure that the module is named `top_module` and make use of the input and output declarations as specified. Here is a template for the module to help you get started:

```verilog
module top_module (
    input [1:0] A,  // 2-bit input A
    input [1:0] B,  // 2-bit input B
    output z        // 1-bit output z
); 
    // Insert your code here to compare A and B and set z accordingly.
endmodule
```

In your implementation, please include the necessary logic to compare the two 2-bit inputs and assign the appropriate value to the output `z`. Ensure that your solution is concise and makes use of Verilog best practices.