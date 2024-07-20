@echo off
echo.
echo    ===================
echo    SETTING UP CATALINA
echo    ===================
echo.
if NOT "%LCCDIR%" == "" goto lccdir_set
set LCCDIR=%CD%
:lccdir_set
set PATH=%LCCDIR%\bin;%PATH%;%LCCDIR%\GnuWin32\bin;
call catalina_env.bat
cd %USERPROFILE%
