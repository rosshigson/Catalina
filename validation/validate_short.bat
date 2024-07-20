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
goto have_parameters

:no_parameters
if "%CATALINA_DEFINE%" == "" goto use_default
:use_define
@echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
@echo.
@echo All programs will be built using these options. If these options conflict
@echo with any options specified in this file, the results may be unexpected.
goto have_parameters

:use_default
@echo NOTE: Environment variable CATALINA_DEFINE is not set
@echo.
@echo All programs will be built for the default target (CUSTOM) 

:have_parameters
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo.
echo   ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:found_catalina
@echo.

del *.binary > NUL: 2>&1
del *.bin > NUL: 2>&1
if exist results_serial.%1 del results_serial.%1

set platform=%1
if "%platform:~0,2%"=="P2" goto build_p2
if "%CATALINA_DEFINE:~0,2%"=="P2" goto goto build_p2

echo.
echo    =============
echo    VALIDATING P1
echo    =============
echo.

echo.
@echo WARNING: ENSURE THE UTILITIES HAVE_BEEN BUILT FOR THE CORRECT PLATFORM!
echo.

call compile_and_run_p1       %1 test_suite -ltiny -lc 
call compile_and_run_p1       %1 test_suite -ltiny -lc -C COMPACT
call compile_and_run_sram_p1  %1 test_suite -ltiny -lc -C SMALL
call compile_and_run_sram_p1  %1 test_suite -ltiny -lc -C LARGE

call compile_and_run_p1       %1 test_suite -lc 
call compile_and_run_p1       %1 test_suite -lc -C COMPACT
call compile_and_run_flash_p1 %1 test_suite -lc -C SMALL

call compile_and_run_p1       %1 test_suite -lci 
call compile_and_run_p1       %1 test_suite -lci -C COMPACT
call compile_and_run_flash_p1 %1 test_suite -lci -C LARGE

call compile_and_run_p1       %1 test_suite -lcix 
call compile_and_run_sram_p1  %1 test_suite -lcix -C LARGE
call compile_and_run_flash_p1 %1 test_suite -lcix -C SMALL

call compile_and_run_p1       %1 test_suite -lcx -C COMPACT
call compile_and_run_sram_p1  %1 test_suite -lcx -C SMALL
call compile_and_run_sram_p1  %1 test_suite -lcx -C LARGE

call compile_and_run_p1       %1 test_suite -O1 -lc 
call compile_and_run_flash_p1 %1 test_suite -O1 -lc -C SMALL

call compile_and_run_p1       %1 test_suite -O2 -lc 
call compile_and_run_p1       %1 test_suite -O2 -lc -C COMPACT
call compile_and_run_flash_p1 %1 test_suite -O2 -lc -C LARGE

call compile_and_run_sram_p1  %1 test_suite -O3 -lc -C SMALL
call compile_and_run_sram_p1  %1 test_suite -O3 -lc -C LARGE

call compile_and_run_p1       %1 test_suite -O4 -lc 
call compile_and_run_flash_p1 %1 test_suite -O4 -lc -C SMALL

call compile_and_run_p1       %1 test_suite -O5 -lc 
call compile_and_run_flash_p1 %1 test_suite -O5 -lc -C LARGE

call compile_and_run_p1       %1 test_suite -O1 -lci 

call compile_and_run_p1       %1 test_suite -O2 -lci 
call compile_and_run_flash_p1 %1 test_suite -O2 -lci -C SMALL
call compile_and_run_flash_p1 %1 test_suite -O2 -lci -C LARGE

call compile_and_run_p1       %1 test_suite -O3 -lci 
call compile_and_run_p1       %1 test_suite -O3 -lci -C COMPACT

call compile_and_run_p1       %1 test_suite -O4 -lci 
call compile_and_run_sram_p1  %1 test_suite -O4 -lci -C LARGE

call compile_and_run_p1       %1 test_suite -O5 -lci 
call compile_and_run_flash_p1 %1 test_suite -O5 -lci -C SMALL

call compile_and_run_sram_p1  %1 test_suite -O1 -lcx -C LARGE
call compile_and_run_flash_p1 %1 test_suite -O1 -lcx -C SMALL
call compile_and_run_flash_p1 %1 test_suite -O1 -lcx -C LARGE

call compile_and_run_p1       %1 test_suite -O2 -lcx 
call compile_and_run_p1       %1 test_suite -O2 -lcx -C COMPACT

call compile_and_run_p1       %1 test_suite -O3 -lcx 
call compile_and_run_flash_p1 %1 test_suite -O3 -lcx -C LARGE

