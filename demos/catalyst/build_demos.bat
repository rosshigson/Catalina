@echo off

if "%1" == "" goto check_zip
echo THIS SCRIPT ACCEPTS NO PARAMETERS!
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
@echo building P2_DEMO.ZIP ...

call build_all P2_CUSTOM SIMPLE VT100 USE_COLOR OPTIMIZE MHZ_200
cat catalina\CATALYST.ENV catalina\P2_DEMO.ENV > image\CATALYST.ENV

del /q P2_DEMO.ZIP
cd image
"%ProgramFiles%"\7-Zip\7z.exe a ..\P2_DEMO.ZIP *
cd ..

call build_p2 P2_EVAL HYPER

call build_p2 P2_EDGE PSRAM

:done
@echo Done!
