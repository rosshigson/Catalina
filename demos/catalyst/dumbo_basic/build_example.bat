@echo off
rem 
rem build a string in TMP_VAR_C consisting of -C %1 -C %2 -C %3 (etc)
rem and in TMP_VAR_D consisting of -D %1 -D %2 -D %3 (etc)
rem and also set TMP_P2 to P2 if we specify NATIVE or a P2 platform
rem
set TMP_VAR_C=
set TMP_VAR_D=
set TMP_P2=

:do_arg
if "%1"=="" goto done_args
set TMP_VAR_C=%TMP_VAR_C% -C %1
set TMP_VAR_D=%TMP_VAR_D% -D %1
set TMP_TMP=%1
set TMP_TMP=%TMP_TMP:~0,2%
if "%TMP_TMP%"=="P2" set TMP_P2=P2
if "%1"=="NATIVE" set TMP_P2=P2
shift
goto do_arg
:done_args

set TMP_P2_FLAG=
if NOT "%TMP_P2%"=="P2" goto not_p2
set TMP_VAR_C=%TMP_VAR_C% -C P2
set TMP_VAR_D=%TMP_VAR_D% -D P2
set TMP_P2_FLAG=-p2
:not_p2

rem @echo TMP_VAR_C=%TMP_VAR_C%
rem @echo TMP_VAR_D=%TMP_VAR_D%
rem @echo TMP_P2=%TMP_P2%

spp -l %TMP_VAR_D% example.pasm example.obj
catalina %TMP_P2_FLAG% %TMP_VAR_C% -y dummy.c example.obj

@echo If the compilation was successful, examine dummy.lst
