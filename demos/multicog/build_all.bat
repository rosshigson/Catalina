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
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo.
echo   ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:found_catalina
@echo.
echo.
echo    ========================
echo    BUILDING MULTI-COG DEMOS
echo    ========================
echo.

set platform=%1
if "%platform:~0,2%"=="P2" goto build_p2

@echo on
catalina -lci dynamic_kernel.c utilities.c -C NO_MOUSE -C NO_FLOAT
catalina -lci resource_lock.c utilities.c -C NO_MOUSE -C NO_FLOAT
catalina -lci multiple_cogs.c utilities.c -C NO_KEYBOARD -C NO_MOUSE -C NO_FLOAT
catalina -lci dining_philosophers.c utilities.c -C NO_MOUSE -C NO_FLOAT
@echo off
goto done

:build_p2
@echo on
catalina -p2 -lci dynamic_kernel.c utilities.c -C NO_KEYBOARD -C NO_MOUSE -C NO_FLOAT
catalina -p2 -lci resource_lock.c utilities.c -C NO_MOUSE -C NO_FLOAT
catalina -p2 -lci multiple_cogs.c utilities.c -C NO_KEYBOARD -C NO_MOUSE -C NO_FLOAT
catalina -p2 -lci dining_philosophers.c utilities.c -C NO_MOUSE -C NO_FLOAT
@echo off

:done
set TMP_LCCDIR=
call unset CATALINA_DEFINE

echo.
echo  ====
echo  Done
echo  ====
echo.


