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
REM          proxy running on CPU #1 providing access to keyboard 
REM
@echo.
catalina ..\test_suite\test_suite.c -o test_1_client_2 -lc -C MORPHEUS -C CPU_2 -C PROXY_KEYBOARD -C NO_MOUSE
@echo.
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o test_1_server_1 -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_1 -D NO_SCREEN -D NO_MOUSE
REM
REM TEST 2 : test_terminal runnning on CPU #2
REM          proxy running on CPU #1 providing access to keyboard & mouse 
REM
@echo.
catalina ..\examples\ex_terminal.c -o test_2_client_2 -lc -C MORPHEUS -C CPU_2 -C PROXY_KEYBOARD -C PROXY_MOUSE
@echo.
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o test_2_server_1 -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_1 -D NO_SCREEN 
REM
REM TEST 3 : test_fs runnning on CPU #2
REM          proxy running on CPU #1 providing access to 
REM          sd card, keyboard & mouse
REM
REM NOTE: We run out of cogs unless the NO_FP and NO_ARGS option are set on the client !!!
@echo.
catalina ..\file_systems\test_stdio_fs.c -lcx -C SMALL -o test_3_client_2 -C MORPHEUS -C CPU_2 -C PROXY_KEYBOARD -C PROXY_MOUSE -C PROXY_SD -C NO_FP -C NO_ARGS
@echo.
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o test_3_server_1 -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_1 -D NO_SCREEN 
REM
REM TEST 4 : test_suite runnning on CPU #1
REM          proxy running on CPU #2 providing access to screen
REM          (not all screen functions supported when proxying)
REM
@echo.
catalina ..\test_suite\test_suite.c -o test_4_client_1 -lc -C MORPHEUS -C CPU_1 -C PROXY_SCREEN
@echo.
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o test_4_server_2 -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_2 -D NO_KEYBOARD -D NO_MOUSE

:done
set TMP_LCCDIR=
