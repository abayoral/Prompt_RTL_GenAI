Imagine you are a seasoned Digital Design Engineer at a top-tier hardware design firm, responsible for developing an essential Verilog module that will be a key component in a next-generation product. The overall reputation and success of your computer hardware company hinge on the reliability and efficiency of this module.

Your task centers on designing a finite state machine (FSM) with two inputs: s and w. Here is the scenario you need to address:

• The FSM initially starts in a reset state named A.
• While in state A, the FSM continuously monitors the input s. It must remain in state A as long as s is 0. However, the moment s becomes 1, the FSM must transition from state A to a new state, B.
• Once the FSM enters state B, its focus shifts exclusively to the input w. Over the next three clock cycles, the FSM must track the value of w.
• The FSM’s subsequent behavior is determined by the observed pattern: if, during these three clock cycles, w is equal to 1 exactly two times, then in the clock cycle immediately following this sequence the FSM should assert (set high) an output signal z (i.e., z should become 1). If the condition is not met—meaning w equals 1 either fewer or more than two times—then output z must be set to 0 in the following clock cycle.
• This process of monitoring w over blocks of three clock cycles and updating z accordingly must continue repeatedly as long as the FSM remains in state B.
• Note that the input s only influences the initial state (state A), and thereafter, the operation of the FSM revolves solely around the behavior of the input w.

Additionally, the design objective is to achieve this functionality using the minimum number of states necessary.

Your Verilog module should have the following interface:

• clk – the clock input.
• reset – a synchronously applied reset signal that forces the FSM back to its initial state.
• s – an input signal that triggers the transition from state A.
• w – an input signal that is monitored in state B.
• z – an output signal that is updated based on the criteria related to the input w over three clock cycles.

Based on these requirements, draft a Verilog design for the FSM ensuring that it meets the conditions for transitioning between states and producing the correct output z according to the provided timing and criteria. Remember, the solution should aim to use as few states as possible while fully satisfying the described behavior.