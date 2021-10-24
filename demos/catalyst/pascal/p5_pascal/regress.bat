@echo off
rem
rem Regression test
rem
rem Run the compiler through a few typical programs
rem to a "gold" standard file
rem
call testprog hello
call testprog roman
call testprog match
call testprog startrek
call testprog basics
rem
rem Now run the ISO7185pat compliance test
rem
call testprog iso7185pat
rem
rem Run pcom self compile (note this runs on P5 only)
rem
call cpcoms
rem
rem Run pint self compile (note this runs on P5 only)
rem
call cpints