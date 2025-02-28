`timescale 1ns/1ns

module parallel2serial_tb;
  reg clk;
  reg rst_n;
  reg [3:0] d;
  wire valid_out;
  wire dout;

  // Instantiate the DUT (Design Under Test)
  parallel2serial dut (
    .clk(clk),
    .rst_n(rst_n),
    .d(d),
    .valid_out(valid_out),
    .dout(dout)
  );

  // Generate clock
  always #5 clk = ~clk;
  integer error = 0;
  integer failcase = 0;
  integer i = 0;
  integer timeout;

  initial begin
    for (i=0; i<100; i=i+1) begin
        error = 0;
        // Initialize inputs
        clk = 0;
        rst_n = 0;
        d = 4'b0;

        #10;
        rst_n = 1;
        #10;
        d = $random;
        
        // Timeout mechanism for valid_out assertion
        timeout = 1000;
        while (valid_out == 0 && timeout > 0) begin
            @(posedge clk);
            timeout = timeout - 1;
        end
        
        if (timeout == 0) begin
            $display("ERROR: Timeout waiting for valid_out signal");
            $finish;
        end
        
        error = (dout == d[3] && valid_out==1) ? error : error+1;
        #10;
        error = (dout == d[2] && valid_out==0) ? error : error+1;
        #10;
        error = (dout == d[1] && valid_out==0) ? error : error+1;
        #10;
        error = (dout == d[0] && valid_out==0) ? error : error+1;
        #10;
        error = (valid_out==1) ? error : error+1;
        #10;
        failcase = (error==0)? failcase :failcase+1;

    end
    if(failcase==0) begin
      $display("===========Your Design Passed===========");
    end
    else begin
      $display("===========Test completed with %d /100 failures===========", failcase);
    end
    $finish; 
  end

endmodule
