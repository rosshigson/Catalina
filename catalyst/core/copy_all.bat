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
copy catalyst.binary %1catalyst.bin
copy mv.binary %1mv.bin
copy cp.binary %1cp.bin
copy ls.binary %1ls.bin
copy rm.binary %1rm.bin
copy cat.binary %1cat.bin
copy rmdir.binary %1rmdir.bin
copy mkdir.binary %1mkdir.bin
@echo off
goto done:

:p2_copy
@echo on   
copy catalyst.bin %1catalyst.bin
copy catalyst.bin %1_BOOT_P2.BIX
copy mv.bin %1mv.bin
copy cp.bin %1cp.bin
copy ls.bin %1ls.bin
copy rm.bin %1rm.bin
copy cat.bin %1cat.bin
copy rmdir.bin %1rmdir.bin
copy mkdir.bin %1mkdir.bin
@echo off
goto done
   
:done

