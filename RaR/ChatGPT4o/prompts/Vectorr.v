Given an 8-bit input vector `in` represented as `in[7:0]`, the task is to produce an output vector `out` that has the bits of `in` reversed in order. This means the least significant bit of `in` should become the most significant bit of `out`, and vice versa, essentially flipping the bit positions. The challenge here is to efficiently reverse the bits without manually reassigning each bit, leveraging Verilog's language constructs.

**Hint:** Direct assignment as in `assign out[7:0] = in[0:7];` is not permissible because Verilog syntax does not support this style of vector bit order reversal. The goal can be achieved more succinctly with the use of the concatenation operator `{}` to streamline the assignment in a single statement, which would simplify the code significantly compared to assigning each bit individually.

Your task is to write the appropriate Verilog code inside the given module template to achieve this bit reversal.

```verilog
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    // Insert your code here
endmodule
```

Ensure your solution efficiently reverses the 8-bit input vector `in` to produce the reversed 8-bit output `out` using the most concise method available in Verilog.