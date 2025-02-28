Develop a Verilog module for a four-bit shift register that also functions as a down counter. The module should handle two operational modes controlled by input signals: `shift_ena` and `count_ena`. When `shift_ena` is set to 1, the register shifts a new data bit (provided through the `data` input) into the register starting from the most significant bit (MSB). Conversely, when `count_ena` is set to 1, the register acts as a down counter, decrementing the current value stored in the register by one on each clock cycle.

It is important to note that `shift_ena` and `count_ena` are mutually exclusive in this system; they will never be active simultaneously. Therefore, the behavior of the module when both `shift_ena` and `count_ena` are set to 1 simultaneously is undefined and does not need to be accounted for in your design. This effectively means that the priority or outcome when both control signals are high can be arbitrary or left unchanged.

Below is the template of the Verilog module where you need to implement the desired functionality:

```verilog
module top_module (
    input clk,           // Clock signal for synchronizing operations
    input shift_ena,     // Enable signal for shift operation
    input count_ena,     // Enable signal for count down operation
    input data,          // Input data bit for shift operation
    output [3:0] q       // Four-bit output representing the current state of the register
);

    // Insert your code here

endmodule
```

Ensure your solution correctly handles both operation modes, updating the 4-bit output `q` as specified:

1. **Shift Mode (shift_ena = 1):**
   - Shift the bits in the register to the left.
   - Insert the new `data` bit into the MSB position.

2. **Count-Down Mode (count_ena = 1):**
   - Decrement the value stored in the 4-bit register by 1.

Remember to synchronize your operations with the provided clock signal `clk` and maintain the proper register state through sequential logic.