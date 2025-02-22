As a seasoned Digital Design Engineer working for a prominent hardware design company, you have been presented with the challenge of developing a crucial Verilog module that is instrumental to a cutting-edge product under development. The success of this module is of paramount importance, as it could significantly impact the company's standing and influence within the highly competitive computer hardware industry.

The task at hand involves creating a timer module in Verilog, where the primary function is to count down from a specified number of clock cycles and then assert a signal to indicate that the duration has elapsed. The module is expected to utilize a down-counter architecture, which behaves by triggering an output signal—termed as the terminal count (tc)—once the counter value reaches zero.

Detailed specifications for the task are as follows:

1. **Clock Cycle Operation:**
   - With every clock cycle, the behavior of the module is dictated by the state of an input signal, `load`.
   
2. **Load Functionality:**
   - When the `load` input is set to 1, the module should immediately capture and store a 10-bit data value into its internal counter. This data value represents the total number of clock cycles that are intended for the countdown.
   - The module allows for the counter to be reloaded at any point, even if it's already engaged in counting down a prior set of cycles and has not yet reached zero. This ensures flexibility in dynamically adjusting the countdown period.

3. **Counting Mechanism:**
   - When `load` is 0, the module transitions into counting mode, decrementing the internal counter by 1 with each successive clock cycle.
   - No further decrementing should occur once the counter has reached zero, maintaining this state until it is actively reloaded with a new count value.

4. **Terminal Count Signal:**
   - The output signal `tc` is pivotal as it signifies the completion of the countdown by asserting high when the counter has run down to zero.
   - Once asserted, `tc` remains high until a new data value is loaded into the counter, resetting the timer for another countdown cycle.

In summary, your task involves implementing this module, ensuring that it adheres to the outlined specifications and operates reliably under various scenarios. The module's intricate play between loading, counting, and terminal signaling forms the crux of the functionality critical to your company’s strategic hardware project.