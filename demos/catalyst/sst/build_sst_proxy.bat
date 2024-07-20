@echo off
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
if NOT "%CATALINA_DEFINE%" == "" goto define_error

if "%1"== "TRIBLADEPROP" goto tribladeprop_build

@echo.
@echo ERROR: Unsupported target (or no target) specified. 
@echo.
@echo Usage: build_sst_proxy TRIBLADEPROP
@echo.
goto done

:tribladeprop_build
rem - build the game client
del /q /f *.binary
call build_tmp_var %2 %3 %4 %5
catalina sst.c ai.c battle.c catalina.c events.c finish.c moving.c planets.c reports.c setup.c -lcx -C LARGE -lm -M512k -o sst -C TRIBLADEPROP -C CPU_1 -C PROXY_SD -C CLOCK -C NO_MOUSE %TMP_VAR%
@echo.
rem - build a proxy server
call build_pasm_tmp_var %2 %3 %4 %5
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o proxy -I "%TMP_LCCDIR%\target\p1" -b -D TRIBLADEPROP -D CPU_2 -D NO_SCREEN -D NO_MOUSE -D NO_KEYBOARD %TMP_VAR%
goto done

:define_error
@echo.
@echo ERROR: Environment variable CATALINA_DEFINE is set (to %CATALINA_DEFINE%)
@echo.
@echo You must undefine this environment variable before using this 
@echo batch file, and instead specify the target on the command line.
@echo.

:done
set TMP_LCCDIR=
