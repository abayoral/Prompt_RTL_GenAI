Certainly! Below is a rephrased and expanded version of your question with added clarity and details:

---

Design and implement a 4-bit priority encoder in Verilog. The priority encoder should take a 4-bit input and produce a corresponding 2-bit output indicating the position of the highest-order bit that is set to '1'. If none of the input bits are set to '1' (i.e., the input is 4'b0000), the output should be zero (2'b00).

Consider the following details:
1. The input to the priority encoder is a 4-bit wide signal named `in`.
2. The output is a 2-bit wide signal named `pos` which represents the position index of the highest-order bit that is high (1).

As a hint for efficient coding:
- Using hexadecimal (e.g., 4'hb) or decimal (e.g., 4'd11) number literals can save you typing effort compared to using binary literals (e.g., 4'b1011).

Write the Verilog code for the described priority encoder within the provided module template:

```verilog
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    // Insert your code here

endmodule
```

---

Ensure your implementation correctly accounts for all 16 possible input combinations of a 4-bit number and produces the appropriate 2-bit output. If all input bits are zero, the output should also be zero.