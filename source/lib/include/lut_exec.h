#ifndef LUT_EXEC_H
#define LUT_EXEC_H

/******************************************************************************
 *                                                                            *
 * Macros to simplify the definition of inline PASM or C code to be loaded    *
 * into the LUT and executed in cog execution mode.                           *
 * These macros can be used in all memory models on the Propeller 2.          *
 *                                                                            *
 * Use LUT_BEGIN and LUT_END to define and load but not call the function,    *
 * and then use LUT_CALL to call the function, either in the same function    *
 * or in another function with the same parameter profile.                    *
 *                                                                            *
 * If it is still loaded, the LUT function can be called again using the      *
 * LUT_CALL macro specifying the name of the LUT function.                    *
 *                                                                            *
 * If they are loaded at different offsets and do not overlap, multiple       *
 * LUT functions can be loaded at the same time.                              *
 *                                                                            *
 * A 'ret' instruction is automatically appended to the LUT code by the       *
 * LUT_END macro, so that the LUT function can be invoked by a 'call'         *
 * instruction specifying the LUT function name.                              *
 *                                                                            *
 * The value left in r0 by the LUT function will be returned by LUT_CALL      *
 * macro.                                                                     *
 *                                                                            *
 * Note that if it not called in the same function that it is defined in,     *
 * the LUT function must be called from a function with the same parameter    *
 * profile.                                                                   *
 *                                                                            *
 * For example ...                                                            *
 *                                                                            *
 * // define load and call the LUT function ...                               *
 * int function_1(int a, int b) {                                             *
 *    LUT_BEGIN("0", "function_1", "1");                                      *
 *    PASM(                                                                   *
 *       " mov r0, _PASM(a)\n"                                                *
 *       " add r0, _PASM(b)\n"                                                *
 *    );                                                                      *
 *    LUT_END;                                                                *
 *    return LUT_CALL("function_1");                                          *
 * }                                                                          *
 *                                                                            *
 * or ...                                                                     *
 *                                                                            *
 * // define and load, but do not call the LUT function ...                   *
 * load_function_2(int a, int b, int c) {                                     *
 *    LUT_BEGIN("0", "function_2", "2");                                      *
 *    PASM(                                                                   *
 *       " mov r0, _PASM(a)\n"                                                *
 *       " add r0, _PASM(b)\n"                                                *
 *       " add r0, _PASM(c)\n"                                                *
 *    );                                                                      *
 *    LUT_END;                                                                *
 * }                                                                          *
 *                                                                            *
 * ... and then ...                                                           *
 *                                                                            *
 * // call an already loaded LUT function ...                                 *
 * int function_2(int a, int b, int c) {                                      *
 *    return LUT_CALL("function_2");                                          *
 * }                                                                          *
 *                                                                            *
 * For C code to be executed from the LUT, the program must be a NATIVE       *
 * program, and the C code must be 'leaf' code - i.e. it must not call any    *
 * other C functions, including C library functions. For example, the         *
 * function_1 above could have been written in C as ...                       *
 *                                                                            *
 * // define load and call the LUT function ...                               *
 * int function_1(int a, int b) {                                             *
 *    int result;                                                             *
 *    LUT_BEGIN("0", "function_1", "1");                                      *
 *    result = a + b;                                                         *
 *    LUT_END;                                                                *
 *    LUT_CALL("function_1");                                                 *
 *    return result;                                                          *
 * }                                                                          *
 *                                                                            *
 * NOTE: If LUT code is to be defined and loaded by one function and then     *
 * called from another function, both functions MUST have the same parameter  *
 * profile, local variables and stack frame structure. This is trivial for    *
 * PASM code, but NON-TRIVIAL for arbitrary C code, so it is recommended      *
 * that C code always be defined, loaded and executed in the same function.   *
 *                                                                            *
 ******************************************************************************/

#if !defined(__CATALINA_P2)
#error LUT EXECUTION IS ONLY SUPPORTED ON THE PROPELLER 2
#endif

