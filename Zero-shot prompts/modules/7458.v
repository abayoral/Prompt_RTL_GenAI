module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

  wire and1, and2, and3, and4;
  
  assign and1 = p1a & p1b;
  assign and2 = p1c & p1d;
  assign and3 = p1e & p1f;
  assign p1y = and1 | and2 | and3;

  assign and4 = p2a & p2b & p2c & p2d;
  assign p2y = and4;

endmodule