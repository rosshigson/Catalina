@echo off
if "%CATALINA_DEFINE%" == "" goto no_define
@echo.
@echo ERROR: please unset CATALINA_DEFINE before running this script.
@echo.
goto done

:no_define
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
@echo off
REM
REM TEST 1 : test_suite runnning on CPU #2
REM          proxy running on CPU #1 providing access to screen and
REM          keyboard 
REM
@echo.
catalina ..\test_suite\test_suite.c -o test_1_client_2 -lc -C TRIBLADEPROP -C CPU_2 -C PROXY_KEYBOARD -C PROXY_SCREEN -C NO_MOUSE
@echo.
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o test_1_server_1 -I "%TMP_LCCDIR%\target\p1" -b -D TRIBLADEPROP -D CPU_1 -D NO_SD
REM
REM TEST 2 : test_fs runnning on CPU #1
REM          proxy running on CPU #2 providing access to sd card
REM
@echo.
catalina ..\file_systems\test_stdio_fs.c -lcx -C SMALL -o test_2_client_1 -C TRIBLADEPROP -C CPU_1 -C PROXY_SD -C NO_MOUSE -C NO_FP
@echo.
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o test_2_server_2 -I "%TMP_LCCDIR%\target\p1" -b -D TRIBLADEPROP -D CPU_2 -D NO_SCREEN -D NO_KEYBOARD -D NO_MOUSE

:done
set TMP_LCCDIR=