/*
 * LUT_BEGIN - Define and load (if not already loaded) a
 *             LUT function but DO NOT CALL the function
 *
 * OFFS - string offset (from $200) to put function (e.g. "$0")
 * NAME - string name of the LUT function (e.g. "function")
 * SIGN - string signature of function (e.g. "$DEADBEEF")
 *
 * Note: OFFS must be a PASM constant >= $0 and < $200
 *       NAME must be a unique valid PASM identifier
 *       SIGN must be a PASM constant that is unique
 *            for all functions at the specified offset
 */
#ifdef __CATALINA_NATIVE
#define LUT_BEGIN(OFFS, NAME, SIGN) \
   PASM("\n \
       rdlut r0,#"OFFS"\n \
       cmp r0,##"SIGN" wz\n \
       if_z jmp #.lut_loaded\n \
       setq2 #(.lut_end-.lut_start-1)\n \
       rdlong "OFFS", ##@.lut_start\n \
      .lut_loaded\n \
       jmp #\\@.pasm_exit\n \
       org $200+"OFFS"\n \
      .lut_start\n \
       long " SIGN" \n \
      "NAME "\n");
#elif __CATALINA_COMPACT
#define LUT_BEGIN(OFFS, NAME, SIGN) \
   PASM("\n \
       word I16B_LODL + r0<<D16B\n \
       alignl \n \
       long @.lut_start\n \
       word I16B_EXEC\n \
       alignl\n \
       mov r1,#"OFFS" \n \
       mov RI,#(.lut_end-.lut_start-1)\n \
       call #\\do_loadlut_hub\n \
       jmp #EXEC_STOP\n \
       long I32_JMPA + @.pasm_exit<<S32\n \
       org $200+"OFFS"\n \
      .lut_start\n \
       long "SIGN"\n \
      "NAME"\n");
#elif __CATALINA_TINY
#define LUT_BEGIN(OFFS, NAME, SIGN) \
   PASM("\n \
       jmp #LODL\n \
       long @.lut_start\n \
       mov r0,RI\n \
       mov r1,#"OFFS" \n \
       mov RI,#(.lut_end-.lut_start-1)\n \
       call #\\do_loadlut_hub\n \
       jmp #JMPA\n \
       long @.pasm_exit\n \
       org $200+"OFFS"\n \
      .lut_start\n \
       long " SIGN" \n \
      "NAME "\n");
#else
// must be XMM (SMALL or LARGE)
#define LUT_BEGIN(OFFS, NAME, SIGN) \
   PASM("\n \
       jmp #LODL\n \
       long @.lut_start\n \
       mov r0,RI\n \
       mov r1,#"OFFS" \n \
       shl r1,#16 \n \
       or  r1,#(.lut_end-.lut_start)\n \
       mov RI,#5\n \
       jmp #SPEC\n \
       jmp #JMPA\n \
       long @.pasm_exit\n \
       org $200+"OFFS"\n \
      .lut_start\n \
       long " SIGN" \n \
      "NAME "\n");
#endif

/*
 * LUT_END - Terminate the definition of a LUT function.
 */
#define LUT_END \
   PASM("\n \
       ret\n \
       fit $300\n \
      .lut_end\n \
       orgh\n \
      .pasm_exit\n");

/*
 * LUT_CALL - Call an already loaded LUT function.
 *
 * NAME - string name of LUT function (e.g. "function")
 *
 * Note: no check is made that the LUT function is loaded - whatever code is 
 *       currently loaded at the offset of the LUT function will be called.
 *
 * Note: if the LUT function returns a value (in r0) it will be returned
 *       by this macro - e.g:
 *          return LUT_CALL("function");
 *       or
 *          result = LUT_CALL("function");
 */
#ifdef __CATALINA_NATIVE
#define LUT_CALL(NAME) \
   PASM("call #\\"NAME"\n \
         jmp #\\@.pasm_exit2 ' back to Hub exec mode!\n \
         orgh\n \
        .pasm_exit2\n");
#elif __CATALINA_COMPACT
#define LUT_CALL(NAME) \
   PASM(" word I16B_PASM\n \
          alignl\n \
          call #\\"NAME"\n");
#elif __CATALINA_TINY
#define LUT_CALL(NAME) \
   PASM("call #\\"NAME"\n");
#else
// must be XMM (SMALL or LARGE)
#define LUT_CALL(NAME) \
   PASM("call #\\"NAME"\n");
#endif

#endif


