module ascon_core (
    input  logic            clk,
    input  logic            rst,
    input  logic [CCSW-1:0] key,
    input  logic            key_valid,
    output logic            key_ready,
    input  logic [CCW-1:0]  bdi,
    input  logic            bdi_valid,
    output logic            bdi_ready,
    input  logic [3:0]      bdi_type,
    input  logic            bdi_eot,
    input  logic            bdi_eoi,
    input  logic            decrypt,
    input  logic            hash,
    output logic [CCW-1:0]  bdo,
    output logic            bdo_valid,
    input  logic            bdo_ready,
    output logic [3:0]      bdo_type,
    output logic            bdo_eot,
    output logic            auth,
    output logic            auth_valid,
    input  logic            auth_ready
);

// Core registers
logic [STATE_WIDTH-1:0] state;
logic [CCSW-1:0] ascon_key;
logic [ROUND_CNT_WIDTH-1:0] round_cnt;
logic [WORD_CNT_WIDTH-1:0] word_cnt;
logic [HASH_CNT_WIDTH-1:0] hash_cnt;
logic flag_ad_eot, flag_dec, flag_eoi, flag_hash, auth_intern;

// Utility signals
logic op_ld_key_req, op_aead_req, op_hash_req, idle_done;
logic ld_key_do, ld_key_done, ld_nonce_do, ld_nonce_done;
logic init_do, init_done, key_add_2_done;
logic abs_ad_do, abs_ad_done, pro_ad_do, pro_ad_done;
logic abs_ptct_do, abs_ptct_done, pro_ptct_do, pro_ptct_done;
logic final_do, final_done, sqz_hash_do, sqz_hash_done1, sqz_hash_done2;
logic sqz_tag_do, sqz_tag_done, ver_tag_do, ver_tag_done;

// State machine states
typedef enum logic [3:0] {
    IDLE,
    LOAD_KEY,
    LOAD_NONCE,
    INIT,
    KEY_ADD_2,
    ABS_AD,
    PRO_AD,
    DOM_SEP,
    ABS_PTCT,
    PRO_PTCT,
    KEY_ADD_3,
    FINAL,
    KEY_ADD_4,
    SQUEEZE_TAG,
    SQUEEZE_HASH,
    VERIF_TAG
} state_t;

state_t current_state, next_state;

// Instantiation of Ascon-p permutation (Assuming ascon_p is another module)
ascon_p ascon_p_inst (
    .clk(clk),
    .state(state),
    .round_cnt(round_cnt)
);

// Control signals logic for FSM states
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        current_state <= IDLE;
    end else begin
        current_state <= next_state;
    end
end

// Next state logic and state update logic for FSM
always_comb begin
    next_state = current_state;
    case (current_state)
        IDLE: if (key_valid) next_state = LOAD_KEY;
        LOAD_KEY: if (ld_key_done) next_state = LOAD_NONCE;
        LOAD_NONCE: if (ld_nonce_done) next_state = INIT;
        INIT: if (init_done) next_state = KEY_ADD_2;
        KEY_ADD_2: if (key_add_2_done) next_state = ABS_AD;
        ABS_AD: if (abs_ad_done) next_state = PRO_AD;
        PRO_AD: if (pro_ad_done) next_state = DOM_SEP;
        DOM_SEP: next_state = ABS_PTCT;
        ABS_PTCT: if (abs_ptct_done) next_state = PRO_PTCT;
        PRO_PTCT: if (pro_ptct_done) next_state = KEY_ADD_3;
        KEY_ADD_3: next_state = FINAL;
        FINAL: if (final_done) next_state = KEY_ADD_4;
        KEY_ADD_4: next_state = SQUEEZE_TAG;
        SQUEEZE_TAG: if (sqz_tag_done) next_state = SQUEEZE_HASH;
        SQUEEZE_HASH: if (sqz_hash_done2) next_state = VERIF_TAG;
        VERIF_TAG: if (ver_tag_done) next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

