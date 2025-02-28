Consider the following scenario: You hold the responsibility as a Senior Digital Design Engineer at a prominent hardware design company. Your current assignment involves developing a critical Verilog module for an upcoming, cutting-edge product. The performance and reliability of this module are of utmost importance, as it directly impacts your company’s reputation within the highly competitive computer hardware industry.

The task at hand is as follows:

You need to design a combinational circuit in Verilog that performs the function of splitting a 16-bit input—often referred to as a half-word—into two separate 8-bit outputs. Specifically, the circuit should extract and output:
• The lower 8 bits (bits [7:0]) as one output.
• The upper 8 bits (bits [15:8]) as a second output.

The module declaration is provided with the necessary structure. Note that the directive `default_nettype none` has been included at the top of the code to disable implicit nets, thereby helping to prevent certain types of coding errors.

Your task is to develop the implementation for this module in a purely combinational manner. The provided code stub is as follows:

------------------------------------------------
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );

// Insert your code here

endmodule
------------------------------------------------

As you proceed, ensure that your solution adheres strictly to combinational logic design principles, avoiding any sequential elements such as flip-flops or clocked registers. The module should efficiently separate the half-word into its two constituent bytes with clear and concise Verilog code.

This elaborated assignment requires you to consider not only the functional correctness of the design but also its impact on a high-stakes product release and the overall reputation of your company in the competitive computer hardware industry.