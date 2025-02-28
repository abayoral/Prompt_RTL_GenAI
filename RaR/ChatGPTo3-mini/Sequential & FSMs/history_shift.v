Consider the following design challenge:

Imagine you are a senior Digital Design Engineer at a prestigious hardware design company. Your current project involves developing a vital Verilog module for a state-of-the-art product. The correct operation of this module is critical because it directly influences your company's reputation within the competitive computer hardware industry.

In this task, you are required to implement a 32-bit global history shift register that meets the following specifications:

1. The module must support two distinct operational scenarios:
   - When a branch prediction event occurs:
     • The signal predict_valid is asserted.
     • The bit predict_taken (representing the outcome of the predicted branch) is shifted into the shift register from the least-significant bit (LSB) side. Note that the bit at position 0 of predict_history reflects the most recent branch direction.
   - When a branch misprediction is detected:
     • The signal train_mispredicted is asserted.
     • The register should be immediately updated to the corrected branch history. This corrected history is formed by concatenating a given 31-bit history (train_history) with the actual outcome of the branch (train_taken). Essentially, the new branch history becomes the history up to—but not including—the mispredicted branch, with the mispredicted branch replaced by its actual result.

2. In situations where both prediction and misprediction events are triggered simultaneously, the misprediction event must have higher priority. This is because the pipeline flush associated with a misprediction will override any concurrent predictions.

3. Additionally, the module must incorporate an asynchronous reset (areset). Upon activation, this reset should immediately clear the branch history register (setting it to zero) without waiting for a clock edge.

The module’s interface includes the following ports:
• clk: Clock input.
• areset: Asynchronous reset input.
• predict_valid: Indicates when a branch prediction event occurs.
• predict_taken: Represents the direction of the predicted branch (to be shifted into the register).
• predict_history: The 32-bit current state of the branch history register.
• train_mispredicted: Indicates when a branch misprediction is detected.
• train_taken: Represents the actual outcome of the branch after a misprediction.
• train_history: A 32-bit value containing the branch history prior to the mispredicted branch.

Your design should correctly integrate these elements to form a reliable module that accurately tracks branch histories while handling both branch predictions and mispredictions according to the specifications provided.

Write the Verilog code for the module, ensuring that your implementation properly respects the conditions described above. Remember that while both events (prediction and misprediction) could occur concurrently, the misprediction must always take precedence.