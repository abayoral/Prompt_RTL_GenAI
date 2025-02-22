// Your task is to construct a 32-bit global history shift register designed to maintain and update branch history information. The system must have the capability to accurately adjust its state in cases where a pipeline flush is necessary due to a branch misprediction. 

// Consider the following operations to be implemented within the module:

// 1. **Branch Prediction Update:** Whenever a branch prediction occurs (indicated by `predict_valid` being set to 1), the system should update the branch history. This update involves shifting the existing history to the left and inserting the `predict_taken` value at the least significant bit (LSB) position. This operation ensures that `predict_history[0]` constantly reflects the direction of the most recent branch.

// 2. **Misprediction Handling:** In situations where a branch misprediction is detected (`train_mispredicted` equals 1), the system must restore the branch history register to reflect the state immediately following the completion of the mispredicted branch. This restoration takes place by combining the previous history state before the mispredicted branch (`train_history`) with the actual outcome of this branch, `train_taken`. 

// 3. **Conflict Resolution:** If both a prediction and a misprediction occur simultaneously, priority must be given to the misprediction correction. This priority is necessary because the associated pipeline flush will invalidate the branch currently under prediction.

// 4. **Predict History Output:** The `predict_history` signal will continuously provide the current state of the branch history register.

// 5. **Asynchronous Reset Capability:** The module should incorporate an asynchronous reset input, `areset`, which is responsible for resetting the branch history register to zero, allowing the system to start from a known baseline state upon initialization or error recovery.

// The goal is to encapsulate this logic within the module template provided:

```verilog
module top_module(
    input clk,                   // Clock signal for synchronous operations
    input areset,                // Asynchronous reset input to clear the history

    input predict_valid,         // Signal indicating a branch prediction is valid
    input predict_taken,         // Actual outcome of the predicted branch
    output [31:0] predict_history, // Output reflecting the current global history

    input train_mispredicted,    // Signal indicating a branch misprediction
    input train_taken,           // True outcome of the mispredicted branch
    input [31:0] train_history   // Previous history state used to restore on misprediction
);

// Insert your implementation here

endmodule
```

// With these requirements in mind, proceed to design the logic necessary to fulfill each outlined functionality inside the module.