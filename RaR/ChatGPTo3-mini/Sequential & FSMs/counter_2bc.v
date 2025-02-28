Consider the following design task scenario:

You are an experienced Digital Design Engineer employed by a prominent hardware design firm. Your current assignment involves developing a crucial Verilog module that will play a significant role in the performance of a next-generation product. The functionality of this module is essential for upholding the high standards and reputation of your company within the computer hardware industry.

The design challenge is to construct a two-bit saturating counter, which behaves as follows:

• Under training conditions (i.e., when the signal train_valid is asserted), the counter's value is updated based on the state of the train_taken signal:
  – If train_taken is high (1), the counter should increment its value, taking care not to exceed the maximum value of 3.
  – If train_taken is low (0), the counter should decrement its value, ensuring it does not drop below the minimum value of 0.

• When training is not active (i.e., when train_valid is deasserted or equal to 0), the counter should maintain its current state without any changes.

• An asynchronous reset signal (areset) is provided that, when activated, will immediately reset the counter to a specific default state, representing "weakly not-taken" (indicated by the two-bit value 2'b01).

The module interface is defined in Verilog as follows:

module top_module(
  input clk,
  input areset,
  input train_valid,
  input train_taken,
  output [1:0] state
);

  // Your design implementation should be inserted here.

endmodule

Your task is to analyze and design the Verilog module to meet the above specifications, ensuring that the two-bit counter operates correctly in all scenarios described, with proper handling of increment, decrement, no-change conditions, and asynchronous reset functionality.