@echo off
rem
rem build LMM/XMM optimizer
rem
echo catopt_0 .. catopt_13 now have to be built under Cygwin!
rem call CompileOptimizer catopt_0
rem call CompileOptimizer catopt_1
rem call CompileOptimizer catopt_2
rem call CompileOptimizer catopt_3
rem call CompileOptimizer catopt_4
rem call CompileOptimizer catopt_5
rem call CompileOptimizer catopt_6
rem call CompileOptimizer catopt_7
rem call CompileOptimizer catopt_8
rem call CompileOptimizer catopt_9
rem call CompileOptimizer catopt_10
rem call CompileOptimizer catopt_11
rem call CompileOptimizer catopt_12
rem call CompileOptimizer catopt_13
gcc -o catoptimize catoptimize.c -DWIN32_PATHS
rem
rem build CMM optimizer
rem
echo cmmopt_0 .. cmmopt_14 now have to be built under Cygwin!
rem call CompileOptimizer cmmopt_0
rem call CompileOptimizer cmmopt_1
rem call CompileOptimizer cmmopt_2
rem call CompileOptimizer cmmopt_3
rem call CompileOptimizer cmmopt_4
rem call CompileOptimizer cmmopt_5
rem call CompileOptimizer cmmopt_6
rem call CompileOptimizer cmmopt_7
rem call CompileOptimizer cmmopt_8
rem call CompileOptimizer cmmopt_9
rem call CompileOptimizer cmmopt_10
rem call CompileOptimizer cmmopt_11
rem call CompileOptimizer cmmopt_12
rem call CompileOptimizer cmmopt_13
rem call CompileOptimizer cmmopt_14
gcc -o cmmoptimize cmmoptimize.c -DWIN32_PATHS

call copy_all
