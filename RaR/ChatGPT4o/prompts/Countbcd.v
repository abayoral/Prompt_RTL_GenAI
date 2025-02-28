Certainly! Here's a more detailed and expanded version of the original question for clarity:

---

**Task Description:** 

Your objective is to design and implement a 4-digit Binary-Coded Decimal (BCD) counter in Verilog. Each digit in this BCD counter is represented by 4 bits. Therefore, the complete 4-digit counter should have a total of 16 bits. The counter will count in the range from '0000' to '9999', incrementing one unit at every clock cycle unless reset is activated.

### Detailed Requirements:

1. **Module Interface:**
    - **Inputs:**
        - `clk` (Clock signal): This signal drives the counter.
        - `reset` (Synchronous active-high reset): When this input is high, the counter should be set to zero (0000 in BCD).

    - **Outputs:**
        - `ena` (3-bit Output Enable Signal): This signal indicates when each of the upper three BCD digits (tens, hundreds, and thousands positions) should be incremented. Specifically:
            - `ena[1]` corresponds to the tens digit.
            - `ena[2]` corresponds to the hundreds digit.
            - `ena[3]` corresponds to the thousands digit.
        - `q` (16-bit Output representing the 4-digit BCD value): This is the current value of the counter using a Binary-Coded Decimal (BCD) representation.
            - `q[3:0]` represents the ones (least significant) digit.
            - `q[7:4]` represents the tens digit.
            - `q[11:8]` represents the hundreds digit.
            - `q[15:12]` represents the thousands (most significant) digit.

2. **Functional Behavior:**
    - The counter should correctly handle overflow from one BCD digit to the next higher digit. For instance, when the ones digit transitions from 9 to 0, the tens digit should be incremented.
    - If the counter reaches 9999, it should wrap around to 0000 on the next increment.

3. **Enable Signal Generation:**
    - The submission should include logic to generate enable signals for the tens, hundreds, and thousands digits based on the current state of the lower-significance digits.
    - The enable signals should facilitate carrying the increment to the next significant digit.

4. **Hint on Implementation:**
    - You may consider instantiating or modifying a one-digit decade counter (0-9) for the BCD digits and then combining four such counters while managing the carry-over logic.

### Template for the Verilog Module:

```verilog
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);
    // Insert your code here

endmodule
```

- **Important**: The logic to increment the digits and produce the enable signals must be efficiently implemented, ensuring that the counter updates correctly on each clock cycle and handles the reset scenario properly.

**Note:** Please insert your logic within the module template provided to perform the specified operations and generate the necessary output signals as described.

---