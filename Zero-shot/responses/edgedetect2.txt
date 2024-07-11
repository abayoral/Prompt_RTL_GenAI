module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
	reg [7:0] in_previous;
	
	always @(posedge clk) begin
		anyedge  <= (in ^ in_previous) & in; // XOR will detect any change, AND with current input will only output 1 for 0 to 1 change
		in_previous <= in; // Update previous input value
	end

endmodule