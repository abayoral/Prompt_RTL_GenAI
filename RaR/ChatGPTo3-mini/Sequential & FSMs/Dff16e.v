Imagine you are a senior Digital Design Engineer charged with developing a crucial Verilog module for a next-generation hardware product. This module is a key component in maintaining your company’s reputation as a leading innovator in computer hardware design. The assignment involves creating an array of 16 D-type flip-flops that are organized into a 16-bit register. However, in this design, there is a need for fine-grained control over which portions of the register are updated. 

To address this, the module must include two byte-enable inputs (byteena[1:0]). These inputs determine whether specific bytes of the 16-bit register are written during any given clock cycle. In particular, byteena[1] governs the upper byte (bits 15 down to 8) while byteena[0] governs the lower byte (bits 7 down to 0), allowing for selective updating of either byte or both concurrently.

In addition, the module must incorporate a synchronous and active-low reset signal, resetn. This means that when resetn is asserted (i.e., when it is low), the register should be reset appropriately, and this reset action occurs in synchronization with the positive clock edge.

All operations within this module—including the state updates of the flip-flops as well as the handling of the synchronous active-low reset—should occur on the rising edge of the clock signal (clk).

Your task is to develop the Verilog code for this module using the provided module skeleton. The code must instantiate and correctly connect these 16 D flip-flops, account for the selective writing enabled by the byteena inputs, and incorporate the synchronous active-low reset behavior as specified. 

Please provide only the problem expansion and rephrasing without any implementation or solutions.