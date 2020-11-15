This directory contains different versions of the "Sieve of Eratosthenes",
a classic algorithm for enumerating prime numbers. This program is used here
as a demonstration of parallel processing on the propeller, because the basic
algorithm is easy to understand and also easy to parallelize.

Use the "build_all" script to compile all the programs. In general, you will
need to use a serial HMI interface (suc as TTY), otherwise the programs may
be unable to allocate sufficient space for the sieve. Specify the platform 
as the first parameter, plus any HMI options or memory models. For example:

   build_all C3 TTY
   build_all HYDRA TTY COMPACT
   build_all P2_EVAL NATIVE
   build_all P2_EVAL COMPACT

The different versions of the sieve program in this directory are:

   sieve_original.c        : The "classic" version. Worth studying just to 
                             understand the basic algorithm. This version 
                             can be executed, but it has no frills such as 
                             timing calculations etc.

   sieve_single_threaded.c : A single cog, single-threaded version. The
                             main changes from the original are that the 
                             elimination of multiples of primes has been 
                             converted to a separate function, the sieve 
                             itself has been moved to be a static variable 
                             external to the main function, and messages 
                             and timing calculations have been added. These
                             changes will assist in "parallelizing" the
                             algorithm, which is done in the multi-threading
                             and multi-processing versions.

   sieve_multi_threaded.c  : A single cog, multi-threaded version. This shows
                             how the function to eliminate multiples of primes
                             can easily be converted to a thread, which can be
                             executed in parallel. However, since all the 
                             threads still execute on the same cog, the 
                             context switching overhead means this version 
                             executes slightly slower than the single-threaded
                             version. It is implemented using Catalina 
                             threading primitives.  

   sieve_thread_factory.c  : A multi-threaded, multi-cog version which uses the
                             new Catalina "thread factory" to manage the cogs
                             and allocate worker threads to them. Shows how 
                             using the multi-processing capabilities of the 
                             propeller can be used to implement parallel 
                             algorithms that run significantly faster than a 
                             sequential version. 

   sieve_bitmapped.c       : The "classic" algorithm but with the primes array
                             implemented as a bitmap. This increases the 
                             number of primes that can be processed, but it 
                             is included here as a curiosity only, because it 
                             cannot easily be "parallelized" due to the 
                             non-atomic nature of the bitmap manipulations.


The "build_all" script will build all the versions with a sieve size of 12,000
on the Propeller 1, and 400,000 on the Propeller 2, so that the timings can
be compared. However, if compiling manually, the sieve size can be specified 
on the command line using the -D option. In particlar, the bitmapped version 
of the program can handle much larger sieves:

   catalina sieve_bitmapped.c -lci -O5 -C C3 -C TTY -D SIEVE_SIZE=200000
or
   catalina -p2 sieve_bitmapped.c -lci -O5 -C NATIVE -D SIEVE_SIZE=3600000
 
Here are some actual timings for the various versions, for the Propeller 1 
and the Propeller 2:

On the Propeller 1 (on a C3 using a TTY HMI):

   Version           Clock ticks
   ===============   ===========
   bitmapped          25859200
   single_threaded    22952640
   multi_threaded     45211680
   multi_processing    7557856

On the Propeller 1, the multi-processing version is around 3 times faster 
than the single-threaded version.  

On the Propeller 2 (on a P2_EVAL using NATIVE mode and a TTY HMI):

   Version           Clock ticks
   ===============   ===========
   bitmapped          220284968
   single_threaded    227292729
   multi_threaded     285508385
   multi_processing    61941305

On the Propeller 2, the multi-processing version is around 4 times faster
than the single-threaded version.


