pthreads
========

Catalina now supports Posix threads (pthreads). Details can be found in the
pthreads header file (pthread.h) in the Catalina\include directory. 

On the Propeller 2, pthreads can be used as a realistic alternative to 
Catalina's native threads. While pthreads are also supported on the Propeller
1, pthreads are heavy compared to Catalina's native threads, so the size 
of pthread programs that can be supported is quite restricted. Also, on the
Propeller 1, pthread programs must generally be compiled in COMPACT mode to
fit at all, since threading is not supported when using extended memory. 

Note that pthreads do not add any more functionality than can already be 
achieved using only Catalina's native threads - in fact, pthreads are
implemented USING Catalina's native threads. So on the Propeller 1, 
Catalina's native threads are generally a better solution since they
are smaller than pthreads.

On the Propeller 1, the examples can be compiled in TINY or COMPACT mode, 
and using optimization is also required or the programs may be too large 
to execute.  For example, use the build_all script provided:

   build_all C3 TTY OPTIMIZE
or
   build_all C3 TTY COMPACT OPTIMIZE

On the Propeller 2, the examples can be compiled in any mode, and with or
without optimization. For example:

   build_all P2_EVAL COMPACT SIMPLE
   build_all P2_EVAL NATIVE OPTIMIZE
   build_all P2_EVAL TINY

You can also use the Makefile provided. For example:

   set CATALINA_DEFINE=P2_EVAL SIMPLE OPTIMIZE
   make barrier_example_1
   payload -i barrier_example_1

