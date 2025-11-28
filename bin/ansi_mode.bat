@echo off
echo.
if /I "%1" == "ON" goto mode_on
if /I "%1" == "OFF" goto mode_off
if /I "%1" == "/?" goto mode_help
if /I "%1" == "/h" goto mode_help

:mode_help
echo Usage: %0 [ ON ^| OFF ]
echo.

reg query HKCU\Console /v VirtualTerminalLevel 2>nul | findstr /e "0x1" >nul 2>n
if %errorlevel% == 0 (
  echo ANSI mode is currently ON
) else (
  echo ANSI mode is currently OFF
)
goto done

:mode_on
reg add HKEY_CURRENT_USER\Console /v VirtualTerminalLevel /t REG_DWORD /d 0x00000001 /f >nul 2>nul
echo ANSI mode is now ON - start a new command line window
goto done

:mode_off
reg add HKEY_CURRENT_USER\Console /v VirtualTerminalLevel /t REG_DWORD /d 0x00000000 /f >nul 2>nul
echo ANSI mode is now OFF - start a new command line window
goto done
:done
