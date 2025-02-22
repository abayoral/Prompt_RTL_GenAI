As a senior Digital Design Engineer working for a leading hardware design company, you have been assigned the task of designing a crucial Verilog module for an upcoming next-generation product. This module is of paramount importance and plays a key role in securing and enhancing the reputation of your computer hardware company within the competitive industry landscape.

You are given the challenge to create a Verilog module that processes a 32-bit input vector. Your goal is to detect specific transitions within each individual bit of this vector. Specifically, you need to identify when any bit within this 32-bit input transitions from a logical high ('1') state to a logical low ('0') state over consecutive clock cycles.

Upon detecting such a transition from '1' to '0', the corresponding bit in the 32-bit output vector should be "captured," which means that the output should maintain a logical high ('1') state. This maintained state should persist until a reset signal is applied. The reset mechanism is to be implemented as a synchronous reset, taking place on the positive edge of the clock signal.

The behavior of each output bit is designed to resemble that of an SR (Set-Reset) flip-flop. The output should be set to high ('1') following the detection of a '1' to '0' transition. Conversely, the output should be reset to low ('0') on the occurrence of the reset signal, always prioritizing reset over the set operation should both conditions be present simultaneously. An edge-case example provided in the specification illustrates that if a reset operation occurs followed by a set condition in subsequent cycles, there is no conflict since reset precedence avoids simultaneous occurrences.

Your module, which you will name 'top_module', is required to include the following ports: 
- `clk`: a clock input driving the timing of your logic.
- `reset`: a reset input signal used for resetting the output bits.
- `in`: a 32-bit input signal from which you will detect the transitions.
- `out`: a 32-bit output signal where each bit corresponds to the captured states of the input transitions.

Your task is to write the logic that fulfills these requirements, considering both the capture of transitions and the management of the reset condition, which takes precedence over the capturing of transitions in the event of simultaneous occurrences. This logic is to be implemented within the provided Verilog module skeleton.

  ```verilog
  module top_module (
      input clk,
      input reset,
      input [31:0] in,
      output [31:0] out
  );

      // Insert your code here

  endmodule
  ```