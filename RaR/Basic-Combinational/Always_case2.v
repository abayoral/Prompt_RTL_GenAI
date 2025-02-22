As a senior Digital Design Engineer working at a prominent hardware design company, you have been entrusted with the task of developing a Verilog module that is crucial to the success of a cutting-edge product your company is producing. This module plays a significant role in ensuring that your company continues to be perceived as a leader in computer hardware by its consumers and stakeholders. 

The specific task at hand involves designing a 4-bit priority encoder. A priority encoder takes multiple binary input signals and encodes them into a smaller number of output bits. In this case, the encoder should process a 4-bit input, which theoretically allows for 16 different combinations of binary states, ranging from 0000 to 1111. 

The expected functionality of this priority encoder is as follows: it should analyze the input bits, which are labeled from the most significant bit (MSB) to the least significant bit (LSB). The encoder should then output the binary positional index of the highest-order input bit that is set to '1'. For a scenario where none of the input bits are high—meaning all inputs are set to zero—the encoder should output zero.

Consider streamlining your code by utilizing number literals such as hexadecimal (e.g., 4'hb) or decimal (e.g., 4'd11), as these formats can simplify the writing and readability of your code compared to binary literals (e.g., 4'b1011). Keep in mind, the implementation should be compatible with Verilog 2001 standards.

With these requirements in mind, you are to complete the Verilog module, which has been partially defined below. Your assignment includes inserting the code needed to implement the described priority encoder logic within the body of the module. Be sure to focus on logic efficiency and clarity, ensuring reliability and high performance in real-world applications:

```verilog
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    // Insert your code here

endmodule
```

This module's successful implementation is essential for the product's operational effectiveness and will contribute significantly to the company's standing in an increasingly competitive market.