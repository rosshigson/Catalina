@echo off
if NOT "%CATALINA_DEFINE%" == "" goto define_error
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo.
echo   ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:found_catalina
make -v > NUL:
if NOT ERRORLEVEL 1 goto start_build
@cls
@echo.
@echo WARNING: "make" utility not found. 
@echo.
@echo    Some of the Catalyst demo programs will NOT be built by this script.
@echo.
@echo    After this script has been run, you can build the remaining Catalyst 
@echo    demo programs from within CodeBlocks. 
@echo.
@echo    See the Catalyst documentation for more details.
@echo.
@pause

:start_build
echo.
echo  ================================
echo  Building all Catalyst components
echo  ================================
echo.

del /f /q "bin\*"
copy CATALYST.TXT "bin\"

cd core
call build_all MORPHEUS CPU_1 PC VT100 %1 %2 %3 %4 %5
call copy_all "..\bin\"
cd ..

cd xvi-2.47
call build_morpheus %1 %2 %3 %4 %5
call copy_all "..\bin\"
cd ..

cd pascal\p5_c
call build_morpheus %1 %2 %3 %4 %5
call copy_all "..\..\bin\"
cd ..\..

cd jzip
call build_morpheus %1 %2 %3 %4 %5
call copy_all "..\bin\"
cd ..

cd dumbo_basic
call build_morpheus %1 %2 %3 %4 %5
call copy_all "..\bin\"
cd ..

cd sst
call build_morpheus %1 %2 %3 %4 %5
call copy_all "..\bin\"
cd ..

cd lua-5.1.4
call build_morpheus %1 %2 %3 %4 %5
call copy_all "..\bin\"
cd ..

if exist "%USERPROFILE%\utilities\build_all.bat" goto user_utilities

rem need to restore TMP_LCCDIR here
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files\Catalina

pushd "%TMP_LCCDIR%\utilities"
call build_all MORPHEUS  %1 %2 %3 %4 %5
popd
rem need to restore TMP_LCCDIR here
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files\Catalina

@echo on
copy "%TMP_LCCDIR%\utilities\CPU_2_Boot_1.binary" "bin\BOOT_2.BIN"
copy "%TMP_LCCDIR%\utilities\CPU_2_Reset_1.binary" "bin\RESET_2.BIN"
copy "%TMP_LCCDIR%\utilities\Generic_SIO_Loader_2.binary" "bin\LOAD_2.BIN"
goto done

:user_utilities
pushd "%USERPROFILE%\utilities"
call build_all MORPHEUS  %1 %2 %3 %4 %5
popd

@echo on
copy "%USERPROFILE%\utilities\CPU_2_Boot_1.binary" "bin\BOOT_2.BIN"
copy "%USERPROFILE%\utilities\CPU_2_Reset_1.binary" "bin\RESET_2.BIN"
copy "%USERPROFILE%\utilities\Generic_SIO_Loader_2.binary" "bin\LOAD_2.BIN"

goto done

:define_error
@echo off
@echo.
@echo ERROR: Environment variable CATALINA_DEFINE is set (to %CATALINA_DEFINE%)
@echo.
@echo You must undefine this environment variable before using this batch
@echo file, and instead specify the target and options on the command line.
@echo.

:done
@echo off
set TMP_LCCDIR=

echo.
echo  ====
echo  Done
echo  ====
echo.