call compile_and_run_p1       %1 test_suite -O4 -lcx 
call compile_and_run_sram_p1  %1 test_suite -O4 -lcx -C SMALL

call compile_and_run_flash_p1 %1 test_suite -O5 -lcx -C SMALL
call compile_and_run_flash_p1 %1 test_suite -O5 -lcx -C LARGE

call compile_and_run_sram_p1  %1 test_suite -O1 -lcix -C LARGE
call compile_and_run_flash_p1 %1 test_suite -O1 -lcix -C SMALL

call compile_and_run_p1       %1 test_suite -O2 -lcix 
call compile_and_run_flash_p1 %1 test_suite -O2 -lcix -C LARGE

call compile_and_run_p1       %1 test_suite -O3 -lcix 
call compile_and_run_p1       %1 test_suite -O3 -lcix -C COMPACT

call compile_and_run_sram_p1  %1 test_suite -O4 -lcix -C LARGE
call compile_and_run_flash_p1 %1 test_suite -O4 -lcix -C LARGE

call compile_and_run_p1       %1 test_suite -O5 -lcix 
call compile_and_run_sram_p1  %1 test_suite -O5 -lcix -C SMALL



call compile_and_run_p1       %1 test_multiple_cogs -ltiny -lc -lm 
call compile_and_run_p1       %1 test_multiple_cogs -ltiny -lc -lm -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -lc -lm

call compile_and_run_p1       %1 test_multiple_cogs -lci -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -lcix 

call compile_and_run_p1       %1 test_multiple_cogs -lcx -lm -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O1 -lc -lm 

call compile_and_run_p1       %1 test_multiple_cogs -O2 -lc -lm -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O3 -lc -lm 

call compile_and_run_p1       %1 test_multiple_cogs -O4 -lc -lm -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O5 -lc -lm 

call compile_and_run_p1       %1 test_multiple_cogs -O1 -lci 

call compile_and_run_p1       %1 test_multiple_cogs -O2 -lci 

call compile_and_run_p1       %1 test_multiple_cogs -O3 -lci -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O4 -lci -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O5 -lci 

call compile_and_run_p1       %1 test_multiple_cogs -O1 -lcx -lm  -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O2 -lcx -lm  

call compile_and_run_p1       %1 test_multiple_cogs -O3 -lcx -lm  -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O4 -lcx -lm  

call compile_and_run_p1       %1 test_multiple_cogs -O5 -lcx -lm  -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O1 -lcix 

call compile_and_run_p1       %1 test_multiple_cogs -O2 -lcix 

call compile_and_run_p1       %1 test_multiple_cogs -O3 -lcix -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O4 -lcix -C COMPACT

call compile_and_run_p1       %1 test_multiple_cogs -O5 -lcix 



call compile_and_run_p1       %1 test_threads -lthreads -ltiny -lc -lm 

call compile_and_run_p1       %1 test_threads -lthreads -lc -lm -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -lci 

call compile_and_run_p1       %1 test_threads -lthreads -lcix 

call compile_and_run_p1       %1 test_threads -lthreads -lcx -lm -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O1 -lc -lm 

call compile_and_run_p1       %1 test_threads -lthreads -O2 -lc -lm -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O3 -lc -lm 

call compile_and_run_p1       %1 test_threads -lthreads -O4 -lc -lm -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O5 -lc -lm 

call compile_and_run_p1       %1 test_threads -lthreads -O1 -lci -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O2 -lci 

call compile_and_run_p1       %1 test_threads -lthreads -O3 -lci -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O4 -lci 

call compile_and_run_p1       %1 test_threads -lthreads -O5 -lci -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O1 -lcx -lm 

call compile_and_run_p1       %1 test_threads -lthreads -O2 -lcx -lm -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O3 -lcx -lm 

call compile_and_run_p1       %1 test_threads -lthreads -O4 -lcx -lm -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O5 -lcx -lm 

call compile_and_run_p1       %1 test_threads -lthreads -O1 -lcix -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O2 -lcix 

call compile_and_run_p1       %1 test_threads -lthreads -O3 -lcix -C COMPACT

call compile_and_run_p1       %1 test_threads -lthreads -O4 -lcix 

call compile_and_run_p1       %1 test_threads -lthreads -O5 -lcix -C COMPACT



call compile_and_run_p1       %1 test_float -lc -lm -C COMPACT
call compile_and_run_sram_p1  %1 test_float -lc -lm -C SMALL
call compile_and_run_flash_p1 %1 test_float -lc -lm -C LARGE

