@echo off
echo.
echo    ===================
echo    SETTING UP CATALINA
echo    ===================
echo.
if "%LCCDIR%" == "" goto default_dir
PATH=%LCCDIR%\bin;%PATH%;%LCCDIR%\GnuWin32\bin;
goto done
:default_dir
PATH=%CD%\bin;%PATH%;%CD%\GnuWin32\bin;
:done
call catalina_env.bat
