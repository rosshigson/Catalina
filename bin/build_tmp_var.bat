@echo off
rem 
rem build a string in TMP_VAR consisting of -C %1 -C %2 -C %3 (etc)
rem
set TMP_VAR=
if "%1"=="" goto test_2
set TMP_VAR=%TMP_VAR% -C %1
:test_2
if "%2"=="" goto test_3
set TMP_VAR=%TMP_VAR% -C %2
:test_3
if "%3"=="" goto test_4
set TMP_VAR=%TMP_VAR% -C %3
:test_4
if "%4"=="" goto test_5
set TMP_VAR=%TMP_VAR% -C %4
:test_5
if "%5"=="" goto test_6
set TMP_VAR=%TMP_VAR% -C %5
:test_6
if "%6"=="" goto test_7
set TMP_VAR=%TMP_VAR% -C %6
:test_7
if "%7"=="" goto test_8
set TMP_VAR=%TMP_VAR% -C %7
:test_8
if "%8"=="" goto test_9
set TMP_VAR=%TMP_VAR% -C %8
:test_9
if "%9"=="" goto done
set TMP_VAR=%TMP_VAR% -C %9
:done
rem @echo TMP_VAR=%TMP_VAR%

