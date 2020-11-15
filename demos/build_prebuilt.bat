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
@echo       set CATALINA_DEFINE=
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
@echo.
echo.
echo    =======================
echo    BUILDING PREBUILT DEMOS
echo    =======================
echo.
@echo on

catalina othello.c -lc -C NO_MOUSE 
catalina hello_world.c -lc -ltiny -tpod -o hello_debug -C NO_MOUSE
catalina startrek.c -lc -lma -C SMALL -o startrek_emm -e -C EEPROM -M96k

:done