// Ascon state updates and counter updates logic
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= 0;
        round_cnt <= 0;
        word_cnt <= 0;
        hash_cnt <= 0;
        flag_ad_eot <= 0;
        flag_dec <= 0;
        flag_eoi <= 0;
        flag_hash <= 0;
        auth_intern <= 0;
    end else begin
        case (current_state)
            LOAD_KEY: begin
                if (ld_key_do) begin
                    ascon_key <= key;
                end
                if (ld_key_done) begin
                    flag_ad_eot <= 1;
                end
            end
            LOAD_NONCE: begin
                if (ld_nonce_do) begin
                    state[127:0] <= bdi;
                end
                if (ld_nonce_done) begin
                    flag_eoi <= bdi_eoi;
                    flag_dec <= decrypt;
                end
            end
            INIT: begin
                if (init_do) begin
                    state <= ascon_p_inst.state;
                end
                if (init_done) begin
                    flag_hash <= 1;
                end
            end
            KEY_ADD_2: begin
                if (key_add_2_done) begin
                    round_cnt <= round_cnt + 1;
                end
            end
            ABS_AD: begin
                if (abs_ad_do) begin
                    state <= state ^ bdi; // Example update
                end
                if (abs_ad_done) begin
                    flag_ad_eot <= bdi_eot;
                    flag_eoi <= bdi_eoi;
                end
            end
            PRO_AD: begin
                if (pro_ad_do) begin
                    state <= state ^ ascon_key; // Example update
                end
                if (pro_ad_done) begin
                    flag_ad_eot <= 0;
                end
            end
            ABS_PTCT: begin
                if (abs_ptct_do) begin
                    state <= state ^ bdi; // Example update
                end
                if (abs_ptct_done) begin
                    flag_eoi <= bdi_eoi;
                end
            end
            FINAL: begin
                if (final_do) begin
                    state <= ascon_p_inst.state; // Example update
                end
            end
            KEY_ADD_4: begin
                if (flag_dec) begin
                    auth_intern <= 1;
                end
            end
            VERIF_TAG: begin
                if (ver_tag_do) begin
                    auth_intern <= auth_intern & (bdi == state[127:0]); // Example dynamic slicing comparison
                end
                if (ver_tag_done) begin
                    auth_valid <= 1;
                    auth <= auth_intern;
                end
            end
            default: begin
                // Default assignments for flags and counters
                flag_ad_eot <= 0;
                flag_dec <= 0;
                flag_eoi <= 0;
                flag_hash <= 0;
                auth_intern <= 0;
            end
        endcase
    end
end

// Flag updates logic
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        flag_ad_eot <= 0;
        flag_dec <= 0;
        flag_eoi <= 0;
        flag_hash <= 0;
        auth_intern <= 0;
    end else begin
        if (idle_done && op_hash_req) begin
            flag_hash <= 1;
        end
        if (ld_nonce_done) begin
            flag_eoi <= bdi_eoi;
            flag_dec <= decrypt;
        end
        if (abs_ad_done) begin
            flag_ad_eot <= bdi_eot;
            flag_eoi <= bdi_eoi;
        end
        if (abs_ptct_done) begin
            flag_eoi <= bdi_eoi;
        end
        if (current_state == KEY_ADD_4 && flag_dec) begin
            auth_intern <= 1;
        end
        if (ver_tag_do) begin
            auth_intern <= auth_intern & (bdi == state[127:0]); // Example dynamic slicing comparison
        end
        if (ver_tag_done) begin
            auth_valid <= 1;
            auth <= auth_intern;
        end
    end
end

// Counter updates logic
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        word_cnt <= 0;
        hash_cnt <= 0;
        round_cnt <= 0;
    end else begin
        if (ld_key_do || ld_nonce_do || abs_ad_do || abs_ptct_do || sqz_tag_do || sqz_hash_do || ver_tag_do) begin
            word_cnt <= word_cnt + 1;
        end
        if (ld_key_done || ld_nonce_done || abs_ad_done || abs_ptct_done || sqz_tag_done || sqz_hash_done1 || ver_tag_done) begin
            word_cnt <= 0;
        end
        if (sqz_hash_done1) begin
            hash_cnt <= hash_cnt + 1;
        end
        if (flag_hash && abs_ad_done && bdi_eoi) begin
            hash_cnt <= 0;
        end
        if (idle_done && op_hash_req || ld_nonce_done || (current_state == KEY_ADD_3)) begin
            round_cnt <= ROUNDS_A;
        end
        if (abs_ad_done && flag_hash || (sqz_hash_done1 && !sqz_hash_done2)) begin
            round_cnt <= ROUNDS_A;
        end
        if (abs_ad_done && !flag_hash || abs_ptct_done && !bdi_eot) begin
            round_cnt <= ROUNDS_B;
        end
        if (init_do || pro_ad_do || pro_ptct_do || final_do) begin
            round_cnt <= round_cnt - UROL;
        end
    end
end

// Debug signals for simulation purposes
logic [STATE_WIDTH-1:0] debug_state;
logic [CCSW-1:0] debug_key;
logic [4:0] debug_flags;

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        debug_state <= 0;
        debug_key <= 0;
        debug_flags <= 0;
    end else begin
        debug_state <= state;
        debug_key <= ascon_key;
        debug_flags <= {flag_ad_eot, flag_dec, flag_eoi, flag_hash, auth_intern};
    end
end

endmodule
