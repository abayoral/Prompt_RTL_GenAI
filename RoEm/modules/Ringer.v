module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

    // The motor is on when vibrate_mode is 1 and ring is 1
    assign motor = ring & vibrate_mode;
    
    // The ringer is on when vibrate_mode is 0 and ring is 1
    assign ringer = ring & ~vibrate_mode;

endmodule