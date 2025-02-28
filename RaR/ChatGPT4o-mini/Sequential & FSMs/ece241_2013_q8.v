You are a senior Digital Design Engineer working at a prominent hardware design company, and you have been assigned a critical project that involves the development of a finite state machine (FSM) using Verilog. This FSM is crucial for a next-generation product that your team is designing, and its performance will play a significant role in preserving the company's reputation within the competitive landscape of computer hardware.

The task requires you to design a Mealy-type FSM specifically tailored to recognize the binary sequence "101" as it appears on an input signal called 'x'. This includes the necessity for the FSM to output a signal, denoted as 'z', which should assert to a logic high (1) whenever the specified sequence "101" is detected within the input stream. Additionally, the design requirements specify that the FSM should accommodate an asynchronous active-low reset functionality, allowing the system to be reset independently of the clock signal when the reset signal is asserted.

Another consideration is that the FSM will need to have only three distinct states, which presents an interesting challenge in terms of state management and sequence detection. Moreover, it is essential that the FSM is designed to recognize overlapping sequences of the target pattern, meaning that if the sequence appears multiple times in a continuous manner, it should appropriately trigger the output signal accordingly.

To clarify, the main points to consider in your design will include the following:
1. How will you define the three states required to detect the "101" sequence?
2. What transitions will occur between these states based on the input signal 'x'?
3. How will you ensure that the output signal 'z' is correctly asserted in response to the detected sequence?
4. What mechanisms will you implement to handle the asynchronous reset condition?

With these design parameters in mind, you are invited to draft your Verilog module, implementing the necessary logic to fulfill these requirements while ensuring the solution aligns with industry standards for performance and reliability.