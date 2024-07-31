Chain of Thought:

1. **Understand the Requirements:**
    - Implement a GShare branch predictor.
    - Use a 7-bit PC and a 7-bit global history register, hashed into a 7-bit index using XOR for prediction.
    - 128-entry table of two-bit saturating counters for prediction states.
    - Two sets of interfaces: one for prediction, another for training.
    - Handle asynchronous reset to a default state.

2. **Determine the Inputs and Outputs:**
    - **Inputs:**
        - `clk` (clock signal).
        - `areset` (asynchronous reset).
        - `predict_valid` (validity of prediction request).
        - `predict_pc` (program counter for prediction).
        - `train_valid` (validity of training request).
        - `train_taken` (actual outcome of the branch).
        - `train_mispredicted` (flag for misprediction).
        - `train_history` (branch history register for training branch).
        - `train_pc` (program counter for training branch).
    - **Outputs:**
        - `predict_taken` (predicted branch direction).
        - `predict_history` (current state of the branch history register).

3. **Define Intermediate Signals:**
    - A 7-bit register to hold the Global History Register (GHR).
    - A 128-entry table of 2-bit saturating counters.
    - Internal signals for hash index calculation, hold the predicted value and the state before training updates.

4. **Structuring the Module:**
    1. **Module Declaration:** Initialize the module with inputs and outputs as specified.
    2. **Asynchronous Reset:** 
       - Clear the PHT to 2'b01 (weakly not-taken).
       - Clear the GHR to 0.
    3. **Prediction Logic (in fetch stage):**
       - Check if `predict_valid` is high.
       - Calculate the index by XORing the predict_pc and GHR.
       - Fetch the prediction from the PHT.
       - Output the predicted direction and current GHR.
       - Update GHR on the next positive clock edge based on the prediction.
    4. **Training Logic (in execution stage):**
       - Check if `train_valid` is high.
       - Calculate the index using `train_pc` and `train_history`.
       - Fetch and update the PHT entries as per the actual outcome (`train_taken`).
       - If `train_mispredicted` is high, recover the GHR to the state after the mispredicting branch.

    5. **Precedence Logic:**
       - Ensure training updates take precedence over predictions if they occur in the same cycle.
       - Use non-blocking assignments to ensure correct timing of updates to the GHR and PHT.

5. **Detailed Pseudocode Steps:**
    - On asynchronous reset (`areset`): initialize all PHT entries to 2'b01 and set GHR to 0.
    - On each clock cycle, execute:
        - **For Prediction:**
            - If `predict_valid`:
                - Calculate index by XORing predict_pc and GHR.
                - Fetch the value from PHT at calculated index.
                - Set `predict_taken` based on fetched value.
                - Output current GHR state as `predict_history`.
                - Update GHR for the next prediction.
        - **For Training:**
            - If `train_valid`:
                - Calculate index by XORing train_pc and train_history.
                - Fetch and update the PHT at calculated index:
                    - Increment or decrement the PHT entry based on `train_taken`.
                - If `train_mispredicted`:
                    - Recover the GHR state to the one after the mispredicting branch.
    - Ensure the training update affects the table in the following cycle to accommodate simultaneous prediction and training requests correctly.