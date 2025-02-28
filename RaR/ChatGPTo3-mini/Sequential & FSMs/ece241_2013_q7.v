Imagine you are a highly experienced Digital Design Engineer working at a prominent hardware design firm. You have been assigned to develop a critical Verilog module that plays a key role in the functionality of a next-generation product. The performance and reliability of this module are essential, as they directly affect the reputation of your company in the competitive computer hardware industry.

The specific task involves designing a JK flip-flop based on the provided truth table, but with a constraint: you must implement the JK flip-flop using only a D-type flip-flop combined with additional logic gates. The given truth table defines the behavior of the JK flip-flop as follows:

• When both J and K are 0, the output (Q) remains the same as the previous state (referred to as Qold).
• When J is 0 and K is 1, the output is forced to 0.
• When J is 1 and K is 0, the output is forced to 1.
• When both J and K are 1, the output toggles the previous value (resulting in the complement of Qold).

Note that Qold represents the state of the D-type flip-flop’s output just before the rising edge of the clock.

Your challenge is to translate this behavior into a Verilog design. You will need to write the code within the provided module template:

module top_module (
    input clk,
    input j,
    input k,
    output Q);

    // Insert your code here 

endmodule

In summary, you must break down the logic of the JK flip-flop using the characteristics defined by the truth table, then implement this functionality using a D flip-flop along with any necessary logic gates. Ensure that your design accurately models the specified behavior under the condition that the output Q is derived from the state before the clock’s positive edge (Qold).