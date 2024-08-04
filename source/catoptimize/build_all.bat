@echo off
rem
rem build LMM/XMM optimizer
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
gcc -o catoptimize catoptimize.c -DWIN32_PATHS
rem
rem build CMM optimizer
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
gcc -o cmmoptimize cmmoptimize.c -DWIN32_PATHS

call copy_all
