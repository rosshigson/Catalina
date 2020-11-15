@echo off
@echo.
if "%1"=="" goto no_parameters
if "%CATALINA_DEFINE%" == "" goto parameters_and_no_define
if "%CATALINA_DEFINE%" == "%1 %2 %3 %4 %5 %6 %7 %8 %9" goto use_define
@echo ERROR: Command line options conflict with CATALINA_DEFINE
@echo.
@echo    The Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
@echo    The Command line options specified are %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo.
@echo    Either set CATALINA_DEFINE to null using the following command:
@echo.
@echo       unset CATALINA_DEFINE
@echo.
@echo    or do not specify any command line parameters
@echo.
goto done
:parameters_and_no_define
@echo NOTE: Environment variable CATALINA_DEFINE will be set to %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo.
@echo All programs will be built using these options. If these options conflict
@echo with any options specified in this file, the results may be unexpected.
set CATALINA_DEFINE=%1 %2 %3 %4 %5 %6 %7 %8 %9
goto start
:no_parameters
if "%CATALINA_DEFINE%" == "" goto use_default
:use_define
@echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
@echo.
@echo All programs will be built using these options. If these options conflict
@echo with any options specified in this file, the results may be unexpected.
goto start
:use_default
@echo NOTE: Environment variable CATALINA_DEFINE is not set
@echo.
@echo All programs will be built for the default target (CUSTOM) 
:start

set platform=%1
if "%platform:~0,2%"=="P2" goto build_p2

:build_lmm
@echo.
echo.
echo    =================
echo    BUILDING P1 DEMOS
echo    =================
echo.
@echo off
rem
rem Demo 1 : Run "Hello World" at a fixed address
rem =============================================
rem
rem Compile the primary program to run the subsidiary programs
rem at a fixed Hub Address (0x4000).
rem 
rem Compile CMM, LMM, XMM SMALL and XMM LARGE versions of this program.
rem
@echo on
catalina hello_world.c -lci -R 0x4000 -C NO_ARGS
spinc -B2 -n LMM -c -l hello_world.binary >hello_world_lmm.inc
catalina hello_world.c -lci -R 0x4000 -C NO_ARGS -C COMPACT
spinc -B2 -n CMM -c -l hello_world.binary >hello_world_cmm.inc
catalina run_hello_world.c -lci -o hello_lmm
catalina run_hello_world.c -lci -C COMPACT -o hello_cmm
catalina run_hello_world.c -lci -C SMALL -C CACHED_1K -o hello_small
catalina run_hello_world.c -lci -C LARGE -C CACHED_1K -o hello_large
@echo off
rem
rem Demo 2 : Run "Hello World" at a reserved address
rem ================================================
rem
rem Compile a primary program that runs the subsidiary programs in
rem an area of Hub RAM reserved in the main function.
rem
rem Only compile an LMM version of the primary program.
rem
rem Edit the -R values if instructed to do so by the program.
rem
@echo on
catalina hello_world.c -lci -R 0x7BAC -M64k -C NO_ARGS 
spinc -B2 -n LMM -c -l hello_world.binary >hello_world_lmm.inc
catalina hello_world.c -lci -R 0x7BAC -M64k -C NO_ARGS -C COMPACT
spinc -B2 -n CMM -c -l hello_world.binary >hello_world_cmm.inc
catalina run_reserved.c -o hello_reserved -lci
@echo off
rem
rem Demo 3 : Run two subsidiary programs at different reserved addresses
rem ====================================================================
rem
rem Compile a primary program that runs two subsidiary programs in
rem areas of Hub RAM reserved in the main function.
rem
rem We compile CMM, LMM, XMM SMALL & XNM LARGE versions of the primary program.
rem
rem Edit the -R values if instructed to do so by the primary program.
rem
@echo on
catalina subsidiary_1.c -lc -lmb -R 0x71DC -M64k -C NO_ARGS -C COMPACT
spinc -B2 -n SUB1 -s 200 -c -l subsidiary_1.binary >subsidiary_1.inc
catalina subsidiary_2.c -lc -lmb -R 0x5C44 -M64k -C NO_ARGS 
spinc -B2 -n SUB2 -s 200 -c -l subsidiary_2.binary >subsidiary_2.inc
catalina primary.c -lc -lmb -o primary_lmm
catalina primary.c -lc -lmb -C COMPACT -o primary_cmm
rem
catalina subsidiary_1.c -lc -lmb -R 0x68A0 -M64k -C NO_ARGS -C COMPACT
spinc -B2 -n SUB1 -s 200 -c -l subsidiary_1.binary >subsidiary_1.inc
catalina subsidiary_2.c -lc -lmb -R 0x5308 -M64k -C NO_ARGS 
spinc -B2 -n SUB2 -s 200 -c -l subsidiary_2.binary >subsidiary_2.inc
catalina primary.c -lc -lmb -C SMALL -C CACHED_1K -o primary_small
catalina primary.c -lc -lmb -C LARGE -C CACHED_1K -o primary_large
@echo off
rem
rem Demo 4 : Run "Dining Philosophers" at a fixed address
rem =====================================================
rem
rem Compile the primary program to run the subsidiary programs
rem at a fixed Hub Address (0x3000).
rem 
rem Compile only an XMM LARGE version of the primary program.
rem
@echo on
catalina dining_philosophers.c -lci -lthreads -R 0x3000 -C NO_ARGS
spinc -B2 -n LMM -s 8000 -c -f _threaded_cogstart_LMM_cog -l dining_philosophers.binary >dining_philosophers_lmm.inc
catalina dining_philosophers.c -lci -lthreads -R 0x3000 -C NO_ARGS -C COMPACT
spinc -B2 -n CMM -s 8000 -c -l dining_philosophers.binary >dining_philosophers_cmm.inc
catalina run_dining_philosophers.c -lci -C LARGE -C CACHED_1K -o run_diners_xmm
@echo off

