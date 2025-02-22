// Design a digital circuit to implement a 4-bit right shift register with the following features:
// - Asynchronous reset (areset): When this signal is active high, it should immediately reset the shift register, setting all bits to zero, regardless of the clock.
// - Synchronous load (load): When this signal is active high, on the next clock edge, the data inputs (data[3:0]) should be directly loaded into the shift register, overwriting any current contents.
// - Enable (ena): If this signal is active high, and load is not active, the shift register should perform a right shift operation during the next clock cycle. This means that the value of q[0] is lost, q[1] shifts to q[0], q[2] moves to q[1], q[3] moves to q[2], and q[3] should be set to zero. This does not happen if load is active, as the load operation takes precedence.
// - If both the load and ena signals are asserted during the same clock cycle, the load operation should be prioritized, meaning the shift register will load the data instead of performing a shift.
// - The output q is a 4-bit register that holds the current state of the shift register.

// Create a Verilog module named top_module with the specified input and output ports and define the internal logic that meets the above requirements: 
// - The module should include an input clock signal (clk) to synchronize operations.
// - Implement a simple, asynchronous active-high reset (areset) to clear q to all zeros.
// - Include the logic to handle both the loading and shifting operations, considering the priority given to loading when both load and ena are high.