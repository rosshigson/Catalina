@echo off
rem
rem this file is used by the windows makefile for lcc
rem
:parse
IF "%1"=="" GOTO endparse
IF EXIST %1 DEL /Q %1
SHIFT
GOTO parse
:endparse
