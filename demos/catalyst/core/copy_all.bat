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

if exist catalyst.bin goto p2_copy

@echo on   
copy catalyst.binary %1\catalyst.bin
copy mv.binary %1\mv.bin
copy cp.binary %1\cp.bin
copy ls.binary %1\ls.bin
copy rm.binary %1\rm.bin
copy cat.binary %1\cat.bin
copy help.binary %1\help.bin
copy rmdir.binary %1\rmdir.bin
copy mkdir.binary %1\mkdir.bin
@echo off
goto done:

:p2_copy
@echo on   
copy catalyst.bin %1\catalyst.bin
copy catalyst.bin %1\_BOOT_P2.BIX
copy mv.bin %1\mv.bin
copy cp.bin %1\cp.bin
copy ls.bin %1\ls.bin
copy rm.bin %1\rm.bin
copy cat.bin %1\cat.bin
copy help.bin %1\help.bin
copy rmdir.bin %1\rmdir.bin
copy mkdir.bin %1\mkdir.bin
copy set.bin %1\set.bin
copy exec.lua %1\exec.lua
copy if.lua %1\if.lua
copy attrib.lua %1\attrib.lua
copy find.lua %1\find.lua
copy freq.lua %1\freq.lua
copy wild.lua %1\wild.lua
copy _save.lua %1\_save.lua
copy _restore.lua %1\_restore.lua
copy call.lua %1\call.lua
copy echo.lua %1\echo.lua
copy loop %1\loop
@echo off
goto done
   
:done

