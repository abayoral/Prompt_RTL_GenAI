Understand the Requirements:
1. A decade counter counts from 0 to 9 (inclusive), which means it has a period of 10.
2. The counter resets to 0 when the reset input is active (high).
3. The reset is synchronous, implying that changes to the reset signal are recognized at the rising edge of the clock.
4. Inputs: `clk` (clock) and `reset` (synchronous active-high reset).
5. Output: `q` (the 4-bit counter value).

Determine the Inputs and Outputs:
- Inputs: clk, reset
- Output: q[3:0]

Define Intermediate Signals:
- An intermediate signal is not strictly necessary, but we need a mechanism to handle the counter value within the always block.

Structuring the Module:
1. Start with the module declaration specifying the inputs and outputs.
2. Create an always block that is triggered on the rising edge of the clock (for regular counting) and the rising edge of the reset signal (for synchronous reset).
    - Inside the always block, check the value of the reset signal first:
        - If the reset signal is active (high), set the counter value to 0.
        - Otherwise, check the current value of `q` (the counter):
            - If `q` is less than 9, increment it.
            - If `q` equals 9, roll the counter back to 0 (creating the period of 10).
3. Assign the counter value to the output `q`.

By maintaining the counter within the always block, the design ensures that the counter increments with each clock cycle and resets synchronously when the reset input is high. This provides an efficient decade counter with the requisite period of 10.