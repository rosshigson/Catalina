@echo off
if EXIST %1 goto do_copy
@echo.
@echo ERROR: invalid destination specified !
@echo.
@echo usage: copy_all X:
@echo.
@echo    where X: is the drive you use to read/write SD cards
@echo.
@echo or:    copy_all dir
@echo.        
@echo    where dir is the directory you want to copy to
@echo.
goto done

:do_copy
@echo on   
copy test\factorial.lua %1fact.lua
copy test\sort.lua %1sort.lua
copy test\fib.lua %1fib.lua
copy test\life.lua %1life.lua
copy test\star.lua %1star.lua
copy test\star-tos.lua %1star-tos.lua
copy test\list.lua %1list.lua
copy test\find.lua %1find.lua
copy test\freq.lua %1freq.lua
copy test\wild.lua %1wild.lua
@echo off

if exist src\luax.bin goto p2_copy

@echo on
copy src\lua.binary %1lua.bin
copy src\luax.binary %1luax.bin
copy src\luac.binary %1luac.bin
@echo off
if NOT exist src\proxy.binary goto done
@echo on
copy src\proxy.binary %1proxy.bin  
@echo off
goto done

:p2_copy
@echo on
copy test\ex1.lua %1ex1.lua
copy test\ex2.lua %1ex2.lua
copy test\ex3.lua %1ex3.lua
copy test\ex4.lua %1ex4.lua
copy test\ex5.lua %1ex5.lua
copy test\ex6.lua %1ex6.lua
copy test\ex7.lua %1ex7.lua
copy test\ex8.lua %1ex8.lua
copy test\ex9.lua %1ex9.lua
copy test\ex10.lua %1ex10.lua
copy test\ex11.lua %1ex11.lua
copy test\ex12.lua %1ex12.lua
copy test\ex13.lua %1ex13.lua
copy src\lua.bin %1lua.bin
copy src\luax.bin %1luax.bin
copy src\luac.bin %1luac.bin
copy src\mlua.bin %1mlua.bin
copy src\mluax.bin %1mluax.bin
@echo off
goto done

:done
