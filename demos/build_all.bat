@echo off
@echo.
if "%1"=="" goto no_parameters
if "%CATALINA_DEFINE%" == "" goto parameters_and_no_define
if "%CATALINA_DEFINE%" == "%1 %2 %3 %4 %5 %6 %7 %8 %9" goto use_define
@echo ERROR: Command line options conflict with CATALINA_DEFINE
@echo.
@echo    The Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
@echo    The Command line options specified are %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo.
@echo    Either set CATALINA_DEFINE to null using the following command:
@echo.
@echo       unset CATALINA_DEFINE
@echo.
@echo    or do not specify any command line parameters
@echo.
goto done
:parameters_and_no_define
@echo NOTE: Environment variable CATALINA_DEFINE will be set to %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo.
@echo All programs will be built using these options. If these options conflict
@echo with any options specified in this file, the results may be unexpected.
set CATALINA_DEFINE=%1 %2 %3 %4 %5 %6 %7 %8 %9
goto start
:no_parameters
if "%CATALINA_DEFINE%" == "" goto use_default
:use_define
@echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
@echo.
@echo All programs will be built using these options. If these options conflict
@echo with any options specified in this file, the results may be unexpected.
goto start
:use_default
@echo NOTE: Environment variable CATALINA_DEFINE is not set
@echo.
@echo All programs will be built for the default target (CUSTOM) 
:start

set platform=%1
if "%platform:~0,2%"=="P2" goto build_p2

:build_lmm
@echo.
echo.
echo    ==================
echo    BUILDING LMM DEMOS
echo    ==================
echo.
@echo on
catalina hello_world.c -lci 
catalina hello_world_1.c -lci
catalina hello_world_2.c -lci 
catalina hello_world_1.c -lci -tpod -o hello_debug -C NO_MOUSE -C NO_FP
catalina othello.c -lci -CNO_MOUSE -CNO_FP
catalina fibo.c -lci -C CLOCK
catalina test_float.c -lc -lm 
catalina test_float_2.c -lc -lm
catalina test_float_3.c -lci -lm
catalina test_math_1.c -lc -lma 
catalina test_math_2.c -lc -lma 
catalina test_math_3.c -lc -lm  -o test_math_3_lm
catalina test_math_3.c -lc -lma -o test_math_3_lma
catalina test_math_3.c -lc -lmb -o test_math_3_lmb
catalina test_printf.c -lc -lm 
catalina test_fprintf.c -lci
catalina test_sbrk.c -lc 
catalina test_malloc.c -lc 
catalina test_string.c -lc 
catalina test_t_print.c -lc -lm 
catalina test_terminal.c -lc 
catalina test_t_printf.c -lc -lm 
catalina test_leds.c -lc -CNO_HMI
catalina test_coginit.c -lc -CNO_HMI
catalina test_suite.c -lc
catalina test_setjmp_1.c -lc 
catalina test_setjmp_2.c -lc 
catalina test_try_catch.c -lc 
catalina test_signal.c -lc 
catalina test_time.c -lc -CCLOCK -CTV
catalina test_locale.c -lc 
catalina test_propterm.c -lc -CPROPTERMINAL
catalina test_vararg.c -lc 
catalina test_cursor.c -lc 
catalina test_catalina_fs.c -lcx -CNO_MOUSE -CNO_FP

@echo off
echo.
echo    =================
echo    BUILDING PC DEMOS
echo    =================
echo.
@echo on
catalina othello.c -lc -o othello_pc -C PC 
catalina test_suite.c -lc -o test_suite_pc -C PC

