/**
 * Create a 100-bit binary ripple-carry adder by instantiating 100 full adder components.
 * 
 * Description:
 * - The goal is to build a large binary adder that can handle 100-bit binary numbers.
 * - This adder should take in two 100-bit binary numbers (`a` and `b`) and a single-bit carry-in (`cin`).
 * - The output should include the resulting 100-bit sum (`sum`) and an array of carry-out bits from each of the full adder components (`cout`).
 * - `cout[99]` will represent the final carry-out produced by the last full adder, which is usually what you would see as the overall carry-out of the addition operation.
 * 
 * Requirements:
 * - Ensure that each full adder is individually instantiated within the module. 
 * - To simplify the instantiations of the full adders, consider using an instance array or generate statement.
 * - Each full adder in the chain should take inputs and produce outputs in a manner that appropriately cascades the carry from one adder to the next.
 * 
 * Interface:
 * - `a, b`: Two 100-bit input vectors representing the binary numbers to be added.
 * - `cin`: Initial carry-in bit.
 * - `sum`: 100-bit output vector representing the binary sum of the inputs.
 * - `cout`: 100-bit output vector representing the carry-out from each full adder.
 */

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    // Insert your code here to instantiate and connect the full addaers in a ripple-carry fashion.
endmodule