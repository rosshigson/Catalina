@echo off
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:found_catalina
set CATALINA_DEFINE=P2_MASTER
catapult elua.c
move /Y elua.bin master.bin
catapult eluax.c
move /Y eluax.bin masterx.bin
catapult eluafx.c
move /Y eluafx.bin masterfx.bin
set CATALINA_DEFINE=P2_SLAVE
catapult elua.c
move /Y elua.bin slave.bin
catapult eluax.c
move /Y eluax.bin slavex.bin
catapult eluafx.c
move /Y eluafx.bin slavefx.bin
catapult sluafx.c
catapult sluafix.c
catapult sluacx.c
catapult sluacix.c
set CATALINA_DEFINE=
:done
