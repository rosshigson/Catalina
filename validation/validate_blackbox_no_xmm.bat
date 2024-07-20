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
if exist results_blackbox.%1 del results_blackbox.%1

set platform=%1
if "%platform:~0,2%"=="P2" goto build_p2
if "%CATALINA_DEFINE:~0,2%"=="P2" goto goto build_p2

echo.
echo    =============
echo    VALIDATING P1
echo    =============
echo.

echo.
@echo WARNING: ENSURE THE UTILITIES HAVE BEEN BUILT FOR THE CORRECT PLATFORM!
echo.

call compile_and_debug_p1 %1 test_suite -ltiny -lc 
call compile_and_debug_p1 %1 test_suite -ltiny -lc -C COMPACT

call compile_and_debug_p1 %1 test_suite -lc 
call compile_and_debug_p1 %1 test_suite -lc -C COMPACT

call compile_and_debug_p1 %1 test_suite -lci 
call compile_and_debug_p1 %1 test_suite -lci -C COMPACT

call compile_and_debug_p1 %1 test_suite -lcix 
call compile_and_debug_p1 %1 test_suite -lcix -C COMPACT

call compile_and_debug_p1 %1 test_suite -lcx 
call compile_and_debug_p1 %1 test_suite -lcx -C COMPACT


goto done

:build_p2

echo.
echo    =============
echo    VALIDATING P2
echo    =============
echo.

call compile_and_debug_p2 %1 test_suite -ltiny -lc -C TINY
call compile_and_debug_p2 %1 test_suite -ltiny -lc -C NATIVE
call compile_and_debug_p2 %1 test_suite -ltiny -lc -C COMPACT

call compile_and_debug_p2 %1 test_suite -lc -C TINY
call compile_and_debug_p2 %1 test_suite -lc -C NATIVE
call compile_and_debug_p2 %1 test_suite -lc -C COMPACT

call compile_and_debug_p2 %1 test_suite -lci -C TINY
call compile_and_debug_p2 %1 test_suite -lci -C NATIVE
call compile_and_debug_p2 %1 test_suite -lci -C COMPACT

call compile_and_debug_p2 %1 test_suite -lcix -C TINY
call compile_and_debug_p2 %1 test_suite -lcix -C NATIVE
call compile_and_debug_p2 %1 test_suite -lcix -C COMPACT

call compile_and_debug_p2 %1 test_suite -lcx -C TINY
call compile_and_debug_p2 %1 test_suite -lcx -C NATIVE
call compile_and_debug_p2 %1 test_suite -lcx -C COMPACT


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


