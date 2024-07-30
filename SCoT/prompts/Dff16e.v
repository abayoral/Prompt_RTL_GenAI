Chain of Thought:

1. **Understand the Requirements**:
    - The task is to create 16 D flip-flops.
    - The flip-flops are organized such that there are two 8-bit groups controlled by byte-enable signals.
    - `byteena[1]` controls the upper 8 bits (`d[15:8]`), while `byteena[0]` controls the lower 8 bits (`d[7:0]`).
    - The `resetn` is a synchronous, active-low reset signal.
    - All D flip-flops should be triggered by the positive edge of the clock (clk).

2. **Determine the Inputs and Outputs**:
    - Inputs:
        - `clk`: Clock signal
        - `resetn`: Synchronous, active-low reset signal
        - `byteena`: 2-bit byte-enable control signal
        - `d`: 16-bit data input
    - Output:
        - `q`: 16-bit output

3. **Define Intermediate Signals**:
    - No complex intermediate signals are needed, but we need to manage the byte-enable control within the module.

4. **Structuring the Module**:
    - The module will be structured using an always block triggered on the rising edge of the clock.
    - Inside the always block, we need to check the `resetn` signal first.
    - If `resetn` is low, all flip-flops should be reset to `0`.
    - If `resetn` is high, we need to handle the write operation.
    - Use the `byteena` signals to selectively write to the corresponding byte of the 16-bit register.
    - For `byteena[1]`, update the upper 8 bits (`q[15:8]`) from `d[15:8]` if it is enabled.
    - For `byteena[0]`, update the lower 8 bits (`q[7:0]`) from `d[7:0]` if it is enabled. 

5. **Implementation Strategy**:
    - Start with the module declaration, specifying the inputs and outputs.
    - Create an always block triggered on the rising edge of the clock.
    - Check the `resetn` signal inside the always block.
        - If `resetn` is low, set the entire 16-bit output (`q`) to `0`.
        - If `resetn` is high, check the `byteena` signals.
            - If `byteena[1]` is high, update the upper 8 bits (`q[15:8]`).
            - If `byteena[0]` is high, update the lower 8 bits (`q[7:0]`).
    - The always block ensures that changes in `byteena` and `d` are properly managed.

By following this structured approach and clearly understanding the requirement, we can construct the desired module effectively.