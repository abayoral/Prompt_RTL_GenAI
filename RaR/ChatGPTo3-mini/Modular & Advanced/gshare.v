Below is an expanded and reformulated version of the design task without revealing any implementation details:

Imagine you are a senior Digital Design Engineer at a prominent hardware design company. Your mission is to design a critical Verilog module that implements a gshare branch predictor. The module plays a key role in ensuring that your company's next-generation computer hardware product performs at the highest level, thereby maintaining its industry reputation.

The branch predictor must be built using a 7-bit program counter (PC) and a 7-bit global history register. The two values are combined using an XOR operation (i.e., a hashed blend) to generate a 7-bit index. This index is used to access a table containing 128 entries, where each entry is a two-bit saturating counter. Along with the table, the module should store a separate 7-bit global branch history register that records branch outcomes.

The predictor module supports two distinct interfaces:

1. Prediction Interface:
   • In the Fetch stage of the processor, when a branch prediction is requested (indicated by predict_valid = 1), the module must use the provided 7-bit pc (predict_pc) to compute the relevant index and then deliver a predicted branch direction.
   • Along with the direction, it should output the state of the branch history register that was used for that prediction.
   • After a prediction is made, the branch history register will be updated on the next rising clock edge based on the predicted branch outcome.

2. Training Interface:
   • Once the actual branch outcome becomes known after the instruction is executed, the module is trained using the true branch result.
   • When a training operation is indicated (train_valid = 1), the module receives the pc (train_pc) and the branch history register value (train_history) that were in effect during the prediction.
   • It is then provided with the actual outcome (train_taken) and a flag (train_mispredicted) that states if the branch was mispredicted and required a pipeline flush.
   • The module must update the pattern history table (PHT) appropriately to reflect the correct direction for future predictions.
   • In the event that the training corresponds to a mispredicted branch, the module will also restore the global branch history register to the state that existed immediately after the mispredicted branch was executed.

Additional Timing and Priority Considerations:
• If in a given cycle both a training operation for a mispredicted branch and a prediction for a different, younger branch occur concurrently—and both operations conflict over writing the branch history register—the training operation should have precedence. This is because the younger branch prediction will be discarded due to pipeline flush.
• In a scenario where both prediction and training target the same PHT entry during the same cycle, the output for the prediction should reflect the PHT state before the training update occurs. Keep in mind that the update to the PHT from training takes effect only after the next positive clock edge.
• The provided timing diagram (conceptually described) indicates that when a training request updates a PHT entry at cycle 4, the training effect is visible in cycle 5. In the same cycle (cycle 4), if there is a prediction request, it should output the PHT state as it was before the training update.

Reset Conditions:
• An asynchronous reset signal (areset) must be handled such that, when asserted, the module clears the entire Pattern History Table by setting every two-bit saturating counter to the value 01 (weakly not-taken).
• Additionally, the reset should initialize the global branch history register to 0.

Module Interface:
The top-level module is defined with the following I/O ports:

• clk: The clock signal.
• areset: Asynchronous reset input.
• predict_valid: Signal to indicate that a branch prediction is requested.
• predict_pc (7 bits): The program counter value provided for the prediction.
• predict_taken: Output signal providing the predicted branch direction.
• predict_history (7 bits): Output signal indicating the branch history value used for the prediction.
• train_valid: Signal to indicate that a branch training operation is requested.
• train_taken: The actual branch outcome provided during training.
• train_mispredicted: Flag to indicate that a misprediction has occurred (necessitating pipeline flush).
• train_history (7 bits): The branch history value used during the branch execution for which training is now being applied.
• train_pc (7 bits): The program counter value corresponding to the branch being trained.

Your task is to implement such a module in Verilog, ensuring that it correctly manages both prediction and training operations as described, including proper handling of simultaneous updates, asynchronous reset conditions, and the specific timing of when branch history and PHT updates occur.

Remember, this problem focuses entirely on implementing the described branch predictor logic. Your response should provide a Verilog module template, and you must fill in the necessary logic to satisfy all the requirements as specified in the expanded design document above.