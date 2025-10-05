@echo off

cd catalina
call clean_all
cd ..\cake
call clean_all
cd ..\catoptimize
call clean_all
cd ..\p2asm_src
call clean_all
cd ..\lcc
call clean_all
cd ..\openspin
call clean_all
cd ..\lib
call clean_all
cd ..

:done