rem
rem Demo 5 : Run "Dining Philosophers" from an overlay file
rem =======================================================
rem
rem Compile the primary program to run the subsidiary programs
rem from an overlay file at a fixed Hub Address (0x3000).
rem 
rem Compile only an XMM LARGE version of the primary program.
rem
@echo on
catalina dining_philosophers.c -lci -lthreads -R 0x3000 -C NO_ARGS
spinc -B2 -n LMM -s 8000 -c -l dining_philosophers.binary -o diners.lmm >dining_philosophers_lmm.inc
catalina dining_philosophers.c -lci -lthreads -R 0x3000 -C NO_ARGS -C COMPACT
spinc -B2 -n CMM -s 8000 -c -l dining_philosophers.binary -o diners.cmm >dining_philosophers_cmm.inc
catalina run_dining_philosophers.c -lcix -C LARGE -C CACHED_1K -o run_xmm
@echo off

goto done

:build_p2
@echo off
echo.
echo    =================
echo    BUILDING P2 DEMOS
echo    =================
echo.
@echo off
rem
rem Demo 1 : Run "Hello World" at a fixed address
rem =============================================
rem
rem Compile the primary program to run the subsidiary programs
rem at a fixed Hub Address (0x40000).
rem 
rem Compile CMM, LMM and NMM versions of the primary program.
rem
@echo on
catalina -p2 hello_world.c -lci -R 0x40000 -C NO_ARGS
spinc -p2 -B2 -n LMM -c -l hello_world.bin >hello_world_lmm.inc
catalina -p2 hello_world.c -lci -R 0x40000 -C NO_ARGS -C COMPACT
spinc -p2 -B2 -n CMM -c -l hello_world.bin >hello_world_cmm.inc
catalina -p2 hello_world.c -lci -R 0x40000 -C NO_ARGS -C NATIVE
spinc -p2 -B2 -n NMM -c -l hello_world.bin >hello_world_nmm.inc
catalina -p2 run_hello_world.c -lci -o hello_lmm
catalina -p2 run_hello_world.c -lci -C COMPACT -o hello_cmm
catalina -p2 run_hello_world.c -lci -C NATIVE -o hello_nmm
@echo off
rem
rem Demo 2 : Run "Hello World" at a reserved address
rem ================================================
rem
rem Compile a primary program that runs the subsidiary programs in
rem an area of Hub RAM reserved in the main function.
rem
rem Only compile a Native (NMM) version of the primary program.
rem
rem Edit the -R values if instructed to do so by the program.
rem
@echo on
catalina -p2 hello_world.c -lci -R 0x7BB5C -C NO_ARGS 
spinc -p2 -B2 -n LMM -c -l hello_world.bin >hello_world_lmm.inc
catalina -p2 hello_world.c -lci -R 0x7BB5C -C NO_ARGS -C COMPACT
spinc -p2 -B2 -n CMM -c -l hello_world.bin >hello_world_cmm.inc
catalina -p2 run_reserved.c -o hello_reserved -lci -C NATIVE 
@echo off
rem
rem Demo 3 : Run two subsidiary programs at different reserved addresses
rem ====================================================================
rem
rem Compile a primary program that runs two subsidiary programs in
rem areas of Hub RAM reserved in the main function.
rem
rem We compile CMM, LMM and NMM versions of the primary program.
rem
rem Edit the -R values if instructed to do so by the primary program.
rem
@echo on
catalina -p2 subsidiary_1.c -lc -lmb -R 0x78184 -C NO_ARGS -C COMPACT
spinc -p2 -B2 -n SUB1 -s 200 -c -l subsidiary_1.bin >subsidiary_1.inc
catalina -p2 subsidiary_2.c -lc -lmb -R 0x73BD8 -C NO_ARGS 
spinc -p2 -B2 -n SUB2 -s 200 -c -l subsidiary_2.bin >subsidiary_2.inc
catalina -p2 primary.c -lc -lmb -C COMPACT -o primary_cmm
rem
catalina -p2 subsidiary_1.c -lc -lmb -R 0x7818C -C NO_ARGS -C COMPACT
spinc -p2 -B2 -n SUB1 -s 200 -c -l subsidiary_1.bin >subsidiary_1.inc
catalina -p2 subsidiary_2.c -lc -lmb -R 0x73BE0 -C NO_ARGS 
spinc -p2 -B2 -n SUB2 -s 200 -c -l subsidiary_2.bin >subsidiary_2.inc
catalina -p2 primary.c -lc -lmb -o primary_lmm
catalina -p2 primary.c -lc -lmb -C NATIVE -o primary_nmm
@echo off
rem
rem Demo 4 : Run "Dining Philosophers" at a fixed address
rem =====================================================
rem
rem Compile the primary program to run the subsidiary programs
rem at a fixed Hub Address (0x40000).
rem 
rem Compile CMM, LMM and NMM versions of the primary program.
rem
@echo on
catalina -p2 dining_philosophers.c -lci -lthreads -R 0x40000 -C NO_ARGS
spinc -p2 -B2 -n LMM -s 8000 -f _threaded_cogstart_LMM_cog -c -l dining_philosophers.bin >dining_philosophers_lmm.inc
catalina -p2 dining_philosophers.c -lci -lthreads -R 0x40000 -C NO_ARGS -C COMPACT
spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_cmm.inc
catalina -p2 dining_philosophers.c -lci -lthreads -R 0x40000 -C NO_ARGS -C NATIVE
spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_nmm.inc
catalina -p2 run_dining_philosophers.c -lci -o run_diners_lmm
catalina -p2 run_dining_philosophers.c -lci -C COMPACT -o run_diners_cmm
catalina -p2 run_dining_philosophers.c -lci -C NATIVE -o run_diners_nmm
@echo off

