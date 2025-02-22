You are tasked with designing and implementing a finite-state machine (FSM) based on a given state transition table. The FSM should have the following characteristics:

1. **State Representation**: The FSM has five possible states, which are represented using a 3-bit state code, denoted as y[2:0]. Each state is represented numerically as 000, 001, 010, 011, and 100.

2. **Inputs**:
   - **Clock Signal (clk)**: The FSM should operate synchronously with this clock input.
   - **Reset Signal (reset)**: This is a synchronous reset signal, meaning that whenever it is asserted, the FSM should be reset to the initial state (000) during the clock cycle.

3. **Control Input**:
   - **x**: This is a key input for determining the next state of the FSM. Its value can be either 0 or 1, affecting how the transition from one state to the next occurs.

4. **Output**:
   - **z**: This is a single-bit output signal whose value depends on the current state of the FSM. Its primary function is to indicate specific conditions based on the state transitions.

5. **State Transition Logic**:
   - The FSM transitions between states based on the current state and the value of the input x.
   - Each state has defined behaviors: for example, from state 000, if x=0, the FSM remains in state 000; however, if x=1, it transitions to state 001.
   - This process is illustrated for all states as per the provided state table. For example:
     - State 000 transitions to 000 if x=0 and to 001 if x=1.
     - State 011 transitions to 001 for x=0 and to 010 for x=1, while also producing an output z=1.

6. **Objective**:
   - Implement this FSM in a hardware description language like Verilog within a top-level module. Ensure that all defined transitions and output rules are correctly mapped out in the design.

Remember, these elements constitute the core of what you need to consider in your finite-state machine implementation. Don't forget the design must accommodate the reset functionality, ensuring a reset always results in transitioning to state 000, regardless of other inputs or signals.