call compile_and_run_sram_p1  %1 test_float -lcx -lm -C SMALL
call compile_and_run_sram_p1  %1 test_float -lcx -lm -C LARGE

call compile_and_run_flash_p1 %1 test_float -O1 -lc -lm -C SMALL
call compile_and_run_flash_p1 %1 test_float -O1 -lc -lm -C LARGE

call compile_and_run_p1       %1 test_float -O2 -lc -lm -C COMPACT
call compile_and_run_flash_p1 %1 test_float -O2 -lc -lm -C LARGE

call compile_and_run_p1       %1 test_float -O3 -lc -lm -C COMPACT
call compile_and_run_sram_p1  %1 test_float -O3 -lc -lm -C LARGE

call compile_and_run_sram_p1  %1 test_float -O4 -lc -lm -C SMALL
call compile_and_run_sram_p1  %1 test_float -O4 -lc -lm -C LARGE

call compile_and_run_sram_p1  %1 test_float -O5 -lc -lm -C SMALL
call compile_and_run_sram_p1  %1 test_float -O5 -lc -lm -C LARGE

call compile_and_run_sram_p1  %1 test_float -O1 -lcx -lm -C LARGE
call compile_and_run_flash_p1 %1 test_float -O1 -lcx -lm -C SMALL

call compile_and_run_sram_p1  %1 test_float -O2 -lcx -lm -C SMALL
call compile_and_run_flash_p1 %1 test_float -O2 -lcx -lm -C LARGE

call compile_and_run_sram_p1  %1 test_float -O3 -lcx -lm -C LARGE
call compile_and_run_flash_p1 %1 test_float -O3 -lcx -lm -C SMALL

call compile_and_run_sram_p1  %1 test_float -O4 -lcx -lm -C SMALL
call compile_and_run_flash_p1 %1 test_float -O4 -lcx -lm -C LARGE

call compile_and_run_sram_p1  %1 test_float -O5 -lcx -lm -C LARGE
call compile_and_run_flash_p1 %1 test_float -O5 -lcx -lm -C SMALL


call compile_and_run_sram_p1  %1 test_float -lc -lma -C SMALL
call compile_and_run_flash_p1 %1 test_float -lc -lma -C LARGE

call compile_and_run_sram_p1  %1 test_float -lcx -lma -C LARGE
call compile_and_run_flash_p1 %1 test_float -lcx -lma -C SMALL

call compile_and_run_p1       %1 test_float -O1 -lc -lma -C COMPACT
call compile_and_run_flash_p1 %1 test_float -O1 -lc -lma -C LARGE

call compile_and_run_sram_p1  %1 test_float -O2 -lc -lma -C LARGE
call compile_and_run_flash_p1 %1 test_float -O2 -lc -lma -C SMALL

call compile_and_run_p1       %1 test_float -O3 -lc -lma -C COMPACT
call compile_and_run_sram_p1  %1 test_float -O3 -lc -lma -C SMALL

call compile_and_run_sram_p1  %1 test_float -O4 -lc -lma -C LARGE
call compile_and_run_flash_p1 %1 test_float -O4 -lc -lma -C SMALL

call compile_and_run_sram_p1  %1 test_float -O5 -lc -lma -C SMALL
call compile_and_run_flash_p1 %1 test_float -O5 -lc -lma -C LARGE

call compile_and_run_sram_p1  %1 test_float -O1 -lcx -lma -C LARGE
call compile_and_run_flash_p1 %1 test_float -O1 -lcx -lma -C SMALL

call compile_and_run_sram_p1  %1 test_float -O2 -lcx -lma -C SMALL
call compile_and_run_flash_p1 %1 test_float -O2 -lcx -lma -C LARGE

call compile_and_run_sram_p1  %1 test_float -O3 -lcx -lma -C LARGE
call compile_and_run_flash_p1 %1 test_float -O3 -lcx -lma -C SMALL

call compile_and_run_sram_p1  %1 test_float -O4 -lcx -lma -C SMALL
call compile_and_run_flash_p1 %1 test_float -O4 -lcx -lma -C LARGE

call compile_and_run_sram_p1  %1 test_float -O5 -lcx -lma -C LARGE
call compile_and_run_flash_p1 %1 test_float -O5 -lcx -lma -C SMALL


call compile_and_run_p1       %1 test_float -lc -lmb -C COMPACT
call compile_and_run_sram_p1  %1 test_float -lc -lmb -C SMALL