rem
rem Demo 5 : Run "Dining Philosophers" from an overlay file
rem =======================================================
rem
rem Compile the primary program to run the subsidiary programs
rem from an overlay file at a fixed Hub Address (0x40000).
rem 
rem Compile CMM, LMM and NMM versions of the primary program.
rem
@echo on
catalina -p2 dining_philosophers.c -lci -lthreads -R 0x40000 -C NO_ARGS
spinc -p2 -B2 -n LMM -s 8000 -c -l dining_philosophers.bin -o diners.lmm >dining_philosophers_lmm.inc
catalina -p2 dining_philosophers.c -lci -lthreads -R 0x40000 -C NO_ARGS -C COMPACT
spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin -o diners.cmm >dining_philosophers_cmm.inc
catalina -p2 dining_philosophers.c -lci -lthreads -R 0x40000 -C NO_ARGS -C NATIVE
spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin -o diners.nmm >dining_philosophers_nmm.inc
catalina -p2 run_dining_philosophers.c -lcix -o run_lmm
catalina -p2 run_dining_philosophers.c -lcix -o run_cmm -C COMPACT 
catalina -p2 run_dining_philosophers.c -lcix -o run_nmm -C NATIVE
@echo off

goto done

:done
@echo off
set TMP_LCCDIR=
call unset CATALINA_DEFINE

echo.
echo  ====
echo  Done
echo  ====
echo.


