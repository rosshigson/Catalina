@echo off
rem save value of CATALINA_DEFINE
set TMP_DEFINE=%CATALINA_DEFINE%
echo.
if "%1"=="" goto no_parameters
set TMP_PARAMS=%1 %2 %3 %4 %5 %6 %7 %8 %9
for /f "delims=" %%A in ('echo %TMP_PARAMS%') do call :Trim %%A
if "%CATALINA_DEFINE%" == "" goto parameters_and_no_define
if "%CATALINA_DEFINE%" == "%TMP_PARAMS%" goto use_define
echo ERROR: Command line options conflict with CATALINA_DEFINE
echo.
echo    CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo    Command line options were %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
echo    Either set CATALINA_DEFINE to null using the following command:
echo.
echo       unset CATALINA_DEFINE
echo.
echo    or do not specify any command line parameters
echo.
goto done

:Trim
set TMP_PARAMS=%*
exit /b 0 

:parameters_and_no_define
echo NOTE: All programs will be built with options %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
echo   If these options conflict with options specified in this script, 
echo   the results may be unexpected.
echo.
set CATALINA_DEFINE=%TMP_PARAMS%
goto start

:no_parameters
if "%CATALINA_DEFINE%" == "" goto use_default
:use_define
echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo.
echo   All programs will be built using these options. If these conflict
echo   with options specified in this file, the results may be unexpected.
echo.
goto start

:use_default
echo NOTE: Environment variable CATALINA_DEFINE is not set
echo.
echo   All programs will be built for the default target 
echo.

:start
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:found_catalina
echo.
echo =============
echo BUILDING CAKE
echo =============
echo.

call bake_cake>bake.out
cd src\catalina
rem catalina -p2 -lcx -lmc -C LARGE -C RTC -W-w *.c -o cake -y
rem catalina -p2 -lcx -lmc -C LARGE -C RTC -C MHZ_300 -C NO_SD_DELAY -W-w *.c -o cake -y
catalina -p2 -lcx -lmc -C LARGE -C RTC -D TEST -W-w *.c -o cake -y
cd ..\..

:done
@echo off
rem restore value of CATALINA_DEFINE
set CATALINA_DEFINE=%TMP_DEFINE%
echo.
echo ====
echo Done
echo ====
echo.


