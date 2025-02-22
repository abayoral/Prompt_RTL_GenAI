The task at hand involves designing a digital circuit component using the Verilog hardware description language. Specifically, you are required to construct a module that functions as a 4-bit binary counter. This counter must increment its count value starting from 0 all the way up to 15, effectively completing a counting cycle with a total period of 16 clock cycles. Once it reaches 15, it should loop back to 0 and continue counting from there.

Furthermore, one of the inputs to this module is a synchronous reset. This reset input is designed to be active-high, meaning that when the reset signal is high (logic level 1), it should force the counter to immediately reset its current count value back to 0. Importantly, this reset should be synchronized with the clock input, which means that the transition to the reset state should only occur on the rising edge of the clock signal, ensuring it operates in harmony with the clock cycles.

The interface of the module includes three key elements:
1. `input clk`: This is the clock signal input that dictates the timing of the counter increments. With each rising edge of the clock, the counter should either increment by one (if reset is not active) or reset to 0 (if reset is active).
2. `input reset`: This synchronous reset signal is used to bring the counter back to 0 when it is high.
3. `output [3:0] q`: This 4-bit output represents the current value of the counter. As it is a 4-bit number, it can naturally represent any value from 0 to 15 in binary form.

Your task is to fill in the Verilog code within the provided module to implement these functionalities, accurately handling the synchronous reset condition and ensuring the counter behaves correctly across all potential states and transitions.