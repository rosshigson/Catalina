@echo off

set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo.
echo   ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:found_catalina

if NOT EXIST "%1" goto try_bin

set file_name=%1
goto found_file

:try_bin

if NOT EXIST "%1.bin" goto usage

set file_name=%1.bin
goto found_file

:usage
echo.
echo Usage: flash_payload file_name[.bin] [ ... payload options ... ]
echo.
goto done

:found_file
bindump %file_name% -p " long $" >flash_program.inc
call p2_asm "%TMP_LCCDIR%\target\p2\flshload.t" -o tmp_flash
payload -o2 tmp_flash.bin %2 %3 %4 %5 %6 %7 %8 %9

:done
del /q flash_program.inc 2>nul:
del /q tmp_flash.* 2>nul:
set TMP_LCCDIR=
