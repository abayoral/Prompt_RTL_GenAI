`timescale 1ns/1ns

module pulse_detect_tb;
  reg clk;
  reg rst_n;
  reg data_in;
  wire data_out;

  // Instantiate the DUT (Design Under Test)
  pulse_detect dut (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Generate clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  integer error = 0;
  integer total_tests = 0; // Counter for total test cases

  initial begin
      // Initialize inputs
      #10;
      rst_n = 0;
      data_in = 0;
      #28;
      rst_n = 1;
      #10 data_in = 0;
      #10 data_in = 0;  
      #10 data_in = 0;
      #10 data_in = 1;
      #10 data_in = 0;
      #10 data_in = 1;
      #10 data_in = 0;
      #10 data_in = 1;
      #10 data_in = 1;
      #10 data_in = 0;
      #10;

      // Finish simulation
      $finish;
  end

  initial begin
    #5;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 0) ? error : error+1;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 0) ? error : error+1;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 0) ? error : error+1;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 0) ? error : error+1;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 0) ? error : error+1;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 0) ? error : error+1;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 0) ? error : error+1;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 0) ? error : error+1;
    #10;
    total_tests = total_tests + 1;
    error = (data_out == 1) ? error : error+1; // Expect pulse detected (1)
    #20;
    total_tests = total_tests + 1;
    error = (data_out == 1) ? error : error+1;
    #10;

    // Final test result summary
    $display("=========== Test Summary ===========");
    $display("Total Tests Run: %d", total_tests);
    $display("Total Failures: %d", error);

    if (error == 0) begin
        $display("=========== Your Design Passed ===========");
    end
    else begin
        $display("=========== Test completed with %d / %d failures ===========", error, total_tests);
    end
  end

endmodule