call compile_and_run_sram_p1  %1 test_float -lcx -lmb -C SMALL
call compile_and_run_flash_p1 %1 test_float -lcx -lmb -C LARGE

call compile_and_run_p1       %1 test_float -O1 -lc -lmb -C COMPACT
call compile_and_run_flash_p1 %1 test_float -O1 -lc -lmb -C SMALL

call compile_and_run_sram_p1  %1 test_float -O2 -lc -lmb -C SMALL
call compile_and_run_flash_p1 %1 test_float -O2 -lc -lmb -C LARGE

call compile_and_run_sram_p1  %1 test_float -O3 -lc -lmb -C LARGE
call compile_and_run_flash_p1 %1 test_float -O3 -lc -lmb -C SMALL

call compile_and_run_p1       %1 test_float -O4 -lc -lmb -C COMPACT
call compile_and_run_sram_p1  %1 test_float -O4 -lc -lmb -C SMALL

call compile_and_run_sram_p1  %1 test_float -O5 -lc -lmb -C LARGE
call compile_and_run_flash_p1 %1 test_float -O5 -lc -lmb -C SMALL

call compile_and_run_sram_p1  %1 test_float -O1 -lcx -lmb -C SMALL
call compile_and_run_flash_p1 %1 test_float -O1 -lcx -lmb -C LARGE

call compile_and_run_sram_p1  %1 test_float -O2 -lcx -lmb -C LARGE
call compile_and_run_flash_p1 %1 test_float -O2 -lcx -lmb -C SMALL

call compile_and_run_sram_p1  %1 test_float -O3 -lcx -lmb -C SMALL
call compile_and_run_flash_p1 %1 test_float -O3 -lcx -lmb -C LARGE

call compile_and_run_sram_p1  %1 test_float -O4 -lcx -lmb -C LARGE
call compile_and_run_flash_p1 %1 test_float -O4 -lcx -lmb -C SMALL

call compile_and_run_sram_p1  %1 test_float -O5 -lcx -lmb -C SMALL
call compile_and_run_flash_p1 %1 test_float -O5 -lcx -lmb -C LARGE



call compile_and_run_sram_p1  %1 test_dosfs -C SD -ltiny -lc -lm -C SMALL
call compile_and_run_sram_p1  %1 test_dosfs -C SD -ltiny -lc -lm -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -ltiny -lc -lm -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -ltiny -lc -lm -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -lc -lm -C SMALL
call compile_and_run_sram_p1  %1 test_dosfs -C SD -lc -lm -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -lci -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -lci -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -lcix -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -lcix -C SMALL

call compile_and_run_sram_p1  %1 test_dosfs -C SD -lcx -lm -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -lcx -lm -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O1 -lc -lm -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O1 -lc -lm -C SMALL

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O2 -lc -lm -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O2 -lc -lm -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O3 -lc -lm -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O3 -lc -lm -C SMALL

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O4 -lc -lm -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O4 -lc -lm -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O5 -lc -lm -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O5 -lc -lm -C SMALL

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O1 -lci -C SMALL
call compile_and_run_sram_p1  %1 test_dosfs -C SD -O1 -lci -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O2 -lci -C SMALL
call compile_and_run_sram_p1  %1 test_dosfs -C SD -O2 -lci -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O2 -lci -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O2 -lci -C LARGE

call compile_and_run_flash_p1 %1 test_dosfs -C SD -O3 -lci -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O3 -lci -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O4 -lci -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O4 -lci -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O5 -lci -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O5 -lci -C SMALL

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O1 -lcx -lm -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O1 -lcx -lm -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O2 -lcx -lm -C SMALL
call compile_and_run_sram_p1  %1 test_dosfs -C SD -O2 -lcx -lm -C LARGE

call compile_and_run_flash_p1 %1 test_dosfs -C SD -O3 -lcx -lm -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O3 -lcx -lm -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O4 -lcx -lm -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O4 -lcx -lm -C SMALL

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O5 -lcx -lm -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O5 -lcx -lm -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O1 -lcix -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O1 -lcix -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O2 -lcix -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O2 -lcix -C SMALL

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O3 -lcix -C LARGE
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O3 -lcix -C SMALL

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O4 -lcix -C SMALL
call compile_and_run_flash_p1 %1 test_dosfs -C SD -O4 -lcix -C LARGE

call compile_and_run_sram_p1  %1 test_dosfs -C SD -O5 -lcix -C SMALL
call compile_and_run_sram_p1  %1 test_dosfs -C SD -O5 -lcix -C LARGE



goto done

:build_p2

echo.
echo    =============
echo    VALIDATING P2
echo    =============
echo.

