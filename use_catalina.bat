@echo off
echo.
echo    ===================
echo    SETTING UP CATALINA
echo    ===================
echo.
if "%LCCDIR%" == "" goto default_lccdir
PATH=%LCCDIR%\bin;%PATH%
goto done
:default_lccdir
PATH=C:\Program Files\Catalina\bin;%PATH%
:done
call catalina_env.bat
