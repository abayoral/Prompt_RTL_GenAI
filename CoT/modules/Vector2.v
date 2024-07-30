module top_module( 
    input [31:0] in,
    output [31:0] out );

    // Reverse byte ordering: out[31:24] gets in[7:0], out[23:16] gets in[15:8], etc.
    assign out[31:24] = in[7:0];   // D
    assign out[23:16] = in[15:8];  // C
    assign out[15:8]  = in[23:16]; // B
    assign out[7:0]   = in[31:24]; // A

endmodule