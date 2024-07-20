@echo off

if EXIST "%ProgramFiles%"\7-Zip\7z.exe goto check_define
@echo 7 ZIP ARCHIVE MANAGER NOT FOUND - INSTALL IT AND TRY AGAIN!
goto done

:check_define
if "%CATALINA_DEFINE%" == "" goto start

@echo CATALINA_DEFINE MUST NOT BE SET - UNSET IT AND TRY AGAIN!
goto done

:start
@echo building P2_DEMO.ZIP ...

call build_all P2_EVAL SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200
cat catalina\CATALYST.ENV catalina\P2_EVAL.ENV > image\CATALYST.ENV

del /q P2_DEMO.ZIP
cd image
mkdir bin
move /y *.bin bin\
move /y if.lua bin\
move /y exec.lua bin\
move /y freq.lua bin\
move /y find.lua bin\
move /y wild.lua bin\
move /y attrib.lua bin\
"%ProgramFiles%"\7-Zip\7z.exe a ..\P2_DEMO.ZIP *
cd ..

@echo building P2_EVAL.ZIP ...

call build_all P2_EVAL SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 RTC

cd catalina
call build_all P2_EVAL SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200
cat CATALYST.ENV P2_EVAL.ENV > ..\image\CATALYST.ENV
cd ..

cd xvi-2.51
call build_all P2_EVAL SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 LARGE
copy src\xvi.bin ..\image\xl_vi.bin
cd ..

cd lua-5.4.4
call build_all P2_EVAL SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 SMALL
copy src\lua.bin ..\image\xs_lua.bin
copy src\luac.bin ..\image\xs_luac.bin
copy src\luax.bin ..\image\xs_luax.bin
cd ..

cd lua-5.4.4
call build_all P2_EVAL SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 LARGE
copy src\lua.bin ..\image\xl_lua.bin
copy src\luac.bin ..\image\xl_luac.bin
copy src\luax.bin ..\image\xl_luax.bin
cd ..

del /q P2_EVAL.ZIP
cd image
move /y *.bin bin\
move /y if.lua bin\
move /y exec.lua bin\
"%ProgramFiles%"\7-Zip\7z.exe a ..\P2_EVAL.ZIP *
cd ..

@echo building P2_EVAL_VGA.ZIP ...

call build_all P2_EVAL VGA COLOR_4 OPTIMIZE MHZ_200 RTC

cd catalina
call build_all P2_EVAL VGA COLOR_4 OPTIMIZE MHZ_200
cat CATALYST.ENV P2_EVAL_VGA.ENV > ..\image\CATALYST.ENV
cd ..

cd xvi-2.51
call build_all P2_EVAL VGA COLOR_4 OPTIMIZE MHZ_200 LARGE
copy src\xvi.bin ..\image\xl_vi.bin
cd ..

cd lua-5.4.4
call build_all P2_EVAL VGA COLOR_4 OPTIMIZE MHZ_200 SMALL
copy src\lua.bin ..\image\xs_lua.bin
copy src\luac.bin ..\image\xs_luac.bin
copy src\luax.bin ..\image\xs_luax.bin
cd ..

cd lua-5.4.4
call build_all P2_EVAL VGA COLOR_4 OPTIMIZE MHZ_200 LARGE
copy src\lua.bin ..\image\xl_lua.bin
copy src\luac.bin ..\image\xl_luac.bin
copy src\luax.bin ..\image\xl_luax.bin
cd ..

del /q P2_EVAL_VGA.ZIP
cd image
move /y *.bin bin\
move /y if.lua bin\
move /y exec.lua bin\
"%ProgramFiles%"\7-Zip\7z.exe a ..\P2_EVAL_VGA.ZIP *
cd ..

@echo building P2_EDGE.ZIP ...

call build_all P2_EDGE SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 RTC

cd catalina
call build_all P2_EDGE SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200
cat CATALYST.ENV P2_EDGE.ENV > ..\image\CATALYST.ENV
cd ..

cd xvi-2.51
call build_all P2_EDGE SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 LARGE
copy src\xvi.bin ..\image\xl_vi.bin
cd ..

cd lua-5.4.4
call build_all P2_EDGE SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 SMALL
copy src\lua.bin ..\image\xs_lua.bin
copy src\luac.bin ..\image\xs_luac.bin
copy src\luax.bin ..\image\xs_luax.bin
cd ..

cd lua-5.4.4
call build_all P2_EDGE SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 LARGE
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

@echo building P2_EDGE_VGA.ZIP ...

call build_all P2_EDGE VGA COLOR_4 OPTIMIZE MHZ_200 RTC

cd catalina
call build_all P2_EDGE VGA COLOR_4 OPTIMIZE MHZ_200
cat CATALYST.ENV P2_EDGE_VGA.ENV > ..\image\CATALYST.ENV
cd ..

cd xvi-2.51
call build_all P2_EDGE VGA COLOR_4 OPTIMIZE MHZ_200 LARGE
copy src\xvi.bin ..\image\xl_vi.bin
cd ..

cd lua-5.4.4
call build_all P2_EDGE VGA COLOR_4 OPTIMIZE MHZ_200 SMALL
copy src\lua.bin ..\image\xs_lua.bin
copy src\luac.bin ..\image\xs_luac.bin
copy src\luax.bin ..\image\xs_luax.bin
cd ..

cd lua-5.4.4
call build_all P2_EDGE VGA COLOR_4 OPTIMIZE MHZ_200 LARGE
copy src\lua.bin ..\image\xl_lua.bin
copy src\luac.bin ..\image\xl_luac.bin
copy src\luax.bin ..\image\xl_luax.bin
cd ..

del /q P2_EDGE_VGA.ZIP
cd image
move /y *.bin bin\
move /y if.lua bin\
move /y exec.lua bin\
"%ProgramFiles%"\7-Zip\7z.exe a ..\P2_EDGE_VGA.ZIP *
cd ..

:done
@echo Done!
