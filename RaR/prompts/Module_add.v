You are provided with a module named `add16` that performs addition on 16-bit numbers. The `add16` module takes as inputs two 16-bit numbers `a` and `b`, and a carry-in bit `cin`. It outputs a 16-bit sum `sum` and a carry-out bit `cout`.

Your task is to create a new module named `top_module` that utilizes two instances of the `add16` module to construct a 32-bit adder. This `top_module` should take as inputs two 32-bit numbers `a` and `b`, and it should output a 32-bit sum `sum`. 

Here is an outline of how this should be done:
1. Use one instance of the `add16` module to compute the sum of the lower 16 bits of `a` and `b`. The carry-in (`cin`) for this addition is set to 0.
2. Use another instance of the `add16` module to compute the sum of the upper 16 bits of `a` and `b`, taking into account the carry-out (`cout`) from the first `add16` instance as its carry-in.

The `top_module` does not need to handle a carry-in for the overall 32-bit addition operation (i.e., it can be assumed to be 0), and the carry-out from the 32-bit addition can be ignored. However, the internal `add16` modules should properly handle carry-in and carry-out to ensure correct 32-bit addition.

The provided `add16` module has the following declaration, and you need to connect them correctly to create the full 32-bit adder:

```verilog
module add16 (
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);
```

In the `top_module` declaration:
- The inputs are two 32-bit numbers `a` and `b`.
- The output is a 32-bit number `sum`.

You need to correctly instantiate and connect the two `add16` modules within the `top_module` to achieve the desired 32-bit addition functionality.

```verilog
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    // Insert the code here
endmodule
```

Make sure to appropriately define the intermediate signals and connect the two `add16` modules so that they function together to compute the final 32-bit sum.