@echo off
echo.
echo    ==================
echo    BUILDING SMM DEMOS
echo    ==================
echo.
@echo on
catalina test_catalina_fs.c -lcx -CNO_MOUSE -CTV -CALTERNATE -CNO_FP -C NO_ARGS -C SDCARD
@echo off
echo.
echo    =====================
echo    BUILDING LMM PC DEMOS
echo    =====================
echo.
@echo on
catalina othello.c -lc -o othello_pc -C PC 
catalina test_suite.c -lc -o test_suite_pc -C PC
@echo off
echo.
echo    ==================
echo    BUILDING EMM DEMOS
echo    ==================
echo.
@echo on
catalina hello_world.c -lc -o hello_world_emm -e -C EEPROM -M32k
catalina test_suite.c -lc -o test_suite_emm -e -C EEPROM -M32k
@echo off
echo.
echo    =========================
echo    BUILDING XMM EEPROM DEMOS
echo    =========================
echo.
@echo on
catalina hello_world.c -lc -C SMALL -o hello_world_emm -e -C EEPROM -M96k
catalina test_suite.c -lc -C SMALL -o test_suite_emm -e -C EEPROM -M96k
catalina test_terminal.c -lc -C SMALL -o test_terminal_emm -e  -C EEPROM -M96k
catalina startrek.c -lc -lma -C SMALL -o startrek_emm -e -C EEPROM -M96k
catalina othello.c -lc -C SMALL -o othello_emm -e -C EEPROM -M96k
catalina small_lisp.c -lc -lma -C SMALL -C CLOCK -o lisp_emm -e -C EEPROM -M96k
@echo off
echo.
echo    ==================
echo    BUILDING XMM DEMOS
echo    ==================
echo.
@echo on
catalina test_stdio_fs.c -lcx -lma -C SMALL
catalina startrek.c -lc -lma -C SMALL -o startrek_xmm
catalina small_lisp.c -lc -lma -C SMALL -C CLOCK -o lisp_xmm
goto done

:build_p2
@echo off
echo.
echo    ========================
echo    BUILDING NATIVE P2 DEMOS
echo    ========================
echo.
@echo on
catalina -p2 -C NATIVE hello_world.c -lci 
catalina -p2 -C NATIVE hello_world_1.c -lci
catalina -p2 -C NATIVE hello_world_2.c -lci 
catalina -p2 -C NATIVE othello.c -lci -CNO_MOUSE -CNO_FP
catalina -p2 -C NATIVE fibo.c -lci -C CLOCK
catalina -p2 -C NATIVE test_float.c -lc -lm 
catalina -p2 -C NATIVE test_float_2.c -lc -lm
catalina -p2 -C NATIVE test_float_3.c -lc -lm
catalina -p2 -C NATIVE test_fprintf.c -lc -lm
catalina -p2 -C NATIVE test_math_1.c -lc -lma 
catalina -p2 -C NATIVE test_math_2.c -lc -lma 
catalina -p2 -C NATIVE test_math_3.c -lc -lm  -o test_math_3_lm
catalina -p2 -C NATIVE test_math_3.c -lc -lma -o test_math_3_lma
catalina -p2 -C NATIVE test_math_3.c -lc -lmb -o test_math_3_lmb
catalina -p2 -C NATIVE test_printf.c -lc -lm 
catalina -p2 -C NATIVE test_sbrk.c -lc 
catalina -p2 -C NATIVE test_malloc.c -lc 
catalina -p2 -C NATIVE test_string.c -lc 
catalina -p2 -C NATIVE test_t_print.c -lc -lm 
catalina -p2 -C NATIVE test_terminal.c -lc 
catalina -p2 -C NATIVE test_t_printf.c -lc -lm 
catalina -p2 -C NATIVE test_leds.c -lc -CNO_HMI
catalina -p2 -C NATIVE test_coginit.c -lc -CNO_HMI
catalina -p2 -C NATIVE test_suite.c -lc
catalina -p2 -C NATIVE test_setjmp_1.c -lc 
catalina -p2 -C NATIVE test_setjmp_2.c -lc 
catalina -p2 -C NATIVE test_try_catch.c -lc 
catalina -p2 -C NATIVE test_signal.c -lc 
catalina -p2 -C NATIVE test_time.c -lc -CCLOCK
catalina -p2 -C NATIVE test_locale.c -lc 
catalina -p2 -C NATIVE test_propterm.c -lc
catalina -p2 -C NATIVE test_vararg.c -lc 
catalina -p2 -C NATIVE test_cursor.c -lc 
catalina -p2 -C NATIVE test_stdio_fs.c -lcx -lma
catalina -p2 -C NATIVE startrek.c -lc -lma 
catalina -p2 -C NATIVE small_lisp.c -lc -lma -C CLOCK
goto done

:done
@echo off
set TMP_LCCDIR=
call unset CATALINA_DEFINE

echo.
echo  ====
echo  Done
echo  ====
echo.


