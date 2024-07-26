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
if EXIST "%LCCDIR%\bin\catalina.exe" goto done
echo.
echo ==========================================================================
echo           IMPORTANT: THIS INSTALLATION OF CATALINA HAS NO BINARIES
echo.
echo    If you downloaded Catalina from GitHub, then there should be a binary
echo    asset associated with the release containing Windows binaries. Or you
echo    can rebuild Catalina from source - for more details, see the document
echo    README.md and BUILD.TXT
echo.
echo ==========================================================================
echo.
:done
call catalina_env.bat
cd %USERPROFILE%
