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
if EXIST "%LCCDIR%\bin\catalina.exe" goto check_make
echo ==========================================================================
echo           IMPORTANT: THIS INSTALLATION OF CATALINA HAS NO BINARIES
echo.
echo    If you downloaded Catalina from GitHub, then there should be a binary
echo    asset associated with the release containing Windows binaries. Or you
echo    can rebuild Catalina from source - for more details, see the document
echo    README.md and BUILD.TXT
echo ==========================================================================
:check_make
where /Q make.exe
if NOT ERRORLEVEL 1 goto make_ok
echo ==========================================================================
echo      IMPORTANT: THIS INSTALLATION OF CATALINA HAS NO 'MAKE' EXECUTABLE
echo.
echo    You can install 'make' by installing Cygwin, MinGW, MSYS, GnuWin32, 
echo    or (if you have an active internet connection) by executing the 
echo    following command:
echo.
echo       winget install ezwinports.make
echo.
echo    You will then need to close this Catalina window and open a new one.
echo    See the document README.md for more details.
echo ==========================================================================
GOTO done
:make_ok
cd %USERPROFILE%
:done
