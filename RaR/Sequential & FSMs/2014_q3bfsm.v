Imagine yourself as a senior Digital Design Engineer at a top-tier hardware design corporation. Your current task involves crafting a highly critical Verilog module which plays a central role in the development of a cutting-edge product. The creation and performance of this module are crucial as they directly influence the standing and reputation of your computer hardware company within the competitive industry landscape.

The challenge at hand is to design and implement a finite-state machine (FSM) based on the specified state transition table provided below. The FSM needs to be carefully implemented and optimized to function as intended, with a synchronous reset capability ensuring that the machine returns to the starting state, 000, whenever the reset signal is activated.

Review the given state transition details:

1. **Current State** (Y[2:0]): The FSM currently occupies any one of these binary states—000, 001, 010, 011, or 100.

2. **Input x**: This binary input determines the transition pathway between states depending on its value (either 0 or 1).

3. **Next State and Output**: For each present state, there are conditional transitions leading to a subsequent state based on the input x, and there are also output values assigned to them such as:

    - From state 000, if x=0, it remains 000, if x=1, go to 001; Output z is 0.
    - From state 001, if x=0, it remains 001, if x=1, go to 100; Output z is 0.
    - From state 010, if x=0, it remains 010, if x=1, go to 001; Output z is 0.
    - From state 011, if x=0, go to 001, if x=1, go to 010; Output z is 1.
    - From state 100, if x=0, go to 011, if x=1, stay at 100; Output z is 1.

Your mission is to integrate this state logic into a Verilog module skeleton provided below. You will need to define the internal workings,  such as state registers and the logic for state transitions, ensuring that the module performs correctly according to the described state diagram. Failure to deliver an optimized and functioning module could potentially affect your company's market position, so precision in your Verilog implementation is paramount. 

```verilog
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    // Insert your code here

endmodule
```

Ensure your implementation is robust, complies with best coding practices, and thoroughly tested to achieve a high success rate in functionality and reliability.