call compile_and_run_p2 %1 test_suite -ltiny -lc -C TINY
call compile_and_run_p2 %1 test_suite -ltiny -lc -C NATIVE
call compile_and_run_p2 %1 test_suite -ltiny -lc -C COMPACT

call compile_and_run_p2 %1 test_suite -lc -C NATIVE
call compile_and_run_p2 %1 test_suite -lc -C COMPACT

call compile_and_run_p2 %1 test_suite -lci -C TINY
call compile_and_run_p2 %1 test_suite -lci -C COMPACT

call compile_and_run_p2 %1 test_suite -lcix -C TINY
call compile_and_run_p2 %1 test_suite -lcix -C NATIVE

call compile_and_run_p2 %1 test_suite -lcx -C NATIVE
call compile_and_run_p2 %1 test_suite -lcx -C COMPACT

call compile_and_run_p2 %1 test_suite -O1 -lc -C TINY
call compile_and_run_p2 %1 test_suite -O1 -lc -C COMPACT

call compile_and_run_p2 %1 test_suite -O2 -lc -C TINY
call compile_and_run_p2 %1 test_suite -O2 -lc -C NATIVE

call compile_and_run_p2 %1 test_suite -O3 -lc -C NATIVE
call compile_and_run_p2 %1 test_suite -O3 -lc -C COMPACT

call compile_and_run_p2 %1 test_suite -O4 -lc -C TINY
call compile_and_run_p2 %1 test_suite -O4 -lc -C NATIVE

call compile_and_run_p2 %1 test_suite -O5 -lc -C NATIVE
call compile_and_run_p2 %1 test_suite -O5 -lc -C COMPACT

call compile_and_run_p2 %1 test_suite -O1 -lci -C TINY
call compile_and_run_p2 %1 test_suite -O1 -lci -C NATIVE

call compile_and_run_p2 %1 test_suite -O2 -lci -C NATIVE
call compile_and_run_p2 %1 test_suite -O2 -lci -C COMPACT

call compile_and_run_p2 %1 test_suite -O3 -lci -C TINY
call compile_and_run_p2 %1 test_suite -O3 -lci -C NATIVE

call compile_and_run_p2 %1 test_suite -O4 -lci -C NATIVE
call compile_and_run_p2 %1 test_suite -O4 -lci -C COMPACT

call compile_and_run_p2 %1 test_suite -O5 -lci -C TINY
call compile_and_run_p2 %1 test_suite -O5 -lci -C NATIVE

call compile_and_run_p2 %1 test_suite -O1 -lcx -C TINY
call compile_and_run_p2 %1 test_suite -O1 -lcx -C COMPACT

call compile_and_run_p2 %1 test_suite -O2 -lcx -C NATIVE
call compile_and_run_p2 %1 test_suite -O2 -lcx -C COMPACT

call compile_and_run_p2 %1 test_suite -O3 -lcx -C TINY
call compile_and_run_p2 %1 test_suite -O3 -lcx -C NATIVE

call compile_and_run_p2 %1 test_suite -O4 -lcx -C TINY
call compile_and_run_p2 %1 test_suite -O4 -lcx -C COMPACT

call compile_and_run_p2 %1 test_suite -O5 -lcx -C NATIVE
call compile_and_run_p2 %1 test_suite -O5 -lcx -C COMPACT

call compile_and_run_p2 %1 test_suite -O1 -lcix -C TINY
call compile_and_run_p2 %1 test_suite -O1 -lcix -C NATIVE

call compile_and_run_p2 %1 test_suite -O2 -lcix -C TINY
call compile_and_run_p2 %1 test_suite -O2 -lcix -C COMPACT

call compile_and_run_p2 %1 test_suite -O3 -lcix -C NATIVE
call compile_and_run_p2 %1 test_suite -O3 -lcix -C COMPACT

call compile_and_run_p2 %1 test_suite -O4 -lcix -C TINY
call compile_and_run_p2 %1 test_suite -O4 -lcix -C NATIVE

call compile_and_run_p2 %1 test_suite -O5 -lcix -C NATIVE
call compile_and_run_p2 %1 test_suite -O5 -lcix -C COMPACT



