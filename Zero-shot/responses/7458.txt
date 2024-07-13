module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

wire p1g, p1h, p1i, p1j;
wire p2e, p2f, p2g, p2h;

// AND gates
assign p1g = p1a & p1b;
assign p1h = p1c & p1d;
assign p1i = p1e & p1f;

assign p2e = p2a & p2b;
assign p2f = p2c & p2d;

// OR gates
assign p1j = p1g | p1h;
assign p1y = p1j | p1i;

assign p2g = p2e | p2f;
assign p2y = p2g;

endmodule