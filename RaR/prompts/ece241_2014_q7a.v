Imagine you are tasked with designing a digital 1-12 counter system using specific inputs and outputs, which need to integrate a provided 4-bit binary counter module. The task involves the following components and functionalities which need to be addressed:

**Inputs:**
1. **Reset:** This is a synchronous active-high reset signal used to immediately reset the counter to the value of 1 whenever it is high.
2. **Enable:** This signal, when set high, activates the counter allowing it to run or count based on the clock cycles.
3. **Clk (Clock):** A positive edge-triggered clock input, which synchronizes the counting process based on its rising edge.

**Outputs:**
1. **Q[3:0]:** This represents the 4-bit output of your counter, reflecting the current counted value in binary form.
2. **c_enable, c_load, c_d[3:0]:** These are critical control output signals that are intended to interface with and control the operations of the provided 4-bit counter module (`count4`). They are essential for allowing verification of the correct functioning of internal counter operations:

   - **c_enable:** Should reflect whether the internal counter's enable input is activated.
   - **c_load:** Indicates a load operation when the internal counter should load a specific value.
   - **c_d[3:0]:** Defines the value to be loaded into the internal counter when this load operation is triggered.

**Components Provided:**
1. **count4 Module:** This existing module is a 4-bit binary counter equipped with built-in Enable and a synchronous parallel-load function. Note that the parallel-load function takes precedence over the Enable input, implying that when both are active, the counter will load the specified value rather than counting.

2. **Logic Gates:** Use these to design or manipulate control logic as needed to ensure the counter operates within the 1-12 range and interacts correctly with the `count4` module. These will assist in creating the necessary logic for resetting, enabling, and loading operations based on the current state and input signals.

**Objective:**
Your task is to construct a module named `top_module` that adheres to the above requirements. This module should correctly implement the logic to reset, enable, and count from 1 to 12 cyclically, while interfacing with `count4` using the control signals `c_enable`, `c_load`, and `c_d[3:0]`. The purpose of these control signals is both functional within the system and diagnostic to facilitate verification.

Be sure to leverage and instantiate the `count4` module appropriately within your `top_module` code, using the given framework and enforcing that all interactions, resets, and control signals align with the intended counting behavior.