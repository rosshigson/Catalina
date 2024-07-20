@echo off

if EXIST "%ProgramFiles%"\7-Zip\7z.exe goto check_define
@echo 7 ZIP ARCHIVE MANAGER NOT FOUND - INSTALL IT AND TRY AGAIN!
goto done

:check_define
if "%CATALINA_DEFINE%" == "" goto start

@echo CATALINA_DEFINE MUST NOT BE SET - UNSET IT AND TRY AGAIN!
goto done

:start
@echo building P2_EDGE.ZIP ...

call build_all P2_EDGE TTY VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 RTC

cd catalina
call build_all P2_EDGE TTY VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200
cat CATALYST.ENV P2_EDGE.ENV > ..\image\CATALYST.ENV
cd ..

cd xvi-2.51
call build_all P2_EDGE TTY VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 LARGE
copy src\xvi.bin ..\image\xl_vi.bin
cd ..

cd lua-5.4.4
call build_all P2_EDGE TTY VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 SMALL
copy src\lua.bin ..\image\xs_lua.bin
copy src\luac.bin ..\image\xs_luac.bin
copy src\luax.bin ..\image\xs_luax.bin
cd ..

cd lua-5.4.4
call build_all P2_EDGE TTY VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 LARGE
copy src\lua.bin ..\image\xl_lua.bin
copy src\luac.bin ..\image\xl_luac.bin
copy src\luax.bin ..\image\xl_luax.bin
cd ..

del /q P2_EDGE.ZIP
cd image
move /y *.bin bin\
move /y if.lua bin\
move /y exec.lua bin\
"%ProgramFiles%"\7-Zip\7z.exe a ..\P2_EDGE.ZIP *
cd ..

:done
@echo Done!
