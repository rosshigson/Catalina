@echo off
if "%1" == "" goto no_parameters
@echo.
@echo Parameters not allowed when compiling for MORPHEUS
@echo.
goto done

:no_parameters
if "%CATALINA_DEFINE%" == "" goto no_define
:use_define
@echo.
@echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
@echo.
@echo CATALINA_DEFINE must not be set when compiling for MORPHEUS
@echo.
goto done

:no_define
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
REM
REM dummy program to stop one CPU interfering while we load the other
catalina null.c -C NO_HMI
REM
REM example running on CPU #1
catalina debug_main.c debug_functions_1.c debug_functions_2.c -lci -g3 -o example_client_1 -C MORPHEUS -C CPU_1 -C PROXY_SCREEN
REM proxy running on CPU #2 providing access to screen
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o example_server_2 -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_2 -D NO_KEYBOARD -D NO_MOUSE
:done
set TMP_LCCDIR=
