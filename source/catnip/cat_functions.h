/* 
 * Phase 2 functions
 */
void initialize_phase_2_fn();
void add_line_to_function_fn( a_VARARG *va );
void set_leaf_fn( a_VARARG *va );
void finalize_phase_2_fn();

/* 
 * Phase 3 functions
 */
int inlinable_function(char *name);
int inline_depth(int i, int depth);
void initialize_phase_3_fn();

/* 
 * Phase 4 functions
 */
void insert_func(int i);
void insert_inline_fn( a_VARARG *va );

/* 
 * Phase 5 functions
 */
a_VAR * str_to_dec_fn( a_VARARG *va );
a_VAR * str_to_hex_fn( a_VARARG *va );
a_VAR * bytes_to_hex_fn( a_VARARG *va );
a_VAR * bytes_to_addr24_fn( a_VARARG *va );
a_VAR * candidate_id_fn( a_VARARG *va );
a_VAR * str_to_addr24_fn( a_VARARG *va );

/*
 * Phase 6 functions
 */
void initialize_phase_6_fn();
a_VAR * can_optimize_fn( a_VARARG *va );
a_VAR * optimize_add_fn( a_VARARG *va );

/*
 * Phase 7 functions
 */
void initialize_phase_7_fn();
void finalize_phase_7_fn();
a_VAR * known_function_fn( a_VARARG *va );
void uses_BC_fn( a_VARARG *va );


/*
 * Phase 8 functions
 */
void initialize_phase_8_fn();
void finalize_phase_8_fn();

/*
 * Phase 9 functions
 */
void initialize_phase_9_fn();

/*
 * Phase 12 functions
 */
void initialize_phase_12_fn();
void initialize_phase_12_fn();
void finalize_phase_12_fn();
void uses_FN_fn( a_VARARG *va );

/*
 * Phase 13 functions
 */
void initialize_phase_13_fn();
a_VAR * required_function_fn( a_VARARG *va );

