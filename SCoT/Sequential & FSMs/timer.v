Your task is to design and implement a digital timer module in Verilog HDL that reacts to clock signals and counts down from a specified initial value. The module should maintain the following functionalities:

1. **Timer Initialization and Loading**: 
   - The module should include a down-counter mechanism. You need to manage a 10-bit data input, which represents the number of clock cycles the timer should last. In essence, the timer will countdown from this initial value to zero.
   - The counter should have a load functionality. When the `load` input signal is asserted high (`load = 1`), the 10-bit data input is loaded into the counter. The counter can be reloaded at any moment, even if it is actively decrementing and hasn't counted down to zero yet. 

2. **Counter Operation**: 
   - If the `load` input is not asserted (`load = 0`), the counter must decrement by 1 on each active clock cycle.
   - Once the counter reaches zero, it should not decrement further, effectively halting at zero.

3. **Terminal Count Signal**:
   - An output signal `tc` (terminal count) must indicate when the counter has reached zero. This signal should remain asserted once the counter reaches zero until the counter is reloaded with a new value.
   
4. **Clock Signal Dependency**:
   - The overall operation of loading and decrementing should be synchronized with the rising edge of the `clk` input, ensuring operations occur in line with clock cycles.
   
The main focus for this module is its ability to respond to loading commands and accurately decrement, asserting an appropriate output signal when the countdown reaches its end. Ensure that all functionalities properly respond to varying conditions of the `load` signal and transitions of the clock signal, thus facilitating precise timing operations.