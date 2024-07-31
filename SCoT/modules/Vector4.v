module top_module (
    input wire [7:0] in,
    output wire [31:0] out
);
    // Sign extension logic: replicate the sign bit (in[7]) 24 times and append the original 8-bit input
    assign out = {{24{in[7]}}, in};
endmodule