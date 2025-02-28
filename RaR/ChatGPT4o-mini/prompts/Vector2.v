Please develop a digital circuit in Verilog that can take a 4-byte (32-bit) word as an input and will produce an output where the byte ordering of the input word is reversed. 

To be more specific, if the input word is composed of four bytes denoted as `Aaaaaaaa` for the most significant byte (MSB), `Bbbbbbbb` for the next byte, `Cccccccc` for the following byte, and `Dddddddd` for the least significant byte (LSB), then the output should be ordered as `DdddddddCcccccccBbbbbbbbAaaaaaaa`.

Here's what you need to do:
1. The input to the module is a 32-bit signal `in`, labeled from `in[31:0]` where `in[31:24]` is the most significant byte and `in[7:0]` is the least significant byte.
2. The output should be a 32-bit signal `out`, labeled from `out[31:0]`.
3. You will use part-selects to reverse the byte order in the assignment expression.

The hint provided suggests that you can use part-select on both the left and right sides of an assignment statement to achieve this byte reversal.

To start you off, an example of the initial code structure is provided below:

```verilog
module top_module( 
    input [31:0] in,
    output [31:0] out );

    // Insert your code to reverse the byte order here
    // For example, to assign to the most significant byte of the output, use:
    // assign out[31:24] = ...;

endmodule
```

Please ensure that you correctly assign each byte of the input to its reversed position in the output.