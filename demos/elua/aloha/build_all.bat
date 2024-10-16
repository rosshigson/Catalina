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
mv elua.bin master.bin
catapult eluax.c
mv eluax.bin masterx.bin
set CATALINA_DEFINE=P2_SLAVE
catapult elua.c
mv elua.bin slave.bin
catapult eluax.c
mv eluax.bin slavex.bin
set CATALINA_DEFINE=
:done
