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

if not exist %1\life mkdir %1\life

@echo on   
copy life\BINSER.LUA %1\life\binser.lua
copy life\CLIENT.LUA %1\life\client.lua
copy life\COMMON.LUA %1\life\common.lua
copy life\ELIFE.LUA %1\life\elife.lua
copy life\NULL.LUA %1\life\null.lua
copy life\README.TXT %1\life\readme.txt
copy life\REBUILD %1\life\rebuild
copy life\REMOTE.LUA %1\life\remote.lua
copy life\SERVER.LUA %1\life\server.lua
@echo off

if exist elua\elua.bin goto p2_copy

@echo on
copy elua\elua.binary %1\bin\elua.bin
copy elua\eluafx.binary %1\bin\eluafx.bin
copy elua\eluas.binary %1\bin\eluas.bin
copy elua\eluasx.binary %1\bin\eluasx.bin
copy elua\eluax.binary %1\bin\eluax.bin
@echo off
goto done

:p2_copy
@echo on
copy elua\elua.bin %1\bin\elua.bin
copy elua\eluafx.bin %1\bin\eluafx.bin
copy elua\eluas.bin %1\bin\eluas.bin
copy elua\eluasx.bin %1\bin\eluasx.bin
copy elua\eluax.bin %1\bin\eluax.bin
@echo off
goto done

:done
