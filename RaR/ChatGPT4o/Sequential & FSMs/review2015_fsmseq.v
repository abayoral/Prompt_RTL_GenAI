You are serving as a senior Digital Design Engineer at a prominent hardware design firm, charged with the development of a crucial Verilog module for an upcoming state-of-the-art product. This module's successful design and implementation are essential for sustaining the high regard of your computer hardware company within the industry. 

Your assignment is to construct a finite-state machine (FSM) that meticulously searches an input bit stream for the specific binary sequence "1101". Upon detection of this sequence, the FSM is required to activate an output signal, named `start_shifting`, by setting it to a logical '1'. This output signal should remain in its '1' state indefinitely, signifying continuous operation or readiness, until a system reset is initiated. The FSM is deliberately designed to remain in a certain final state to simulate transitioning to other states in a larger FSM system, which has yet to be designed or integrated. In future exercises, this FSM will be expanded to include additional functionalities and state transitions.

You are to encapsulate your solution within a Verilog module, with the top-level module declaration as follows:

```verilog
module top_module (
    input clk,            // Clock signal input
    input reset,          // Synchronous reset input signal
    input data,           // Serial input bit stream
    output start_shifting // Output signal indicating sequence detection
);
    // Placeholder for FSM implementation
endmodule
```

The module should handle various input signals: a clock (`clk`) to synchronize operations, a synchronous reset signal (`reset`) to initialize or reset the FSM state, and a single bit input (`data`) representing the incoming bitstream. The output (`start_shifting`) is intended to indicate when the FSM has successfully identified the sequence "1101". The expected behavior is to maintain a high output on `start_shifting` until triggered by a reset sequence. You are expected to insert your FSM logic where indicated in the code structure provided.