module square_wave_tb;

    reg clk_tb = 0;        
    reg [8:0] freq_tb = 8'b0000100; 
    wire wave_out_tb;       
    integer ones_count = 0;  // Counter for consecutive ones
    integer error = 0;       // Error count
    integer total_tests = 0; // Counter for total test cases

    square_wave square_wave_inst (
        .clk(clk_tb),
        .freq(freq_tb),
        .wave_out(wave_out_tb)
    );

    initial begin
        // Simulate for a certain time
        repeat (200) begin
            total_tests = total_tests + 1; // Increment test count

            if (wave_out_tb == 1) begin
                ones_count = ones_count + 1;
                if (ones_count > 8) begin
                    $display("Error: More than 8 consecutive ones detected at time %0t", $time);
                    error = error + 1;
                end
            end else begin
                ones_count = 0;
            end
            #5; // Time delay between clock cycles
        end

        // Final test result summary
        $display("=========== Test Summary ===========");
        $display("Total Tests Run: %d", total_tests);
        $display("Total Failures: %d", error);

        if (error == 0) begin
            $display("=========== Your Design Passed ===========");
        end else begin
            $display("=========== Test completed with %d / %d failures ===========", error, total_tests);
        end

        $finish;  // Finish the simulation
    end

    always #5 clk_tb = ~clk_tb;

endmodule
