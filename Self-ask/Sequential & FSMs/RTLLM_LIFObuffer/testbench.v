`timescale 1ns / 1ps

module LIFObuffer_tb;

// Inputs
reg [3:0] dataIn;
reg RW;
reg EN;
reg Rst;
reg Clk;

// Outputs
wire [3:0] dataOut;
wire EMPTY;
wire FULL;

// Instantiate the Unit Under Test (UUT)
LIFObuffer uut (
    .dataIn(dataIn),
    .dataOut(dataOut),
    .RW(RW),
    .EN(EN),
    .Rst(Rst),
    .EMPTY(EMPTY),
    .FULL(FULL),
    .Clk(Clk)
);

integer error = 0;
integer total_tests = 0; // Counter for total test cases

initial begin
    // Initialize Inputs
    dataIn = 4'h0;
    RW = 1'b0;
    EN = 1'b0;
    Rst = 1'b1;
    Clk = 1'b0;

    // Wait 100 ns for global reset to finish
    #100;

    // Enable and Reset
    total_tests = total_tests + 1;
    EN = 1'b1;
    Rst = 1'b1;
    #40;
    Rst = 1'b0;

    // Push data into LIFO
    RW = 1'b0;
    total_tests = total_tests + 1;
    dataIn = 4'h0;
    #20;
    dataIn = 4'h2;
    #20;
    dataIn = 4'h4;
    #20;
    dataIn = 4'h6;
    #20;

    // Read from LIFO
    RW = 1'b1;
    #5;

    // Test FULL and EMPTY condition
    total_tests = total_tests + 1;
    error = (FULL && !EMPTY) ? error : error + 1;

    // Test popping values
    #20;
    total_tests = total_tests + 1;
    error = (dataOut == 6) ? error : error + 1;

    #20;
    total_tests = total_tests + 1;
    error = (dataOut == 4) ? error : error + 1;

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

always #10 Clk = ~Clk;

endmodule
