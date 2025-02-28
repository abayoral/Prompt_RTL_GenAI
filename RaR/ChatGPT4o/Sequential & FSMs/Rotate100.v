As a Senior Digital Design Engineer at a prominent hardware design company, you have been assigned the crucial task of developing a Verilog module that is critical for the success of a next-generation product. The performance and functionality of this module are essential to uphold and enhance your company's esteemed reputation in the competitive computer hardware industry.

Your task is to create a sophisticated Verilog module for a 100-bit left/right rotator. A rotator is distinct from a standard shifter because, instead of discarding the shifted-out bits and replacing them with zeros, it rotates these bits back into the opposite end of the register, thus preserving the entire set of data and maintaining its cyclic order. 

The module must incorporate the following features:

1. **Synchronous Load Functionality**: The register should have the capability to synchronously load a new set of 100-bit data (from `data[99:0]`) into the register when the load signal is asserted. This overrides any rotation operations and should update the register contents directly.

2. **Direction and Enable Control**: Utilize a 2-bit enable control signal (`ena[1:0]`) to determine the rotation behavior:
   - When `ena` equals `2'b01`, the rotator should perform a right rotation by one bit position, moving the LSB to the MSB position.
   - When `ena` equals `2'b10`, the device should execute a left rotation by one bit position, shifting the MSB to the LSB position.
   - If `ena` is set to `2'b00` or `2'b11`, the module should remain in its current state without performing any rotations.

3. **Output Representation**: The current state of the rotator, whether newly loaded or rotated, should be accurately reflected by the output `q[99:0]`, which represents the contents of the rotator.

This implementation should be synchronous with a clock signal (`clk`), ensuring all operations are precisely timed and consistent with the clock's rising or falling edges. The integration of this rotator into the overall system design is a pivotal component for the future product lines, necessitating meticulous attention to detail and rigorous testing to meet the high standards expected of your company.