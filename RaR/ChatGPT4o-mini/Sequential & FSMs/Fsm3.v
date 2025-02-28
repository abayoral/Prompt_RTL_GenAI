As a senior Digital Design Engineer working for a prominent hardware design company, you have been assigned a crucial task: to develop a specific Verilog module that is integral to a next-generation product. The successful implementation of this module is essential not only for the project's success but also for preserving the company’s reputation within the highly competitive computer hardware sector.

To guide your design process, you are provided with a detailed state transition table that corresponds to a Moore state machine with the following characteristics: it has a single input, a single output, and operates across four distinct states. Your primary objective is to effectively implement this state machine, ensuring that it includes an asynchronous reset mechanism that initializes the finite state machine (FSM) to its starting state, which is designated as state A.

The state transition table you're working from outlines the conditions for transitioning between states based on the input signal. Here’s an elaboration of the information you have:

- When the current state is A:
  - If the input signal is 0, the next state remains A, and the output is 0.
  - If the input signal is 1, the next state transitions to B, with the output still being 0.

- When the current state is B:
  - With an input of 0, the next state moves to C, while the output is again 0.
  - With an input of 1, the next state remains B, and the output is still 0.

- In state C:
  - An input of 0 leads the machine back to state A, maintaining an output of 0.
  - An input of 1 transitions the machine to state D, where the output is also 0.

- Finally, while in state D:
  - If the input is 0, the next state moves to C (output remains 1).
  - If the input is 1, the next state transitions back to B, where the output becomes 1.

Your task is encapsulated in the Verilog module framework provided below, which requires you to implement several key components:
- The state transition logic that will dictate how the states change in response to the input signals.
- The flip-flops that will hold the state information, complete with asynchronous reset functionality.
- The output logic that determines the output of the state machine based on its current state.

You are tasked with writing this module, using your expertise in digital design and Verilog programming, to ensure its correct functionality and design integrity. The module template is available for your use, indicating where the implementation details should be inserted.