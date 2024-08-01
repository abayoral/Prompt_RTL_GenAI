module top_module (
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);

// Using intermediate wires for the first group
wire and1a_p1;
wire and1b_p1;
wire and1c_p1;
wire and1d_p1;

// AND gates for the first group
assign and1a_p1 = p1a & p1b;
assign and1b_p1 = p1c & p1d;
assign and1c_p1 = p1e & p1f;
// Connect the outputs of the AND gates to the OR gate 
assign p1y = and1a_p1 | and1b_p1 | and1c_p1;

// Using intermediate wires for the second group
wire and1a_p2;
wire and1b_p2;

// AND gates for the second group
assign and1a_p2 = p2a & p2b;
assign and1b_p2 = p2c & p2d;
// Connecting the outputs of the AND gates to the OR gate
assign p2y = and1a_p2 | and1b_p2;

endmodule