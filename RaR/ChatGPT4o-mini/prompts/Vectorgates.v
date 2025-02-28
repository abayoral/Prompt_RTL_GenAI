Expand and clarify the request for building a circuit that handles specific operations on two 3-bit inputs:

---

Design and implement a digital circuit in Verilog that takes two 3-bit inputs, named `a` and `b`, and performs the following tasks:

1. **Bitwise OR Operation**: Compute the bitwise OR of the two 3-bit input vectors `a` and `b`. The result should be a 3-bit output vector named `out_or_bitwise`. In a bitwise OR operation, each bit of the result is 1 if at least one of the corresponding bits of the operands is 1.

2. **Logical OR Operation**: Compute the logical OR between `a` and `b`. The result should be a single-bit output named `out_or_logical`. In a logical OR operation, the result is 1 if either or both of the input vectors are non-zero (i.e., contain at least one bit that is 1).

3. **Inverse (NOT) Operation**:
   - Compute the bitwise NOT for both input vectors:
     - The bitwise NOT of vector `b` should be placed in the upper half (bits [5:3]) of a 6-bit output vector named `out_not`.
     - The bitwise NOT of vector `a` should be placed in the lower half (bits [2:0]) of the same 6-bit output vector `out_not`.

**Additional Information and Constraints**:
- Remember that in Verilog, you cannot assign a value to a wire more than once. 
- However, you can use part select operations on the left-hand side of an assignment to handle specific parts of a wire individually, which might be useful when assigning values to `out_not`.
- You are not required to assign to the entire vector in a single statement; you can assign to parts of the vector separately.

**Module Declaration and Inputs/Outputs**:
```verilog
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

// Insert your code here

endmodule
```

You need to complete this module by writing the necessary Verilog code to accomplish the described operations and produce the specified outputs.