call compile_and_run_p2 %1 test_multiple_cogs -ltiny -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_multiple_cogs -ltiny -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -lc -lm -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -lci -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -lci -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -lcix -C NATIVE
call compile_and_run_p2 %1 test_multiple_cogs -lcix -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -lcx -lm -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O1 -lc -lm -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O1 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -O2 -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_multiple_cogs -O2 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O3 -lc -lm -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O3 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O4 -lc -lm -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O4 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -O5 -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_multiple_cogs -O5 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O1 -lci -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O1 -lci -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O2 -lci -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O2 -lci -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -O3 -lci -C NATIVE
call compile_and_run_p2 %1 test_multiple_cogs -O3 -lci -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O4 -lci -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O4 -lci -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O5 -lci -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O5 -lci -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -O1 -lcx -lm  -C NATIVE
call compile_and_run_p2 %1 test_multiple_cogs -O1 -lcx -lm  -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O2 -lcx -lm  -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O2 -lcx -lm  -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O3 -lcx -lm  -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O3 -lcx -lm  -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -O4 -lcx -lm  -C NATIVE
call compile_and_run_p2 %1 test_multiple_cogs -O4 -lcx -lm  -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O5 -lcx -lm  -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O5 -lcx -lm  -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -O1 -lcix -C NATIVE
call compile_and_run_p2 %1 test_multiple_cogs -O1 -lcix -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O2 -lcix -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O2 -lcix -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -O3 -lcix -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O3 -lcix -C COMPACT

call compile_and_run_p2 %1 test_multiple_cogs -O4 -lcix -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O4 -lcix -C NATIVE

call compile_and_run_p2 %1 test_multiple_cogs -O5 -lcix -C TINY
call compile_and_run_p2 %1 test_multiple_cogs -O5 -lcix -C COMPACT



call compile_and_run_p2 %1 test_threads -lthreads -ltiny -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -ltiny -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -lc -lm -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_threads -lthreads -lci -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -lci -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -lcix -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -lcix -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -lcx -lm -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_threads -lthreads -O1 -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -O1 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O2 -lc -lm -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O2 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O3 -lc -lm -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O3 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_threads -lthreads -O4 -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -O4 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O5 -lc -lm -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O5 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O1 -lci -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O1 -lci -C NATIVE

call compile_and_run_p2 %1 test_threads -lthreads -O2 -lci -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -O2 -lci -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O3 -lci -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O3 -lci -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O4 -lci -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -O4 -lci -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O5 -lci -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O5 -lci -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O1 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O1 -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_threads -lthreads -O2 -lcx -lm -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -O2 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O3 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O3 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O4 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O4 -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_threads -lthreads -O5 -lcx -lm -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -O5 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O1 -lcix -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O1 -lcix -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O2 -lcix -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O2 -lcix -C NATIVE

call compile_and_run_p2 %1 test_threads -lthreads -O3 -lcix -C NATIVE
call compile_and_run_p2 %1 test_threads -lthreads -O3 -lcix -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O4 -lcix -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O4 -lcix -C COMPACT

call compile_and_run_p2 %1 test_threads -lthreads -O5 -lcix -C TINY
call compile_and_run_p2 %1 test_threads -lthreads -O5 -lcix -C NATIVE



call compile_and_run_p2 %1 test_interrupts -lint -lthreads -ltiny -lc -lm -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -ltiny -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -ltiny -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -lci -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -lci -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -lcix -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -lcix -C NATIVE

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -lcx -lm -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O1 -lc -lm -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O1 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O2 -lc -lm -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O2 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O3 -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O3 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O4 -lc -lm -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O4 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O5 -lc -lm -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O5 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O1 -lci -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O1 -lci -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O2 -lci -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O2 -lci -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O3 -lci -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O3 -lci -C NATIVE

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O4 -lci -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O4 -lci -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O5 -lci -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O5 -lci -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O1 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O1 -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O2 -lcx -lm -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O2 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O3 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O3 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O4 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O4 -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O5 -lcx -lm -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O5 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O1 -lcix -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O1 -lcix -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O2 -lcix -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O2 -lcix -C NATIVE

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O3 -lcix -C NATIVE
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O3 -lcix -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O4 -lcix -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O4 -lcix -C COMPACT

call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O5 -lcix -C TINY
call compile_and_run_p2 %1 test_interrupts -lint -lthreads -O5 -lcix -C NATIVE



