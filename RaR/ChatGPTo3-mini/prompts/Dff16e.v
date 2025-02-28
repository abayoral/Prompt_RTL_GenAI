Could you please create a Verilog module for a group of 16 D flip-flops with specific control mechanisms? Here are the detailed requirements and conditions for the setup:

1. **Group Details**: The module should consist of 16 D flip-flops.
2. **Byte-Enable Control**: It should be possible to selectively modify portions of the flip-flop group during a cycle:
    - `byteena[1]` controls whether the upper byte (`d[15:8]`) should be written to.
    - `byteena[0]` controls whether the lower byte (`d[7:0]`) should be written to.
3. **Reset Mechanism**: The reset (`resetn`) is synchronous and active-low, meaning that the flip-flops will reset when `resetn` is low, synchronized to the clock signal.
4. **Clock Trigger**: All D flip-flops should be triggered by the positive edge of the clock (`clk`).

Inputs and Outputs:
- **Inputs**:
  - `clk` (Clock signal)
  - `resetn` (Synchronous, active-low reset)
  - `byteena` (2-bit control for byte-enable inputs)
  - `d` (16-bit data input)
- **Outputs**:
  - `q` (16-bit data output representing the state of the flip-flops)

Your task is to write the Verilog code for the `top_module` that adheres to the specifications. Be sure to include appropriate synchronous reset logic and conditional assignments based on the byte-enable inputs. The module declaration is as follows:

```verilog
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);

// Insert your code here

endmodule
```