You are currently working as a senior Digital Design Engineer at a prominent hardware design company, where you play a crucial role in the development of a pivotal Verilog module for an upcoming state-of-the-art product. The success of this module is crucial for maintaining the esteemed reputation of the company within the competitive computer hardware industry.

Your task is to design a finite state machine (FSM) that is responsible for controlling a certain type of motor. This FSM has several inputs and outputs: it receives two inputs, x and y, from the motor, and it produces two outputs, f and g, which are used to control the motor. Additionally, the FSM is synchronized with a clock signal, clk, and has a reset signal, resetn, which is active low, indicating it resets the system when low.

The operational requirements for the FSM are as follows: 

1. Initially, when the reset input (resetn) is asserted (active low), the FSM remains in an initial state named state A. 
2. Once the reset signal is de-asserted (inactive high), the FSM, after the subsequent clock edge, should set the output f to 1 for a single clock cycle. 
3. Following this, the FSM must start monitoring the x input. It needs to detect a pattern where x is 1, then 0, followed by 1 over three consecutive clock cycles. When this pattern is detected, the FSM should set the output g to 1 on the next clock cycle.
4. Upon setting g to 1, the FSM must begin observing the y input. If y holds the value 1 within the subsequent two clock cycles, the FSM should maintain g at 1 indefinitely (until a reset occurs). 
5. Conversely, if y does not become 1 within those two clock cycles, g should be set back to 0 and remain 0 until the system is reset.

Remember, the FSM does not start monitoring x until the cycle after f has been set to 1. You need to craft the FSM following these operational guidelines.

Using the provided module template for 'top_module', implement the FSM logic to fulfill the described behavior. The presence of an active-low synchronous reset and a series of specific input-output dependencies necessitates a thoughtful design to ensure the FSM operates as outlined. Please insert your implementation code within the module placeholder.