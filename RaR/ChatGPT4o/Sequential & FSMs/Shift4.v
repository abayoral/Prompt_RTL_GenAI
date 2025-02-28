You are employed as a senior Digital Design Engineer at a prominent hardware design organization. Your current project involves developing a crucial Verilog module that will be integral to the performance of an upcoming product, which is essential for sustaining your company's esteemed position within the competitive computer hardware industry. 

Your specific task is to design a 4-bit shift register that shifts its data to the right. The design should incorporate an asynchronous reset feature, a synchronous load capability, and an enable functionality. Below are the detailed specifications and functionalities that the module must exhibit:

- **Asynchronous Reset (`areset`)**: The shift register must reset all its contents to zero immediately when this signal is asserted, regardless of the clock state.

- **Synchronous Load (`load`)**: The shift register must load its contents with the 4-bit input data (`data[3:0]`) on the rising edge of the clock whenever this signal is asserted. The loading of data takes precedence over the shifting operation if both `load` and `ena` are active simultaneously.

- **Enable (`ena`)**: When this signal is asserted, the shift register should shift its contents one bit to the right on the rising edge of the clock. Specifically, the bit at `q[3]` should be set to zero, and `q[0]` should be shifted out of the register and effectively discarded.

- **Output (`q`)**: This represents the current state of the contents of the shift register after any operations (reset, load, or enable) have been performed.

Your challenge is to develop this module while ensuring that all the described functionalities work seamlessly together, particularly in scenarios where multiple control signals might be active, ensuring the designed priority of operations (load over shift) is maintained. 

```verilog
module top_module(
    input clk,           // Clock input
    input areset,        // Asynchronous active-high reset to zero
    input load,          // Synchronous load control signal
    input ena,           // Enable signal for shifting operation
    input [3:0] data,    // 4-bit data input for loading into the shift register
    output reg [3:0] q   // 4-bit output representing the shift register's contents
);

// Insert your code here

endmodule
```

By carefully considering and implementing these requirements, you will contribute to the successful development of this much-anticipated product line.