@echo off
if "%CATALINA_DEFINE%" == "" goto start
@echo.
@echo ERROR: please unset CATALINA_DEFINE before running this script.
@echo.
goto done

:start
echo .
echo    =======================
echo    BUILDING BLADE #1 DEMOS
echo    =======================
echo .
@echo on
catalina othello.c -lc -C SMALL -o othello_1 -C TRIBLADEPROP -C CPU_1 -C CR_ON_LF
catalina startrek.c -lc -lma -C SMALL -o startrek_1 -C TRIBLADEPROP -C CPU_1 -C CR_ON_LF
catalina small_lisp.c -lc -lma -C SMALL -o lisp_1 -C TRIBLADEPROP -C CPU_1 -C CR_ON_LF
@echo off
echo .
echo    =======================
echo    BUILDING BLADE #2 DEMOS
echo    =======================
echo .
@echo on
catalina othello.c -lc -o othello_pc_2 -C TRIBLADEPROP -C PC -C CPU_2 -C CR_ON_LF
catalina test_suite.c -lc -o test_suite_pc_2 -C TRIBLADEPROP -C PC -C CPU_2 -C CR_ON_LF
catalina startrek.c -lc -lma -C SMALL -o startrek_2 -C TRIBLADEPROP -C PC -C CPU_2 -C CR_ON_LF
catalina small_lisp.c -lc -lma -C SMALL -o lisp_2 -C TRIBLADEPROP -C PC -C CPU_2 -C CR_ON_LF
catalina test_stdio_fs.c -lcx -lma -C SMALL -o test_fs_2 -C TRIBLADEPROP -C PC -C CPU_2 -C CR_ON_LF
@echo off
echo .
echo    =======================
echo    BUILDING BLADE #3 DEMOS
echo    =======================
echo .
@echo on
catalina test_3.c -lc -C NO_HMI -C TRIBLADEPROP -C CPU_3
@echo off
:done
