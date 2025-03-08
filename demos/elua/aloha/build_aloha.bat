@echo off
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto check_define
echo ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:check_define
if "%CATALINA_DEFINE%" == "" goto check_params
echo ERROR: CATALINA_DEFINE options may conflict with catapult options
echo.
echo    CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo.
echo    Set CATALINA_DEFINE to null using the following command:
echo.
echo       unset CATALINA_DEFINE
echo.
goto done

:check_params
if "%1" == "" goto do_build
echo ERROR: This script does not support command line parameters
echo.
goto done

:do_build
set CATALINA_DEFINE=P2_MASTER
catapult alua.c
move /Y alua.bin master.bin
catapult aluax.c
move /Y aluax.bin masterx.bin
catapult aluafx.c
move /Y aluafx.bin masterfx.bin
set CATALINA_DEFINE=P2_SLAVE
catapult alua.c
move /Y alua.bin slave.bin
catapult aluax.c
move /Y aluax.bin slavex.bin
catapult aluafx.c
move /Y aluafx.bin slavefx.bin
catapult sluafx.c
catapult sluafix.c
catapult sluacx.c
catapult sluacix.c
set CATALINA_DEFINE=
:done
