@echo off
if "%CATALINA_DEFINE%" == "" goto start
@echo.
@echo ERROR: please unset CATALINA_DEFINE before running this script.
@echo.
goto done
:start
@echo off
echo .
echo    =====================
echo    BUILDING CPU #1 DEMOS
echo    =====================
echo .
@echo on
catalina ..\games\othello.c -lc -o othello_pc_1 -C MORPHEUS -C CPU_1 -C PC
catalina ..\file_systems\test_catalina_fs.c -lcix -o test_fs_pc_1 -C MORPHEUS -C PC -C CPU_1 -C NO_MOUSE -C NO_FLOAT -C COMPACT
@echo off
echo .
echo    =====================
echo    BUILDING CPU #2 DEMOS
echo    =====================
echo .
@echo on
catalina ..\test_suite\test_suite.c -lc -o test_suite_pc_2 -C MORPHEUS -C PC -C CPU_2 
catalina ..\games\startrek.c -lc -lma -C SMALL -o startrek_pc_2 -C MORPHEUS -C PC -C CPU_2
:done

