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
if "%1"== "MORPHEUS" goto morpheus_build

@echo.
@echo ERROR: Unsupported target (or no target) specified. 
@echo.
@echo Usage: build_sst_proxy TRIBLADEPROP
@echo    or: build_sst_proxy MORPHEUS
@echo.
goto done

:morpheus_build
rem 
rem MORPHEUS CANNOT RUN THIS VERSION OF STARTREK USING LOCAL DEVICES UNTIL A 
rem VGA DRIVER IS DEVELOPED THAT USES LESS COGS - BUT HERE ARE THE COMMANDS 
rem THAT WOULD BE REQUIRED TO BUILD IT ...
rem
rem - build the VGA game client
rem call build_tmp_var %2 %3 %4 %5
rem catalina sst.c ai.c battle.c catalina.c events.c finish.c moving.c planets.c reports.c setup.c -lcx -C LARGE -lma -M512k -o sst -C MORPHEUS -C CPU_2 -C PROXY_SD -C PROXY_KEYBOARD -C NO_MOUSE -C CLOCK %TMP_VAR%
rem @echo.
rem rem - build a VGA proxy server
rem call build_pasm_tmp_var %2 %3 %4 %5
rem spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o proxy -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_1 -D NO_SCREEN -D NO_MOUSE  %TMP_VAR%
rem
rem SO INSTEAD, WE BUILD A VERSION THAT USES A PC TERMINAL EMULATOR IN PLACE 
rem OF THE LOCAL VGA:
rem
rem - build the PC game client
del /q /f *.binary
call build_tmp_var %2 %3 %4 %5
catalina sst.c ai.c battle.c catalina.c events.c finish.c moving.c planets.c reports.c setup.c -lcx -C LARGE -lma -M512k -o sst -C MORPHEUS -C CPU_2 -C PROXY_SD -C PROXY_SCREEN -C PROXY_KEYBOARD -C NO_MOUSE -C PC -C CLOCK %TMP_VAR%
@echo.
rem - build a PC proxy server
call build_pasm_tmp_var %2 %3 %4 %5
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o proxy -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_1 -D NO_MOUSE -D PC %TMP_VAR%
goto done

:tribladeprop_build
rem - build the game client
del /q /f *.binary
call build_tmp_var %2 %3 %4 %5
catalina sst.c ai.c battle.c catalina.c events.c finish.c moving.c planets.c reports.c setup.c -lcx -C LARGE -lm -M512k -o sst -C TRIBLADEPROP -C CPU_1 -C PROXY_SD -C CLOCK -C NO_MOUSE %TMP_VAR%
@echo.
rem - build a proxy server
call build_pasm_tmp_var %2 %3 %4 %5
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o proxy -I "%TMP_LCCDIR%\target" -b -D TRIBLADEPROP -D CPU_2 -D NO_SCREEN -D NO_MOUSE -D NO_KEYBOARD %TMP_VAR%
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
