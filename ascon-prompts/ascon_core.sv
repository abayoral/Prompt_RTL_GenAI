// Generate a System Verilog module named ascon_core implementing the Ascon cryptographic core with the following details:
// - Include core registers for state, ascon_key, round_cnt, word_cnt, hash_cnt, flag_ad_eot, flag_dec, flag_eoi, flag_hash, auth_intern.
// - Utility signals for various operations such as op_ld_key_req, op_aead_req, op_hash_req, idle_done, ld_key_do, ld_key_done, ld_nonce_do, ld_nonce_done, init_do, init_done, key_add_2_done, abs_ad_do, abs_ad_done, pro_ad_do, pro_ad_done, abs_ptct_do, abs_ptct_done, pro_ptct_do, pro_ptct_done, final_do, final_done, sqz_hash_do, sqz_hash_done1, sqz_hash_done2, sqz_tag_do, sqz_tag_done, ver_tag_do, ver_tag_done.
// - Dynamic slicing for state.
// - A finite state machine (FSM) with states: IDLE, LOAD_KEY, LOAD_NONCE, INIT, KEY_ADD_2, ABS_AD, PRO_AD, DOM_SEP, ABS_PTCT, PRO_PTCT, KEY_ADD_3, FINAL, KEY_ADD_4, SQUEEZE_TAG, SQUEEZE_HASH, VERIF_TAG.
// - Instantiation of the Ascon-p permutation.
// - Control signals logic for FSM states.
// - Next state logic and state update logic for FSM.
// - Ascon state updates and counter updates logic.
// - Flag updates logic to manage flag_ad_eot, flag_dec, flag_eoi, flag_hash, auth, and auth_valid based on operation progress and FSM states:
//   - When `idle_done` and `op_hash_req` are true, set `flag_hash` to 1.
//   - When `ld_nonce_done` is true, set `flag_eoi` to 1 if `bdi_eoi` is true, and set `flag_dec` to the value of `decrypt`.
//   - When `abs_ad_done` is true, set `flag_ad_eot` to 1 if `bdi_eot` is true, and set `flag_eoi` to 1 if `bdi_eoi` is true.
//   - When `abs_ptct_done` is true, set `flag_eoi` to 1 if `bdi_eoi` is true.
//   - When the FSM state is `KEY_ADD_4` and `flag_dec` is true, set `auth_intern` to 1.
//   - When `ver_tag_do` is true, set `auth_intern` to the logical AND of `auth_intern` and the equality check of `bdi` and `state_slice`.
//   - When `ver_tag_done` is true, set `auth_valid` to 1 and `auth` to the value of `auth_intern`.
// - State update logic for various operations:
//   - Update `state` when `ld_nonce_do`, `abs_ad_do`, or `abs_ptct_do` are true, using dynamic slicing.
//   - Initialize `state` for hashing when `idle_done` and `op_hash_req` are true.
//   - Initialize `state` and add keys for key addition 1 when `ld_nonce_done` is true.
//   - Compute Ascon-p permutation results during `init_do`, `pro_ad_do`, `pro_ptct_do`, or `final_do` states.
//   - Perform key addition 2/4 during `key_add_2_done` or `fsm == KEY_ADD_4`.
//   - Perform domain separation during the `DOM_SEP` state.
//   - Perform key addition 3 during the `KEY_ADD_3` state.
//   - Store the key during `ld_key_do`.
// - Counter updates logic for word, hash, and round counters:
//   - Initialize `word_cnt` to 0 on reset.
//   - Increment `word_cnt` during `ld_key_do`, `ld_nonce_do`, `abs_ad_do`, `abs_ptct_do`, `sqz_tag_do`, `sqz_hash_do`, or `ver_tag_do`.
//   - Reset `word_cnt` to 0 when `ld_key_done`, `ld_nonce_done`, `abs_ad_done`, `abs_ptct_done`, `sqz_tag_done`, `sqz_hash_done1`, or `ver_tag_done` are true.
//   - Increment `hash_cnt` when `sqz_hash_done1` is true.
//   - Reset `hash_cnt` to 0 when `flag_hash` is true and `abs_ad_done` and `bdi_eoi` are true.
//   - Set `round_cnt` to `ROUNDS_A` when `idle_done` and `op_hash_req` are true, `ld_nonce_done` is true, or `fsm == KEY_ADD_3`.
//   - Set `round_cnt` to `ROUNDS_A` when `abs_ad_done` and `flag_hash` are true or `sqz_hash_done1` is true and `sqz_hash_done2` is false.
//   - Set `round_cnt` to `ROUNDS_B` when `abs_ad_done` is true and `flag_hash` is false or `abs_ptct_done` is true and `bdi_eot` is false.
//   - Decrement `round_cnt` by `UROL` during `init_do`, `pro_ad_do`, `pro_ptct_do`, or `final_do`.
// - Debug signals for simulation purposes.
- Include update logic for state, counters, and flags based on the FSM state transitions and operation progress.

module ascon_core (
    input  logic            clk,
    input  logic            rst,
    input  logic [CCSW-1:0] key,
    input  logic            key_valid,
    output logic            key_ready,
    input  logic [ CCW-1:0] bdi,
    input  logic            bdi_valid,
    output logic            bdi_ready,
    input  logic [     3:0] bdi_type,
    input  logic            bdi_eot,
    input  logic            bdi_eoi,
    input  logic            decrypt,
    input  logic            hash,
    output logic [ CCW-1:0] bdo,
    output logic            bdo_valid,
    input  logic            bdo_ready,
    output logic [     3:0] bdo_type,
    output logic            bdo_eot,
    output logic            auth,
    output logic            auth_valid,
    input  logic            auth_ready
);
