You are tasked with implementing a BCD (binary-coded decimal) ripple-carry adder in Verilog using an existing BCD one-digit adder module called `bcd_fadd`. This module adds two BCD digits (each represented as a 4-bit binary number) along with a carry-in input and produces a 4-bit sum and a carry-out. Here is the `bcd_fadd` module definition:

```verilog
module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input       cin,
    output      cout,
    output [3:0] sum
);
```

Your task is to instantiate four copies of `bcd_fadd` to create a 4-digit BCD ripple-carry adder. This new adder will take two 4-digit BCD numbers (each packed into a 16-bit vector) and a carry-in input, and will output the resulting 4-digit BCD sum (also as a 16-bit vector) and a final carry-out.

The top-level module definition is given as follows:

```verilog
module top_module ( 
    input [15:0] a, 
    input [15:0] b,
    input       cin,
    output      cout,
    output [15:0] sum
);
    // Insert your code here
endmodule
```

In the `top_module`, you need to:

1. Break down the 16-bit input vectors `a` and `b` into four individual 4-bit BCD digits each.
2. Instantiate four `bcd_fadd` modules, each responsible for adding corresponding pairs of BCD digits from `a` and `b`, along with the appropriate carry-in.
3. Chain the carry-out from each `bcd_fadd` module to the carry-in of the next `bcd_fadd` module to form a ripple-carry adder structure.
4. Collect the 4-bit sums from each `bcd_fadd` module to form the final 16-bit sum output.
5. Set the final carry-out appropriately.

Implement this functionality within the `top_module` such that it correctly adds two 4-digit BCD numbers and provides the correct outputs.