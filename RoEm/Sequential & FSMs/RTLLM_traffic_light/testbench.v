`timescale 1ns/1ns

module tb_traffic_light;
  
  reg clk;
  reg rst_n;
  reg pass_request;
  wire [7:0] clock;
  wire red;
  wire yellow;
  wire green;
  integer i;
  
  // Instantiate the module
  traffic_light uut (
    .clk(clk), 
    .rst_n(rst_n),
    .pass_request(pass_request), 
    .clock(clock), 
    .red(red),
    .yellow(yellow),
    .green(green)
  );
  
  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  integer error = 0;
  integer total_tests = 0; // Counter for total test cases
  integer clock_cnt;

  // Test sequence
  initial begin
    clk = 0; // Initialize clock
    rst_n = 1; // De-assert reset
    pass_request = 0; // No pass request initially

    // Perform reset
    rst_n = 0;
    #10;
    rst_n = 1;
    #30;
    
    // Test red
    total_tests = total_tests + 1;
    $display("At time %t, clock = %d, red = %b, yellow = %b, green = %b", 
               $time, clock, red, yellow, green);
    error = (red==1)&&(yellow==0)&&(green==0) ? error : error+1;
    
    #100;

    // Test green
    total_tests = total_tests + 1;
    $display("At time %t, clock = %d, red = %b, yellow = %b, green = %b", 
               $time, clock, red, yellow, green);
    error = (red==0)&&(yellow==0)&&(green==1) ? error : error+1;
    
    #600;

    // Test yellow
    total_tests = total_tests + 1;
    $display("At time %t, clock = %d, red = %b, yellow = %b, green = %b", 
               $time, clock, red, yellow, green);
    error = (red==0)&&(yellow==1)&&(green==0) ? error : error+1;
    
    #150;
    total_tests = total_tests + 1;
    $display("At time %t, clock = %d, red = %b, yellow = %b, green = %b", 
               $time, clock, red, yellow, green);
    
    clock_cnt = clock;

    // Test pass_request
    #30;
    total_tests = total_tests + 1;
    $display("At time %t, clock = %d, red = %b, yellow = %b, green = %b", 
               $time, clock, red, yellow, green);
    error = (clock != (clock_cnt + 3)) ? error : error+1;
    
    pass_request = 1;
    #10;

    total_tests = total_tests + 1;
    $display("At time %t, clock = %d, red = %b, yellow = %b, green = %b", 
               $time, clock, red, yellow, green);
    error = (clock == 10)&&(green == 1) ? error : error+1;

    // Final test result summary
    $display("=========== Test Summary ===========");
    $display("Total Tests Run: %d", total_tests);
    $display("Total Failures: %d", error);

    if (error == 0) begin
      $display("=========== Your Design Passed ===========");
    end else begin
      $display("=========== Test completed with %d / %d failures ===========", error, total_tests);
    end

    $finish; // End of test
  end

endmodule
