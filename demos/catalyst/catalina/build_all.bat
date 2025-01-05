@echo off

rem We want the commmand line options specified for the Catalina build_all
rem script to be the same as the Catalyst build_all script, so we set any
rem necessary additional options such as model, cache size (e.g. CACHED_8K, 
rem CACHED_16K, CACHED_32K or CACHED_64K) and WRITE_BACK here ...

rem To use the most common options:
set EXTRA_OPTIONS=-C LARGE -C CACHED_64K -C WRITE_BACK -C NO_MOUSE

rem To use the Hub Memory allocation option:
rem set EXTRA_OPTIONS=-C LARGE -C HUB_MALLOC -C CACHED_64K -C WRITE_BACK -C NO_MOUSE

rem To use the XMM cache options:
rem set EXTRA_OPTIONS=-C LARGE -C CACHED_64K -C CACHE_LUT -C CACHE_PINS -C FLOAT_PINS -C WRITE_BACK -C NO_MOUSE

rem
rem save the current LCCDIR
rem
set SAVE_LCCDIR=%LCCDIR%
if NOT "%LCCDIR%"=="" goto got_lccdir
echo LCCDIR not set - cannot continue
goto done

:got_lccdir
rem save value of CATALINA_DEFINE (note we must use a different TMP name!)
set TMP_DEFINE_TOP2=%CATALINA_DEFINE%
echo.
if "%1"=="" goto no_parameters
set TMP_PARAMS=%1 %2 %3 %4 %5 %6 %7 %8 %9
for /f "delims=" %%A in ('echo %TMP_PARAMS%') do call :Trim %%A
if "%CATALINA_DEFINE%" == "" goto parameters_and_no_define
if "%CATALINA_DEFINE%" == "%TMP_PARAMS%" goto use_define
echo ERROR: Command line options conflict with CATALINA_DEFINE
echo.
echo    CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo    Command line options were %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
echo    Either set CATALINA_DEFINE to null using the following command:
echo.
echo       unset CATALINA_DEFINE
echo.
echo    or do not specify any command line parameters
echo.
goto done

:Trim
set TMP_PARAMS=%*
exit /b 0 

:parameters_and_no_define
echo NOTE: All programs will be built with options %1 %2 %3 %4 %5 %6 %7 %8 %9
echo       plus the script EXTRA_OPTIONS (%EXTRA_OPTIONS%).
echo.
echo   If these options conflict, or conflict with other options specified in  
echo   the script or Makefile, the results may be unexpected.
echo.
set CATALINA_DEFINE=%TMP_PARAMS%
goto start

:no_parameters
if "%CATALINA_DEFINE%" == "" goto use_default
:use_define
echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo.
echo   All programs will be built using these options. If these conflict
echo   with options specified in this file, the results may be unexpected.
echo.
goto start

:use_default
echo NOTE: Environment variable CATALINA_DEFINE is not set
echo.
echo   All programs will be built for the default target 
echo.

:start

@echo.
@echo cleaning output directories ...

call clean_all
mkdir lib\p2
mkdir lib\p2\cmm
mkdir lib\p2\lmm
mkdir lib\p2\nmm
mkdir lib\p2\xmm

call set_short_path TMP_LIBPATH "."

@echo.
@echo copying source tree ...

xcopy /s /y "%LCCDIR%"\source\catalina source\catalina\ >NUL: 
xcopy /s /y "%LCCDIR%"\source\p2asm_src source\p2asm_src\ >NUL:
xcopy /s /y "%LCCDIR%"\source\lcc source\lcc\ >NUL:
xcopy /s /y "%LCCDIR%"\source\lib source\lib\ >NUL:
xcopy /s /y "%LCCDIR%"\target\p2 target\p2\ >NUL:
xcopy /y "%LCCDIR%"\source\clean* source\ >NUL:

@echo.
@echo cleaning source tree ...

cd source
rem call clean_all >NUL: 2>&1

@echo.
@echo building library for Catalina ...
rem save CATALINA_DEFINE before building library
set TMP_DEFINE_3=%CATALINA_DEFINE%

if "%1" == "P2_EDGE" goto psram_lib
if "%1" == "P2_EVAL" goto hyper_lib
echo ERROR: Only P2_EDGE with PSRAM or P2_EVAL with HYPER RAM are supported
goto done

:psram_lib
set TMP_PSRAM=psram
cd lib
call build_psram >result.txt 2>&1
cd ..
goto lib_done

:hyper_lib
set TMP_PSRAM=hyper
cd lib
call build_hyper >result.txt 2>&1
cd ..
goto lib_done

