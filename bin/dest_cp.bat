@echo off
rem
rem this file is used by the windows makefile for lua
rem
rem the first parameter is the destination DIRECTORY
rem all other parameters are FILES to be copied
rem
set _DEST=%1
SHIFT
:parse
IF "%1"=="" GOTO endparse
IF EXIST %1 COPY /Y %1 %_DEST%
SHIFT
GOTO parse
:endparse
