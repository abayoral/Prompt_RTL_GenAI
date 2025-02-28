You are an experienced Digital Design Engineer at a prominent organization specializing in advanced hardware design. You have been assigned the important responsibility of crafting a critical Verilog module for a forthcoming, sophisticated product. The completion and success of this module are essential to uphold and enhance your computer hardware company's esteemed reputation within the industry.

The focus of this task is centered around implementing a mechanism for parity checking, which is widely utilized as a straightforward strategy for identifying errors that may occur during the transmission of data across unreliable communication channels. Your objective is to design and develop a circuit capable of computing a parity bit for an 8-bit byte, thereby extending the byte by incorporating a 9th bit. According to the specified requirements, "even" parity is to be employed. This approach involves calculating the parity bit as the exclusive OR (XOR) of all eight data bits.

Please provide a detailed solution within the Verilog module framework given below. Consider aspects such as defining the logic for computing the parity bit and how it integrates with the existing input and output signals.

```verilog
module top_module (
    input [7:0] in,   // Represents the 8-bit input data from which parity is to be computed
    output parity     // The calculated parity bit that ensures even parity for the entire 9-bit sequence
); 
    // Implement the circuit logic here
endmodule
```

Ensure that the solution reflects best practices in digital design and adheres to the specified requirements for error detection utilizing even parity.