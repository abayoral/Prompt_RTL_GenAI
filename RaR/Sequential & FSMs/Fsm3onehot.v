Imagine you are a seasoned Digital Design Engineer working for a prestigious hardware design company. You have been entrusted with the crucial task of creating a Verilog module that will be a key component in a groundbreaking new product. The performance and reliability of this module are critical, as they directly impact the company's standing and reputation within the competitive computer hardware industry.

Your task revolves around designing a specific state machine, known as a Moore state machine, which is defined by a state transition table. This table outlines the behavior of the state machine, which includes one input, one output, and four distinct states. The states are encoded using a one-hot scheme, where each state is represented by a unique 4-bit binary code: State A by 4'b0001, State B by 4'b0010, State C by 4'b0100, and State D by 4'b1000.

The challenge before you is to derive logical equations for the state transitions and the output by carefully analyzing, or inspecting, the provided state transition diagram using the one-hot encoding methodology. Your focus should be on the combinational logic component, which involves both the logic that dictates how the state transitions occur (state transition logic) and that which determines what the output will be based on the current state (output logic).

Below is a simplified state diagram delineating the transitions:

- **From State A:**
  - If the input is 0, remain in State A.
  - If the input is 1, transition to State B.
  - Output is 0.

- **From State B:**
  - If the input is 0, move to State C.
  - If the input is 1, remain in State B.
  - Output is 0.

- **From State C:**
  - If the input is 0, transition back to State A.
  - If the input is 1, transition to State D.
  - Output is 0.

- **From State D:**
  - If the input is 0, transition to State C.
  - If the input is 1, transition to State B.
  - Output is 1.

You must encode this behavior using Verilog and carefully craft the logic equations that govern the next state transitions for A, B, C, and D, as well as a separate equation for computing the output. Keep in mind, a testbench may be employed to check your design's robustness by feeding it non-one-hot inputs to ensure refusal of unintended complexity.

As a final step, utilize the hint given: the logic equations for one-hot state transition logic can be systematically crafted by examining the incoming edges for each state within the state transition diagram. Your module is defined with inputs and outputs as mentioned, and your code should follow neatly between the comments in place for inserting it.