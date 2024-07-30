To approach this task, here's a structured reasoning that a hardware designer might use to come up with the Verilog module for a finite state machine (FSM) to detect the PS/2 mouse message boundaries. The main goal here is to identify the correct boundaries in the byte stream and signal `done` after the third byte of each message is received.

### Chain of Thought:

1. **Understand the Requirements:**
    - We need to identify PS/2 mouse messages, which are 3 bytes long.
    - Every first byte of the message has bit 3 (`in[3]`) set to 1.
    - The FSM should output `done` immediately after the third byte of each message is received.

2. **Determine Inputs and Outputs:**
    - **Inputs:**
        - `clk`: Clock signal.
        - `in[7:0]`: Byte input stream (we specifically examine `in[3]`).
        - `reset`: Synchronous reset.
    - **Output:**
        - `done`: Signals the receipt of a complete message.

3. **Define Intermediate Signals and States:**
    - We likely need around 4 states to manage the FSM properly:
        1. **IDLE**: Waiting for the start of a message (waiting for `in[3]` = 1).
        2. **BYTE1**: First byte of the message detected.
        3. **BYTE2**: Second byte of the message.
        4. **BYTE3**: Third byte of the message; `done` is asserted here.

4. **Structuring the FSM Module:**
    - **State Transition Logic (combinational):**
        - Transition from `IDLE` to `BYTE1` on detecting `in[3]` set to 1.
        - Transition from `BYTE1` to `BYTE2` on the next clock cycle.
        - Transition from `BYTE2` to `BYTE3` on the following clock cycle.
        - Transition from `BYTE3` back to `IDLE` after asserting `done`.
    - **Output Logic:**
        - Assert `done` only when the FSM is in state `BYTE3`.

5. **State Flip-Flops (sequential):**
    - Use D flip-flops to store the current state.
    - Synchronous reset to the `IDLE` state on the reset signal.

### Detailed Steps in Pseudocode:

1. **State Definitions:**
    - Define states: IDLE, BYTE1, BYTE2, BYTE3.

2. **State Transition Logic:**
    - In the IDLE state:
        - If `in[3]` is 1, transition to BYTE1.
        - Otherwise, remain in IDLE.
    - In the BYTE1 state:
        - Transition to BYTE2 unconditionally.
    - In the BYTE2 state:
        - Transition to BYTE3 unconditionally.
    - In the BYTE3 state:
        - Transition back to IDLE and assert `done`.

3. **Output Logic:**
    - `done` is asserted when in state BYTE3.

4. **Sequential Logic:**
    - Use flip-flops to update the state on the rising edge of the clock.
    - Implement synchronous reset to go to IDLE.

By following these steps, one can design a finite state machine that correctly identifies message boundaries in the PS/2 mouse data stream and asserts `done` as required.