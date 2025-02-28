`timescale 1ns / 1ps

module tb_valid_ready;

parameter PERIOD  = 10;
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;
reg   [7:0]  data_in                       = 0 ;
reg   valid_in                             = 0 ;

wire  valid_out                              ;
wire  [9:0]  data_out                       ;

// Clock generation
initial begin
    forever #(PERIOD/2) clk = ~clk;
end

// Reset assertion
initial begin
    #(PERIOD*2) rst_n  = 1;
end

// Instantiate the module
accu uut (
    .clk       (clk),
    .rst_n     (rst_n),
    .data_in   (data_in),
    .valid_in  (valid_in),
    .valid_out (valid_out),
    .data_out  (data_out)
);

// Input stimulus
initial begin
    #(PERIOD*1 + 0.01); 
    #(PERIOD)   data_in = 8'd1; valid_in = 1;
    #(PERIOD)   data_in = 8'd2;
    #(PERIOD)   data_in = 8'd3;
    #(PERIOD)   data_in = 8'd14;

    #(PERIOD)   data_in = 8'd5;
    #(PERIOD)   data_in = 8'd2;
    #(PERIOD)   data_in = 8'd103;
    #(PERIOD)   data_in = 8'd4;

    #(PERIOD)   data_in = 8'd5;
    #(PERIOD)   data_in = 8'd6;
    #(PERIOD)   data_in = 8'd3;
    #(PERIOD)   data_in = 8'd54;
    #(PERIOD*2);
    $finish;
end

// Expected results
reg [9:0] result [0:2];

initial begin
    result[0] = 9'd20;
    result[1] = 9'd114;
    result[2] = 9'd68;
end

integer i;
integer casenum = 0;
integer error = 0;
integer total_tests = 0; // Counter for total test cases

// Validation logic
initial begin
    for (i = 0; i < 15; i = i + 1) begin
        #((PERIOD) * 1);         
        if (valid_out) begin
            total_tests = total_tests + 1; // Increment test count
            error = (data_out == result[casenum]) ? error : error + 1;
            casenum = casenum + 1;
        end        
    end

    // Final test result summary
    $display("=========== Test Summary ===========");
    $display("Total Tests Run: %d", total_tests);
    $display("Total Failures: %d", error);

    if (error == 0 && casenum == 3) begin
        $display("=========== Your Design Passed ===========");
    end else begin
        $display("=========== Test completed with %d / %d failures ===========", error, total_tests);
    end

    $finish;
end

endmodule
