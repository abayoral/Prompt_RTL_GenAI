To build a detailed and effective gshare branch predictor, let’s break down all the requirements step by step and elaborate on the features needed. The given task involves the creation of a branch predictor with an XOR-based index mechanism and a specific way of handling both predictions and training, including managing a global history register. Here’s a comprehensive clarification and expansion of the task requirements.

**Task: Creating a Gshare Branch Predictor**

**Key Components and Their Functions:**

1. **Program Counter (PC) and Global History Register (GHR):**
   - The PC and GHR are both 7 bits wide.
   - The GHR is used to maintain the history of branch outcomes.

2. **Index Calculation:**
   - Combine the 7-bit PC and the 7-bit GHR using an XOR operation to create a 7-bit index.
   - This 7-bit index is used to access a Pattern History Table (PHT).

3. **Pattern History Table (PHT):**
   - The PHT consists of 128 entries, each entry being a 2-bit saturating counter.
   - Two-bit saturating counters can be in one of four states: strongly taken, weakly taken, weakly not-taken, and strongly not-taken.

4. **Prediction Interface:**
   - When `predict_valid` is high, the predictor provides the branch direction prediction (`predict_taken`) and the state of the GHR (`predict_history`).
   - The GHR is updated at the next positive clock edge.

5. **Training Interface:**
   - When `train_valid` is high, the predictor is provided with the true branch outcome (`train_taken`), whether it was a misprediction (`train_mispredicted`), the GHR value used for the prediction (`train_history`), and the PC of the branch being trained (`train_pc`).
   - The PHT entry corresponding to the branch should be updated based on the true outcome.

6. **Handling Mispredictions:**
   - If a branch was mispredicted (`train_mispredicted`), the GHR must be restored to the state it was in immediately after the mispredicted branch.
   
7. **Conflict Resolution:**
   - If a training and prediction operation occurs in the same cycle, training takes precedence because the incorrect prediction would lead to a pipeline flush.
   - If training and prediction access the same PHT entry, the prediction gets the PHT state before the training because updates to the PHT occur at the next positive clock edge.

8. **Asynchronous Reset:**
   - `areset` is an asynchronous reset signal that initializes all entries in the PHT to '01' (weakly not-taken) and clears the GHR to 0.

**Interface Signals:**

1. **Inputs:**
   - `clk`: Clock signal.
   - `areset`: Asynchronous reset signal.
   - `predict_valid`: Prediction request signal.
   - `predict_pc`: Program counter for the prediction request.
   - `train_valid`: Training request signal.
   - `train_taken`: Actual outcome of the branch being trained.
   - `train_mispredicted`: Indicates if the branch was mispredicted.
   - `train_history`: GHR value used for the prediction of the branch being trained.
   - `train_pc`: PC of the branch being trained.

2. **Outputs:**
   - `predict_taken`: Predicted branch direction.
   - `predict_history`: GHR value used to make the prediction.

**Example Verilog Code Structure:**

```verilog
module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output predict_taken,
    output [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);

    // Define internal registers and logic here:
    // - 7-bit Global History Register (GHR)
    // - 128-entry 2-bit Pattern History Table (PHT)
    // - Functions to calculate prediction and perform training
    // - Asynchronous reset logic

    // Implement the XOR-based index calculation
    // Implement the functionality to access and update the PHT
    // Properly handle mispredictions and global history register updates
    // Ensure correct handling of asynchronous reset (areset)

    // Your detailed Verilog design implementation goes here

endmodule
```

### Additional Considerations:

- **Concurrency Control:** Carefully manage access to the GHR when predictions and training requests occur simultaneously.
- **State Updates:** Ensure the PHT and GHR are updated correctly at the appropriate clock edges.
- **Reset Handling:** Clearly articulate how the asynchronous reset affects the PHT and GHR.

With this structure and these considerations, the gshare branch predictor can be effectively implemented to meet the specified requirements. The detailed design and implementation of the internal logic are to be added within the Verilog module as per the problem description.