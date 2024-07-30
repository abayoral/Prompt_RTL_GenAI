module top_module (
    input wire cpu_overheated,
    input wire arrived,
    input wire gas_tank_empty,
    output reg shut_off_computer,
    output reg keep_driving
);

    always @* begin
        // Shut off computer only if CPU is overheated
        if (cpu_overheated)
            shut_off_computer = 1;
        else
            shut_off_computer = 0;

        // Continue driving if not arrived and gas tank is not empty
        if (arrived)
            keep_driving = 0;
        else if (gas_tank_empty)
            keep_driving = 0;
        else
            keep_driving = 1;
    end
    
endmodule