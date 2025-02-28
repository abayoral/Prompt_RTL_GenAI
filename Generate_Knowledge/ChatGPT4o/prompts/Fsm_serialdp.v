
### Verilog Design Background and Principles

#### Fundamental Concepts

1. **Hardware Description Language (HDL)**:
   - Verilog is a hardware description language used to model electronic systems. It allows for the description of digital circuits and systems at various levels of abstraction.

2. **Modules**:
   - Verilog code is organized using modules that define the behavior and structure of the hardware. Modules can include inputs, outputs, and internal variables and are the building blocks in Verilog.

3. **Sequential Logic**: 
   - Describes circuits where the output depends on both the current and previous inputs. This is typically captured using `always` blocks triggered by a clock edge.
   
4. **Combinational Logic**:
   - Describes circuits where the output is a direct function of the inputs without any memory or state elements, often described using `assign` statements or `always` blocks sensitive to input changes.

#### FSM (Finite State Machine) Design

1. **FSM Components**:
   - **States**: Represent different modes of operation.
   - **State Transitions**: Conditions under which the FSM switches from one state to another.
   - **Input**: Signals that affect state transitions.
   - **Output**: Signals that represent the state's output or actions.

2. **FSM Design Patterns**:
   - **Moore Machine**: Outputs depend only on the current state.
   - **Mealy Machine**: Outputs depend on the current state and input signals.

3. **Common State Definitions for Serial Receivers**:
   - **Idle**: Waiting for the start bit.
   - **Start Bit Detected**: Detects the start bit and shifts into the data-receiving state.
   - **Receiving Data**: Shifts in the serial data bits.
   - **Parity Bit Check**: Checks the parity bit.
   - **Stop Bit Verification**: Verifies the stop bit.
   - **Done**: Indicates successful reception of data and parity check.

#### Parity Checking

1. **Parity Bit**: 
   - An extra bit added to data to make the number of 1s either even (even parity) or odd (odd parity).
   
2. **Odd Parity Checking**:
   - Ensures the total count of 1s in the transmitted bits (including the parity bit) is odd.

#### Best Practices

1. **Reset Logic**:
   - Always include a reset mechanism, typically synchronous or asynchronous, to initialize the state of the circuits.

2. **Clock Domain**:
   - Ensure that all sequential elements use the same clock signal or are appropriately synchronized across different clock domains.

3. **State Encoding**:
   - Use meaningful labels for state encoding to improve readability and maintainability.

4. **Modular Design**:
   - Design complex systems using smaller sub-modules to improve readability and reusability.

5. **Test Benches**:
   - Create comprehensive test benches to simulate and validate each module.

#### Structured Information for a Serial Receiver with Parity Checking

1. **Inputs and Outputs**:
   - **Inputs**: `clk`, `reset`, `in` (serial data input).
   - **Outputs**: `out_byte` (received data byte), `done` (indicates successful reception and parity check).

2. **Datapath Components**:
   - **Shift Register**: To load and shift incoming serial data bits.
   - **Parity Module**: To calculate and verify parity.
   - **Control Logic**: To manage state transitions and signal the completion of reception.

3. **FSM States**:
   - **IDLE**: Waiting for the start bit.
   - **START**: Start bit detected.
   - **DATA**: Receiving data bits.
   - **PARITY**: Checking the parity bit.
   - **STOP**: Verifying the stop bit.
   - **DONE**: Valid reception with correct stop and parity bits.
   
4. **FSM Transitions**:
   - **IDLE to START**: Transition when start bit detected (0).
   - **START to DATA**: Transition after start bit detection.
   - **DATA**: Shift each incoming bit until all data bits are received.
   - **DATA to PARITY**: Transition after receiving all data bits.
   - **PARITY to STOP**: Transition after parity verification.
   - **STOP to DONE**: Transition if stop bit (1) is detected; if not, loop back to IDLE or PARITY depending on parity result.

5. **Parity Calculation and Verification**:
   - Use a TFF (Toggle Flip-Flop) module to count the number of 1 bits.
   - Reset the TFF at the beginning of each byte reception.
   - After the parity bit, verify that the TFF output matches the expected odd parity condition.

By adhering to these principles and structured information, one can design efficient and reliable Verilog modules for various digital systems.

Task:
// We want to add parity checking to the serial receiver. Parity checking adds one extra bit after each data byte. We will use odd parity, where the number of 1s in the 9 bits received must be odd. For example, 101001011 satisfies odd parity (there are 5 1s), but 001001011 does not.

// Change your FSM and datapath to perform odd parity checking. Assert the done signal only if a byte is correctly received and its parity check passes. Like the serial receiver FSM, this FSM needs to identify the start bit, wait for all 9 (data and parity) bits, then verify that the stop bit was correct. If the stop bit does not appear when expected, the FSM must wait until it finds a stop bit before attempting to receive the next byte.

// You are provided with the following module that can be used to calculate the parity of the input stream (It's a TFF with reset). The intended use is that it should be given the input bit stream, and reset at appropriate times so it counts the number of 1 bits in each byte.

module parity (
    input clk,
    input reset,
    input in,
    output reg odd);

    always @(posedge clk)
        if (reset) odd <= 0;
        else if (in) odd <= ~odd;

endmodule

// Note that the serial protocol sends the least significant bit first, and the parity bit after the 8 data bits.

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Insert your code below

    // Modify FSM and datapath from Fsm_serialdata

    // New: Add parity checking.

endmodule
