// Design a Verilog module named `top_module` that contains eight D flip-flops. Each D flip-flop is equipped with an active high synchronous reset and is triggered by the positive edge of the clock signal (`clk`). The module should have three inputs and one output as described below:
//
// Inputs:
// - `clk`: The clock signal that triggers the flip-flops on its rising (positive) edge.
// - `reset`: The synchronous reset signal, which is active high. When this signal is asserted (logic high), it should reset all the flip-flops to a known state synchronously with the clock edge.
// - `d`: An 8-bit input bus representing the data to be stored in the D flip-flops.
//
// Output:
// - `q`: An 8-bit output bus representing the current state (output) of the eight D flip-flops.
//
// Within the module, you need to instantiate and connect the eight D flip-flops so that they operate synchronously with the clock signal. Each flip-flop should load its respective bit from the `d` input bus on the rising edge of the clock, unless the `reset` signal is asserted. If `reset` is high, all flip-flops should be reset to a known state on the rising edge of the clock.

module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);

	//Insert your code here

endmodule