call compile_and_run_p2 %1 test_float -lc -lm -C TINY
call compile_and_run_p2 %1 test_float -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_float -lcx -lm -C COMPACT
call compile_and_run_p2 %1 test_float -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_float -O1 -lc -lm -C TINY
call compile_and_run_p2 %1 test_float -O1 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_float -O2 -lc -lm -C COMPACT
call compile_and_run_p2 %1 test_float -O2 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_float -O3 -lc -lm -C TINY
call compile_and_run_p2 %1 test_float -O3 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_float -O4 -lc -lm -C TINY
call compile_and_run_p2 %1 test_float -O4 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_float -O5 -lc -lm -C COMPACT
call compile_and_run_p2 %1 test_float -O5 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_float -O1 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_float -O1 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_float -O2 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_float -O2 -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_float -O3 -lcx -lm -C COMPACT
call compile_and_run_p2 %1 test_float -O3 -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_float -O4 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_float -O4 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_float -O5 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_float -O5 -lcx -lm -C NATIVE


call compile_and_run_p2 %1 test_float -lc -lma -C TINY
call compile_and_run_p2 %1 test_float -lc -lma -C NATIVE

call compile_and_run_p2 %1 test_float -lcx -lma -C TINY
call compile_and_run_p2 %1 test_float -lcx -lma -C COMPACT

call compile_and_run_p2 %1 test_float -O1 -lc -lma -C TINY
call compile_and_run_p2 %1 test_float -O1 -lc -lma -C NATIVE

call compile_and_run_p2 %1 test_float -O2 -lc -lma -C TINY
call compile_and_run_p2 %1 test_float -O2 -lc -lma -C NATIVE

call compile_and_run_p2 %1 test_float -O3 -lc -lma -C TINY
call compile_and_run_p2 %1 test_float -O3 -lc -lma -C COMPACT

call compile_and_run_p2 %1 test_float -O4 -lc -lma -C COMPACT
call compile_and_run_p2 %1 test_float -O4 -lc -lma -C NATIVE

call compile_and_run_p2 %1 test_float -O5 -lc -lma -C TINY
call compile_and_run_p2 %1 test_float -O5 -lc -lma -C NATIVE

call compile_and_run_p2 %1 test_float -O1 -lcx -lma -C TINY
call compile_and_run_p2 %1 test_float -O1 -lcx -lma -C COMPACT

call compile_and_run_p2 %1 test_float -O2 -lcx -lma -C COMPACT
call compile_and_run_p2 %1 test_float -O2 -lcx -lma -C NATIVE

call compile_and_run_p2 %1 test_float -O3 -lcx -lma -C TINY
call compile_and_run_p2 %1 test_float -O3 -lcx -lma -C NATIVE

call compile_and_run_p2 %1 test_float -O4 -lcx -lma -C COMPACT
call compile_and_run_p2 %1 test_float -O4 -lcx -lma -C NATIVE

call compile_and_run_p2 %1 test_float -O5 -lcx -lma -C TINY
call compile_and_run_p2 %1 test_float -O5 -lcx -lma -C COMPACT


call compile_and_run_p2 %1 test_float -lc -lmb -C TINY
call compile_and_run_p2 %1 test_float -lc -lmb -C COMPACT

call compile_and_run_p2 %1 test_float -lcx -lmb -C COMPACT
call compile_and_run_p2 %1 test_float -lcx -lmb -C NATIVE

call compile_and_run_p2 %1 test_float -O1 -lc -lmb -C TINY
call compile_and_run_p2 %1 test_float -O1 -lc -lmb -C NATIVE

call compile_and_run_p2 %1 test_float -O2 -lc -lmb -C TINY
call compile_and_run_p2 %1 test_float -O2 -lc -lmb -C COMPACT

call compile_and_run_p2 %1 test_float -O3 -lc -lmb -C COMPACT
call compile_and_run_p2 %1 test_float -O3 -lc -lmb -C NATIVE

call compile_and_run_p2 %1 test_float -O4 -lc -lmb -C TINY
call compile_and_run_p2 %1 test_float -O4 -lc -lmb -C NATIVE

call compile_and_run_p2 %1 test_float -O5 -lc -lmb -C TINY
call compile_and_run_p2 %1 test_float -O5 -lc -lmb -C COMPACT

call compile_and_run_p2 %1 test_float -O1 -lcx -lmb -C COMPACT
call compile_and_run_p2 %1 test_float -O1 -lcx -lmb -C NATIVE

call compile_and_run_p2 %1 test_float -O2 -lcx -lmb -C TINY
call compile_and_run_p2 %1 test_float -O2 -lcx -lmb -C NATIVE

call compile_and_run_p2 %1 test_float -O3 -lcx -lmb -C TINY
call compile_and_run_p2 %1 test_float -O3 -lcx -lmb -C COMPACT

call compile_and_run_p2 %1 test_float -O4 -lcx -lmb -C COMPACT
call compile_and_run_p2 %1 test_float -O4 -lcx -lmb -C NATIVE

