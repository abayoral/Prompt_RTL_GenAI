Please provide a detailed Verilog implementation of a D flip-flop within the provided `top_module` template. The D flip-flop should store and output the value of the `d` input when the `ena` (enable) signal is high. Note that since the D flip-flop acts as a latch, you may encounter a Quartus warning indicating that a latch has been inferred; this is expected behavior, so you should account for it in your design. Ensure that your code correctly reflects the traditional behavior of a D flip-flop, where the output `q` follows the input `d` when `ena` is active, and retains its previous state when `ena` is inactive.

Here is the module template for your reference:

```verilog
module top_module (
    input d, 
    input ena,
    output q);

// Insert your code here

endmodule
```

Make sure to properly handle the state retention and updating aspects within your design.