@echo off

set TMP_RAM=

if "%1" == "P2_EVAL" goto p2_eval
if "%1" == "P2_EDGE" goto p2_edge
@echo ERROR: ONLY P2_EDGE AND P2_EVAL ARE SUPPORTED
goto done

:p2_eval
set TMP_RAM=HYPER
if "%2" == "PSRAM" set TMP_RAM=ERROR
goto check_ram

:p2_edge
set TMP_RAM=PSRAM
if "%2" == "HYPER" set TMP_RAM=HYPER
goto check_ram

:check_ram
if "%TMP_RAM%" == "HYPER" goto check_zip
if "%TMP_RAM%" == "PSRAM" goto check_zip
@echo ERROR: XMM TYPE NOT SUPPORTED
goto done

:check_zip
if EXIST "%ProgramFiles%"\7-Zip\7z.exe goto check_define
@echo 7 ZIP ARCHIVE MANAGER NOT FOUND - INSTALL IT AND TRY AGAIN!
goto done

:check_define
if "%CATALINA_DEFINE%" == "" goto start

@echo CATALINA_DEFINE MUST NOT BE SET - UNSET IT AND TRY AGAIN!
goto done

:start

call build_p2_serial %*

call build_p2_vga %*

:done