call compile_and_run_p2 %1 test_float -O5 -lcx -lmb -C TINY
call compile_and_run_p2 %1 test_float -O5 -lcx -lmb -C NATIVE



call compile_and_run_p2 %1 test_float -lc -lmc -C COMPACT
call compile_and_run_p2 %1 test_float -lc -lmc -C NATIVE

call compile_and_run_p2 %1 test_float -lcx -lmc -C TINY
call compile_and_run_p2 %1 test_float -lcx -lmc -C NATIVE

call compile_and_run_p2 %1 test_float -O1 -lc -lmc -C TINY
call compile_and_run_p2 %1 test_float -O1 -lc -lmc -C COMPACT

call compile_and_run_p2 %1 test_float -O2 -lc -lmc -C COMPACT
call compile_and_run_p2 %1 test_float -O2 -lc -lmc -C NATIVE

call compile_and_run_p2 %1 test_float -O3 -lc -lmc -C TINY
call compile_and_run_p2 %1 test_float -O3 -lc -lmc -C NATIVE

call compile_and_run_p2 %1 test_float -O4 -lc -lmc -C TINY
call compile_and_run_p2 %1 test_float -O4 -lc -lmc -C COMPACT

call compile_and_run_p2 %1 test_float -O5 -lc -lmc -C COMPACT
call compile_and_run_p2 %1 test_float -O5 -lc -lmc -C NATIVE

call compile_and_run_p2 %1 test_float -O1 -lcx -lmc -C TINY
call compile_and_run_p2 %1 test_float -O1 -lcx -lmc -C NATIVE

call compile_and_run_p2 %1 test_float -O2 -lcx -lmc -C TINY
call compile_and_run_p2 %1 test_float -O2 -lcx -lmc -C COMPACT

call compile_and_run_p2 %1 test_float -O3 -lcx -lmc -C COMPACT
call compile_and_run_p2 %1 test_float -O3 -lcx -lmc -C NATIVE

call compile_and_run_p2 %1 test_float -O4 -lcx -lmc -C TINY
call compile_and_run_p2 %1 test_float -O4 -lcx -lmc -C NATIVE

call compile_and_run_p2 %1 test_float -O5 -lcx -lmc -C TINY
call compile_and_run_p2 %1 test_float -O5 -lcx -lmc -C COMPACT



call compile_and_run_p2 %1 test_dosfs -C SD -ltiny -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_dosfs -C SD -ltiny -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -lc -lm -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -lci -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -lci -C NATIVE

call compile_and_run_p2 %1 test_dosfs -C SD -lcix -C NATIVE
call compile_and_run_p2 %1 test_dosfs -C SD -lcix -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -lcx -lm -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O1 -lc -lm -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O1 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_dosfs -C SD -O2 -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_dosfs -C SD -O2 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O3 -lc -lm -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O3 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O4 -lc -lm -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O4 -lc -lm -C NATIVE

call compile_and_run_p2 %1 test_dosfs -C SD -O5 -lc -lm -C NATIVE
call compile_and_run_p2 %1 test_dosfs -C SD -O5 -lc -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O1 -lci -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O1 -lci -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O2 -lci -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O2 -lci -C NATIVE

call compile_and_run_p2 %1 test_dosfs -C SD -O3 -lci -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O3 -lci -C NATIVE

call compile_and_run_p2 %1 test_dosfs -C SD -O4 -lci -C NATIVE
call compile_and_run_p2 %1 test_dosfs -C SD -O4 -lci -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O5 -lci -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O5 -lci -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O1 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O1 -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_dosfs -C SD -O2 -lcx -lm -C NATIVE
call compile_and_run_p2 %1 test_dosfs -C SD -O2 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O3 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O3 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O4 -lcx -lm -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O4 -lcx -lm -C NATIVE

call compile_and_run_p2 %1 test_dosfs -C SD -O5 -lcx -lm -C NATIVE
call compile_and_run_p2 %1 test_dosfs -C SD -O5 -lcx -lm -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O1 -lcix -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O1 -lcix -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O2 -lcix -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O2 -lcix -C NATIVE

call compile_and_run_p2 %1 test_dosfs -C SD -O3 -lcix -C NATIVE
call compile_and_run_p2 %1 test_dosfs -C SD -O3 -lcix -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O4 -lcix -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O4 -lcix -C COMPACT

call compile_and_run_p2 %1 test_dosfs -C SD -O5 -lcix -C TINY
call compile_and_run_p2 %1 test_dosfs -C SD -O5 -lcix -C NATIVE


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


