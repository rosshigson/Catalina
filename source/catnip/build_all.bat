@echo off
rem
rem build LMM/XMM optimizer phases
rem
call CompileOptimizer catopt_0
call CompileOptimizer catopt_1
call CompileOptimizer catopt_2
call CompileOptimizer catopt_3
call CompileOptimizer catopt_4
call CompileOptimizer catopt_5
call CompileOptimizer catopt_6
call CompileOptimizer catopt_7
call CompileOptimizer catopt_8
call CompileOptimizer catopt_9
call CompileOptimizer catopt_10
call CompileOptimizer catopt_11
call CompileOptimizer catopt_12
call CompileOptimizer catopt_13
rem
rem build CMM optimizer phases
rem
call CompileOptimizer cmmopt_0
call CompileOptimizer cmmopt_1
call CompileOptimizer cmmopt_2
call CompileOptimizer cmmopt_3
call CompileOptimizer cmmopt_4
call CompileOptimizer cmmopt_5
call CompileOptimizer cmmopt_6
call CompileOptimizer cmmopt_7
call CompileOptimizer cmmopt_8
call CompileOptimizer cmmopt_9
call CompileOptimizer cmmopt_10
call CompileOptimizer cmmopt_11
call CompileOptimizer cmmopt_12
call CompileOptimizer cmmopt_13
call CompileOptimizer cmmopt_14

rem
rem build optimizer phases
rem
gcc -o catnip catnip.c -DWIN32_PATHS