:lib_done
rem restore CATALINA_DEFINE after building library
set CATALINA_DEFINE=%TMP_DEFINE_3%

@echo.
@echo building catalina components ...
cd catalina
@echo.
@echo building bcc ...
@echo.
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -l%TMP_PSRAM% -lcx -lmc bcc.c -y
@echo.
@echo building binstats ...
@echo.
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -l%TMP_PSRAM% -lcx -lmc binstats.c -y
@echo.
@echo building binbuild ...
@echo.
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -l%TMP_PSRAM% -lcx -lmc binbuild.c -y
@echo.
@echo building pstrip ...
@echo.
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -l%TMP_PSRAM% -lcx pstrip.c -y
@echo building spinc ...
@echo.
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -l%TMP_PSRAM% -lcx -lmc spinc.c -y
@echo.
cd ..

@echo.
@echo building p2asm ...
@echo.
cd p2asm_src
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -l%TMP_PSRAM% -lcx -lmc -o p2asm symsubs.c strsubs.c p2asm.c -y
cd ..

cd lcc

rem the lburg executable is not required on the Propeller, but
rem it is required on the PC to process .md files
@echo.
@echo building lcc\lburg ...
@echo.

set TMP_LCCDIR=..\..
call set_short_path TMP_LCCDIR "%TMP_LCCDIR%"
set TMP_LCCDIR=%TMP_LCCDIR:\=\\%
make -B lburg -f makefile.cat HOSTFILE=etc\\catalina_win32.c LCCDIR=%TMP_LCCDIR%
build\lburg.exe src\\dagcheck.md build\\dagcheck.c
build\lburg.exe src\\catalina.md build\\catalina.c
build\lburg.exe src\\catalina_p2.md build\\catalina_p2.c
build\lburg.exe src\\catalina_p2_native.md build\\catalina_p2_native.c
build\lburg.exe src\\catalina_large.md build\\catalina_large.c
build\lburg.exe src\\catalina_compact.md build\\catalina_compact.c

@echo.
@echo building lcc\src ...
@echo.
cd src
catalina -p2 -I ..\include %EXTRA_OPTIONS% -S *.c
cd ..

@echo.
@echo building lcc\lib ...
@echo.
cd lib
catalina -p2 -I ..\include %EXTRA_OPTIONS% -S *.c
cd ..

@echo.
@echo building lcc\build ...
@echo.
cd build
catalina -p2 -I ..\..\include %EXTRA_OPTIONS% -S *.c -I..\src

@echo.
@echo building liblcc ...
@echo.
cd lib\lcc
call build_library >NUL:
cd ..\..

@echo.
@echo building librcc ...
@echo.
cd lib\rcc\
call build_library >NUL:
cd ..\..

@echo.
@echo building cpp ...
@echo.
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -o cpp ..\cpp\cpp.c ..\cpp\lex.c ..\cpp\nlist.c ..\cpp\tokens.c ..\cpp\macro.c ..\cpp\eval.c ..\cpp\include.c ..\cpp\hideset.c ..\cpp\getopt.c ..\cpp\unix.c -I..\cpp -l%TMP_PSRAM% -lcx -D__APPLE__ -y

@echo.
@echo building spp ...
@echo.
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -o spp ..\cpp\cpp.c ..\cpp\lex.c ..\cpp\nlist.c ..\cpp\tokens.c ..\cpp\macro.c ..\cpp\eval.c ..\cpp\include.c ..\cpp\hideset.c ..\cpp\getopt.c ..\cpp\unix.c -I..\cpp -l%TMP_PSRAM% -lcx -D__APPLE__ -D SPIN_PREPROCESSOR -y

@echo.
@echo building rcc ...
@echo.

rem must remove OPTIMIZE (if present) when compiling rcc - it crashes awka!
SET CATALINA_DEFINE=%CATALINA_DEFINE:OPTIMIZE=%
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include -C NO_KEYBOARD -C CLOCK %EXTRA_OPTIONS% -o rcc -lrcc ..\src\main.c -I..\src -l%TMP_PSRAM% -lcx -y
cd ..\..\..

@echo.
@echo copying catalina to image ...
@echo.
call copy_all ..\image >NUL: 2>NUL:

rem restore original LCCDIR
set LCCDIR=%SAVE_LCCDIR%

:done
rem restore value of CATALINA_DEFINE (note we used a different TMP name!)
set CATALINA_DEFINE=%TMP_DEFINE_TOP2%
echo.
echo ====
echo Done
echo ====
echo.

