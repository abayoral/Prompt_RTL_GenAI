### Chain of Thought:

1. **Understand the Requirements:**
   - We have a 512-cell array that represents a one-dimensional cellular automaton following Rule 90.
   - Rule 90's next state for each cell is determined by the XOR of its two current neighbors.
   - During each clock cycle, the output array `q` needs to update to the next state.
   - There is a load input to initialize the state of the system with provided data.
   - The boundaries (`q[-1]` and `q[512]`) are both considered to be zero (off).

2. **Determine the Inputs and Outputs:**
   - Inputs:
     - `clk`: Clock signal to trigger state updates.
     - `load`: Input signal to load initial data.
     - `data[511:0]`: Input data to initialize the state of the system.
   - Output:
     - `q[511:0]`: The current state of the system.

3. **Define Intermediate Signals:**
   - A register to hold the state of the cellular automaton: `reg [511:0] current_state`.
   - A register to hold the next state of the cellular automaton: `reg [511:0] next_state`.

4. **Structuring the Module:**
   - **Module Declaration:**
     - Start with the module declaration specifying the inputs and outputs.
   - **State Initialization:**
     - Use an always block triggered on the rising edge of the clock (`clk`).
     - Inside this always block, first check if the `load` signal is high. If it is, assign the input `data` to `current_state`. This sets the initial state of the automaton to the provided data.
   - **State Update Mechanism:**
     - If `load` is low, calculate the `next_state` based on the current state (`current_state`):
       - Use a for loop to iterate through each cell from 0 to 511.
       - For each cell, compute its next state as the XOR of its left (`current_state[i-1]`) and right (`current_state[i+1]`) neighbors. Handle the boundary conditions separately by assuming the neighbors outside the array are zero.
     - Assign `next_state` to `current_state` for the next clock cycle update.
   - **Output Assignment:**
     - Assign the `current_state` to the output `q`.

By organizing the thoughts in this way, it ensures that the Verilog module will correctly implement a 512-cell system following Rule 90 and update the state according to the given rules properly.