module test();

reg clk, rst;

wire out1;
wire out2;
wire out3;

freq_div dut(.CLK_in(clk), .RST(rst), .CLK_50(out1), .CLK_10(out2), .CLK_1(out3));

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

integer error = 0;
integer total_tests = 0; // Counter for total test cases

initial begin 
    #10;
    rst = 1;
    #35;
    rst = 0;

    // Test case 1: 45 ns, Expected (out1=0, out2=0, out3=0)
    total_tests = total_tests + 1;
    error = (out1 != 0 || out2 != 0 || out3 != 0) ? error + 1 : error;
    
    // Test case 2: 55 ns, Expected (out1=1, out2=0, out3=0)
    #10;
    total_tests = total_tests + 1;
    error = (out1 != 1 || out2 != 0 || out3 != 0) ? error + 1 : error;
    
    // Test case 3: 95 ns, Expected (out1=1, out2=1, out3=0)
    #40;
    total_tests = total_tests + 1;
    error = (out1 != 1 || out2 != 1 || out3 != 0) ? error + 1 : error;
    
    // Test case 4: 225 ns, Expected (out1=0, out2=1, out3=0)
    #130;
    total_tests = total_tests + 1;
    error = (out1 != 0 || out2 != 1 || out3 != 0) ? error + 1 : error;
    
    // Test case 5: 625 ns, Expected (out1=0, out2=1, out3=1)
    #400;
    total_tests = total_tests + 1;
    error = (out1 != 0 || out2 != 1 || out3 != 1) ? error + 1 : error;
    
    // Test case 6: 1035 ns, Expected (out1=1, out2=1, out3=1)
    #410;
    total_tests = total_tests + 1;
    error = (out1 != 1 || out2 != 1 || out3 != 1) ? error + 1 : error;

    // Final test result summary
    $display("=========== Test Summary ===========");
    $display("Total Tests Run: %d", total_tests);
    $display("Total Failures: %d", error);

    if (error == 0) begin
        $display("=========== Your Design Passed ===========");
    end else begin
        $display("=========== Test completed with %d / %d failures ===========", error, total_tests);
    end

    $finish;
end

endmodule
