module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

    // The motor is on when ring is 1 and vibrate_mode is 1
    assign motor = ring & vibrate_mode;

    // The ringer is on when ring is 1 and vibrate_mode is 0
    assign ringer = ring & ~vibrate_mode;

endmodule