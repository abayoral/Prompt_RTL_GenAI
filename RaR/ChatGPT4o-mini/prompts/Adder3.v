The task requires you to design a 3-bit binary ripple-carry adder by utilizing three instances of a full-adder module. This adder will take in two 3-bit binary numbers and an initial carry-in to produce a 3-bit sum and a carry-out value. To ensure that individual full adders are instantiated and their carry-out values are visible, it is essential to output the carry-out values from each full adder within the ripple-carry adder structure. Specifically, the last carry-out from the third full adder, labeled as cout[2], is the final carry-out that is traditionally observed. Consequently, your goal is to instantiate these full-adders and wire them appropriately to achieve functional adder behavior while also outputting intermediate carry-out values for verification.

With this understanding, please provide the necessary code to implement this functionality within the given module template:

```verilog
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    // Insert your code here

endmodule
```