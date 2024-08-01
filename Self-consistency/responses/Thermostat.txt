module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
);

    // Heater should be on when mode is heating (mode = 1) and it is too cold
    assign heater = mode && too_cold;
    
    // Air conditioner should be on when mode is cooling (mode = 0) and it is too hot
    assign aircon = ~mode && too_hot;
    
    // Fan should be on when the heater or aircon are on or when fan_on is requested
    assign fan = heater || aircon || fan_on;
    
endmodule