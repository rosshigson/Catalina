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
echo.
echo    =============
echo    Building eLua
echo    =============
echo.

echo.
echo copying source tree ...
echo.

if not exist elua mkdir elua
xcopy /s /y "%LCCDIR%"\demos\elua elua >NUL:

cd elua
call build_all %*
cd ..

