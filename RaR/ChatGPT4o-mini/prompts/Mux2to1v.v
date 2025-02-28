Elaborate on the requirements for designing a Verilog module to implement a 2-to-1 multiplexer. This multiplexer should be 100 bits wide. Specifically, the multiplexer will select between two 100-bit input vectors, `a` and `b`, based on a single-bit selection signal, `sel`. When the selection signal `sel` is 0, the output should be equal to the input vector `a`. Conversely, when the selection signal `sel` is 1, the output should be equal to the input vector `b`. To enhance readability, consider using the ternary operator (`condition ? true_value : false_value`) for your selection logic within the module. 

Given these requirements, your Verilog module should have the following ports:
- `input [99:0] a` – a 100-bit wide input vector.
- `input [99:0] b` – another 100-bit wide input vector.
- `input sel` – a single-bit selection signal.
- `output [99:0] out` – a 100-bit wide output vector that reflects the selected input vector (`a` or `b`).

The template code for your module is provided below:

```verilog
module top_module( 
    input [99:0] a, 
    input [99:0] b,
    input sel,
    output [99:0] out );

    // Insert your code here
    
endmodule
```

Based on the above, fill in the necessary logic to ensure the correct functioning of the 2-to-1 multiplexer as described.