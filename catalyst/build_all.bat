@echo off
if NOT "%CATALINA_DEFINE%" == "" goto define_error
if NOT "%1"=="" goto have_parameters
@echo.
@echo ERROR: no PLATFORM specified !
@echo.
@echo usage: build_all [SUPERQUAD or RAMPAGE ] PLATFORM [OPTIONS]
@echo.
@echo    where PLATFORM is:
@echo.
@echo              HYDRA, HYBRID, RAMBLADE, RAMBLADE3, DEMO, DRACBLADE, 
@echo              ASC, C3, DEMO, QUICKSTART, FLIP, CUSTOM, 
@echo              TRIBLADEPROP CPU_2 or P2_EVAL (P2 only)
@echo.
@echo          (use the command 'build_morheus' instead to build for MORPHEUS)
@echo.
@echo    and   OPTIONS may include:
@echo.
@echo              options to configure the HMI, such as PC, VT100, TV or VGA,
@echo              or options to configure the program loader, such as
@echo              FLASH, CACHED, CACHED_1K, CACHED_2K, CACHED_4K, CACHED_8K
@echo.
goto done

:have_parameters
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

call catalyst_clean

set platform=%1
if "%platform:~0,2%"=="P2" goto build_p2

echo.
echo  ================================
echo  Building all Catalyst components
echo  ================================
echo.

del /f /q "bin\*"
copy CATALYST.TXT "bin\"

cd core
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

if "%1%" == "SUPERQUAD" goto done

cd xvi-2.47
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

if "%1%" == "C3" goto no_pascal

cd pascal\p5_c
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\..\bin\"
cd ..\..
:no_pascal

if "%1%" == "C3" goto no_jzip

cd jzip
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

:no_jzip

cd dumbo_basic
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

cd sst
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

cd lua-5.1.4
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

goto done

:build_p2
echo.
echo  ================================
echo  Building all Catalyst components
echo  ================================
echo.

del /f /q "bin\*"
copy CATALYST.TXT "bin\"

cd core
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

cd xvi-2.47
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

cd pascal\p5_c
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\..\bin\"
cd ..\..

cd jzip
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

cd dumbo_basic
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

cd sst
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

cd lua-5.1.4
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\bin\"
cd ..

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
