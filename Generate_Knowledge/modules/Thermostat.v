module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
);

    // Heater is on only when mode is heating (mode = 1) and it's too cold.
    assign heater = mode & too_cold;
    
    // Air conditioner is on only when mode is cooling (mode = 0) and it's too hot.
    assign aircon = ~mode & too_hot;
    
    // Fan is on if either heater or aircon is on, or if fan_on is requested by the user.
    assign fan = heater | aircon | fan_on;

endmodule