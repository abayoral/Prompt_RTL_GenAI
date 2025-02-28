The questions comprising:

// A JK flip-flop operates according to the following truth table. How can you implement the behavior of a JK flip-flop using only a D-type flip-flop and logic gates? For reference, consider that Q_old denotes the prior output state of the D flip-flop before the clock's positive edge.

Here is the truth table for the JK flip-flop:

| J | K | Q    |
|:-:|:-:|------|
| 0 | 0 | Qold |
| 0 | 1 | 0    |
| 1 | 0 | 1    |
| 1 | 1 | ~Qold|

Using the provided truth table, devise a way to translate the JK flip-flop's function into a circuit configuration that exclusively utilizes a D-type flip-flop along with any necessary logic gates.

Below is the initial module skeleton for you to complete. The 'Q' output represents the JK flip-flop's output.

// Define the module 'top_module' with 'clk', 'j', and 'k' as inputs and 'Q' as the output.

module top_module (
    input clk,
    input j,
    input k,
    output Q);

    // Insert your code here to implement the JK flip-flop using a D flip-flop and logic gates.

endmodule