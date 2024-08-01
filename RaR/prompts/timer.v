To develop a timer module that counts down from a given number of clock cycles and asserts a signal once the duration has elapsed, we need to use a down-counter mechanism. The goal is to manage the counting process and correctly indicate when the counter has reached zero. Here are the detailed steps and conditions we need to address:

1. **Clock Cycle Operation**:
   - At each clock cycle, the module should either load a new value into the counter or decrement the existing value, based on the control signals.

2. **Loading the Counter**:
   - If the `load` signal is asserted (`load = 1`), the 10-bit input data should be loaded into the internal counter. This action can occur irrespective of whether the counter is currently counting down or has reached zero. This ensures flexibility in resetting or adjusting the countdown duration at any moment.

3. **Counting Down**:
   - When the `load` signal is not asserted (`load = 0`), the counter should decrement by 1 for each clock cycle.

4. **Terminal Count Signal (tc)**:
   - The output signal `tc` should indicate whether the counter has reached zero. It should be asserted (set to 1) the moment the counter reaches zero.
   - Once the counter reaches zero, it should halt further counting and maintain the zero count state until a new value is loaded into it via the `load` signal.

5. **Implementation in Verilog**:
   - Utilize a register to hold the current count.
   - Implement logic to manage loading the counter and decrementing its value.
   - Implement the output logic to generate the `tc` signal based on the counter's state.

Your Verilog module template should be structured as follows:

```verilog
module top_module (
    input clk, 
    input load, 
    input [9:0] data, 
    output tc
);

    // Declare the internal counter register, ensure it's wide enough for the 10-bit data.
    reg [9:0] counter;

    // Always block to handle the clock-driven operations.
    always @(posedge clk) begin
        if (load) begin
            // Load the counter with the new data value when 'load' is asserted.
            counter <= data;
        end else if (counter != 0) begin
            // Decrement the counter by 1 if it is not already zero.
            counter <= counter - 1;
        end
    end

    // Assign the terminal count (tc) signal.
    // 'tc' should be high when the counter reaches zero.
    assign tc = (counter == 0);

endmodule
```

Remember, the focus here is purely on designing the Verilog module to meet the specified conditions and ensuring that the `tc` signal correctly indicates the terminal count when the internal counter reaches zero.