Imagine you are serving as a senior Digital Design Engineer at a prominent hardware design firm, facing a high-priority assignment to develop a key component in a next-generation product. The module you design will be vital, as its flawless performance is crucial to sustaining the reputation and competitive edge of our computer hardware company.

Your objective is to design a Verilog module that implements a 4-bit right shift register with several specified controls:

• The module must include an asynchronous reset (areset) that immediately clears the register (sets its contents to 0) regardless of the clock.

• There is a synchronous load capability (load) that, when active, should load the register with a new 4-bit value provided by the input vector named data. This load operation occurs in sync with the clock signal.

• A shifting mechanism (ena, for enable) is also required. When ena is high, the register performs a right shift such that the most significant bit (q[3]) is set to zero and the least significant bit (q[0]) is shifted out of the register.

• In the scenario where both load and ena are simultaneously active (logical high), the load function must preempt the shift operation, meaning that the register should load the new data rather than performing any shift.

The module is defined using the following interface:

module top_module(
    input clk,           // Clock signal
    input areset,        // Asynchronous active-high reset; clears shift register to zero
    input load,          // Synchronously loads the shift register with the new data [3:0]
    input ena,           // Enables the right shift operation (shifts in a zero at q[3])
    input [3:0] data,    // 4-bit data input used when load is active
    output reg [3:0] q   // Current state/output of the shift register
);

    // Your code will be inserted here

endmodule

Focus on accurately implementing these functionalities in your Verilog design without ambiguity, ensuring that the priority rules are correctly handled and that the module aligns with the detailed specifications provided.