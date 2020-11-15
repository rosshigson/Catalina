@echo off
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
copy "%LCCDIR%\codeblocks\default.conf.Win32" "%APPDATA%\codeblocks\default.conf"

:done
@echo off
set TMP_LCCDIR=

echo.
echo  ====
echo  Done
echo  ====
echo.  

