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
echo    =================
echo    BUILDING P1 DEMOS
echo    =================
echo.
@echo off
rem

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_1.c -o test_1_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_1.c -o test_1_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_2.c -o test_2_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_2.c -o test_2_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_3.c -o test_3_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_3.c -o test_3_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_4.c -o test_4_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_4.c -o test_4_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_5.c -o test_5_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_5.c -o test_5_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_6a.c test_6b.c test_6c.c -o test_6_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_6a.c test_6b.c test_6c.c -o test_6_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_7.c -o test_7_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_7.c -o test_7_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_8.c -o test_8_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_8.c -o test_8_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_9.c -o test_9_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_9.c -o test_9_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_10.c -o test_10_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_10.c -o test_10_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS sieve.c -o sieve_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z sieve.c -o sieve_p

catalina -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS -D PROPELLER -D"printf=t_printf" fftbench.c -o fftbench_s
catalina -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -D PROPELLER -D"printf=t_printf" -Z fftbench.c -o fftbench_p

goto done

:build_p2
@echo off
echo.
echo    =================
echo    BUILDING P2 DEMOS
echo    =================
echo.
@echo off
rem

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_1.c -o test_1_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_1.c -o test_1_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_2.c -o test_2_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_2.c -o test_2_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_3.c -o test_3_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_3.c -o test_3_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_4.c -o test_4_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_4.c -o test_4_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_5.c -o test_5_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_5.c -o test_5_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_6a.c test_6b.c test_6c.c -o test_6_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_6a.c test_6b.c test_6c.c -o test_6_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_7.c -o test_7_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_7.c -o test_7_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_8.c -o test_8_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_8.c -o test_8_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_9.c -o test_9_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_9.c -o test_9_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS test_10.c -o test_10_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z test_10.c -o test_10_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS sieve.c -o sieve_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -Z sieve.c -o sieve_p

catalina -p2 -lci -ltiny -O5 -C NO_FLOAT -C NO_ARGS -D __P2__ fftbench.c -o fftbench_s
catalina -p2 -lci -lthreads -ltiny -O5 -C NO_FLOAT -C NO_ARGS -D __P2__ -Z fftbench.c -o fftbench_p

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


