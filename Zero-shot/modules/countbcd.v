module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

  // Each decade counter, composed of D Flip-Flops with reset
  // There are four digit counters d3, d2, d1, d0 which corresponds to thousands, hundreds, tens and ones respectively
  wire [3:0] d3, d2, d1, d0; 

  // Trigger signals for the counters. `ena` or "enable" signals will be high when corresponding digit needs to increment
  wire [3:1] en;

  // Connecting the enable signals
  assign ena = en;

  decade_counter c3 (.q(d3), .clk(ena[3]), .reset(reset));
  decade_counter c2 (.q(d2), .clk(ena[2]), .reset(reset));
  decade_counter c1 (.q(d1), .clk(ena[1]), .reset(reset));
  decade_counter c0 (.q(d0), .clk(clk), .reset(reset));
  
  // Concatenating all the q's in the form of q = d3d2d1d0 to give the BCD count
  assign q = {d3, d2, d1, d0}; 

  // Connecting the enable signals
  assign en[3] = (d0 == 4'b1001) && (d1 == 4'b1001) && (d2 == 4'b1001);
  assign en[2] = (d0 == 4'b1001) && (d1 == 4'b1001);
  assign en[1] = (d0 == 4'b1001);

endmodule