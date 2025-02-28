// you're a senior FPGA engineer at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining my computer hardware company's reputation in the industry.

// This 8-bit wide 2-to-1 multiplexer doesn't work. Fix the bug(s).

module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output out  );

    assign out = (~sel & a) | (sel & b);

endmodule
