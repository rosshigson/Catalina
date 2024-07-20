@echo off
copy ..\..\..\src\alloc.s
copy ..\..\..\src\bind.s
copy ..\..\..\src\bytecode.s
copy ..\..\..\src\dag.s
copy ..\..\..\src\decl.s
copy ..\..\..\src\enode.s
copy ..\..\..\src\error.s
copy ..\..\..\src\event.s
copy ..\..\..\src\expr.s
copy ..\..\..\src\gen.s
copy ..\..\..\src\getcwd.s
copy ..\..\..\src\init.s
copy ..\..\..\src\inits.s
copy ..\..\..\src\input.s
copy ..\..\..\src\lex.s
copy ..\..\..\src\list.s
rem copy ..\..\..\src\main.s
copy ..\..\..\src\null.s
copy ..\..\..\src\output.s
copy ..\..\..\src\prof.s
copy ..\..\..\src\profio.s
copy ..\..\..\src\simp.s
copy ..\..\..\src\stab.s
copy ..\..\..\src\stmt.s
copy ..\..\..\src\string.s
copy ..\..\..\src\strdup.s
copy ..\..\..\src\sym.s
copy ..\..\..\src\symbolic.s
copy ..\..\..\src\trace.s
copy ..\..\..\src\tree.s
copy ..\..\..\src\types.s

copy ..\..\dagcheck.s
copy ..\..\alpha.s
copy ..\..\mips.s
copy ..\..\sparc.s
copy ..\..\x86linux.s
copy ..\..\x86cygwin.s
copy ..\..\x86.s
copy ..\..\catalina.s
copy ..\..\catalina_p2.s
copy ..\..\catalina_p2_native.s
copy ..\..\catalina_large.s
copy ..\..\catalina_compact.s
catbind *.s -i -e

