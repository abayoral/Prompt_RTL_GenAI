module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

    // Motor should be on if vibrate_mode is 1 and there is an incoming call
    assign motor = ring & vibrate_mode;
    
    // Ringer should be on if vibrate_mode is 0 and there is an incoming call
    assign ringer = ring & ~vibrate_mode;

endmodule