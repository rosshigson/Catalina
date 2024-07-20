@echo off
rem
rem You may need to edit CYGWIN_DIR ...
rem
set CYGWIN_DIR=C:\cygwin64

if EXIST "%CYGWIN_DIR%\bin\bash.exe" goto found_cygwin
echo.
echo ERROR: Cygwin does not appear to be installed in %CYGWIN_DIR%
echo.
echo   Edit the batch file to update where Cygwin is intalled.
echo.
goto done

:found_cygwin
rem add Cygwin to PATH ...
set TMP_PATH=%PATH%
set PATH=%CYGWIN_DIR%\bin;%PATH%;
%CYGWIN_DIR%\bin\bash clean_cygwin
rem restore original PATH ...
set PATH=%TMP_PATH%

:done

