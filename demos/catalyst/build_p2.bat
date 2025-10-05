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

@echo.
@echo building %1.ZIP ...
@echo.

call build_all %1 %2 SIMPLE VT100 USE_COLOR OPTIMIZE MHZ_200

rem create the expected directory structure
call mk_cat_dirs image

cd catalina
call build_all  %1 %2 SIMPLE VT100 USE_COLOR OPTIMIZE MHZ_200
cat CATALYST.ENV %1.ENV > ..\image\CATALYST.ENV
cd ..

cd cake
rem NOTE: we cannot use OPTIMIZE with Cake ...
call build_all  %1 %2 SIMPLE VT100 USE_COLOR MHZ_200
copy %LCCDIR%\source\cake\src\catalina\cake.bin ..\image\bin\cake.bin
copy CAKECONF.H ..\image\CAKECONF.H
copy hello_99.c ..\image\hello_99.c
cd ..

cd xvi-2.51
call build_all %1 %2 SIMPLE VT100 USE_COLOR OPTIMIZE MHZ_200 LARGE
copy src\xvi.bin ..\image\bin\xl_vi.bin
cd ..

cd lua-5.4.4
call build_all %1 %2 SIMPLE VT100 USE_COLOR OPTIMIZE MHZ_200 SMALL
copy src\lua.bin ..\image\bin\xs_lua.bin
copy src\luac.bin ..\image\bin\xs_luac.bin
copy src\luax.bin ..\image\bin\xs_luax.bin
cd ..

cd lua-5.4.4
call build_all %1 %2 SIMPLE VT100 USE_COLOR OPTIMIZE MHZ_200 LARGE
copy src\lua.bin ..\image\bin\xl_lua.bin
copy src\luac.bin ..\image\bin\xl_luac.bin
copy src\luax.bin ..\image\bin\xl_luax.bin
cd ..

del /q %1.ZIP
cd image
"%ProgramFiles%"\7-Zip\7z.exe a ..\%1.ZIP *
cd ..

@echo.
@echo building %1_VGA.ZIP ...
@echo.

call build_all %1 %2 VGA COLOR_4 OPTIMIZE MHZ_200 RTC NO_LINENOISE

rem create the expected directory structure
call mk_cat_dirs image

cd catalina
call build_all %1 %2 VGA COLOR_4 OPTIMIZE MHZ_200
cat CATALYST.ENV %1_VGA.ENV > ..\image\CATALYST.ENV
cd ..

cd cake
rem NOTE: we cannot use OPTIMIZE with Cake ...
call build_all  %1 %2 SIMPLE VT100 USE_COLOR MHZ_200
copy %LCCDIR%\source\cake\src\catalina\cake.bin ..\image\bin\cake.bin
copy CAKECONF.H ..\image\CAKECONF.H
copy hello_99.c ..\image\hello_99.c
cd ..

cd xvi-2.51
call build_all  %1 %2 VGA COLOR_4 OPTIMIZE MHZ_200 LARGE
copy src\xvi.bin ..\image\bin\xl_vi.bin
cd ..

cd lua-5.4.4
call build_all  %1 %2 VGA COLOR_4 OPTIMIZE MHZ_200 SMALL
copy src\lua.bin ..\image\bin\xs_lua.bin
copy src\luac.bin ..\image\bin\xs_luac.bin
copy src\luax.bin ..\image\bin\xs_luax.bin
cd ..

cd lua-5.4.4
call build_all  %1 %2 VGA COLOR_4 OPTIMIZE MHZ_200 LARGE
copy src\lua.bin ..\image\bin\xl_lua.bin
copy src\luac.bin ..\image\bin\xl_luac.bin
copy src\luax.bin ..\image\bin\xl_luax.bin
cd ..

del /q %1_VGA.ZIP
cd image
"%ProgramFiles%"\7-Zip\7z.exe a ..\%1_VGA.ZIP *
cd ..

:done

