/******************************************************************************
 *                      Timer function test program                           *
 *                                                                            *
 * This program demonstrates the accuracy of the Catalina timer functions.    *
 *                                                                            *
 * Compile this for the Propeller 1 or Propeller 2 with commands like:        *
 *                                                                            *
 * For the Propeller 1 (note that the optimizer is necessary):                *
 *                                                                            *
 *   catalina ex_timers.c -lc -lm -O5 -C CLOCK -C C3                          *
 *                                                                            *
 * or, for the Propeller 2:                                                   *
 *                                                                            *
 *   catalina ex_timers.c -lc -lm -O5 -C CLOCK -p2 -C P2_EVAL                 *
 *                                                                            *
 * Also, try compiling it as a COMPACT, TINY or SMALL or LARGE program (and   *
 * with various cache sizes) to see how this affects the accuracy. Also, try  *
 * linking with the threaded kernel (by adding -lthreads)                     *
 *****************************************************************************/
#include <stdio.h>
#include <propeller.h>

#ifndef __CATALINA_CLOCK
#error THIS PROGRAM REQUIRES THE CLOCK!
#endif

// execute a single millisecond timer and report its accuracy
void single_msecs(unsigned long msecs) {
   register unsigned int start, stop;
   start = _cnt();
   _waitms(msecs);
   stop = _cnt();
   printf("1*%lu msec wait took %lu ticks (%.3f msecs)\n\n", 
       msecs, 
       stop - start,
       (float)(stop - start)/(float)(_clockfreq()/1000)
   );
}

// execute as many millisecond timers of the specified
// time as required to equate to one second, and report
// their accuracy
void multiple_msecs(unsigned long msecs) {
   unsigned long start, stop;
   int i;
   
   if (msecs < min_waitms()) {
      msecs = min_waitms();
   }
   start = _cnt();
   for (i = 0; i < 1000/msecs; i++) {
     _waitms(msecs);
   }
   stop = _cnt();
   printf(
      "%lu*%lu msec waits took %lu ticks (%.3f msecs)\n\n", 
      1000/msecs, 
      msecs, 
      stop - start,
      (float)(stop - start)/(float)(_clockfreq()/1000)
   );
}

// execute a single microsecond timer and report its accuracy
void single_usecs(unsigned long usecs) {
   register unsigned int start, stop;
   start = _cnt();
   _waitus(usecs);
   stop = _cnt();
   printf("1*%lu usec wait took %lu ticks (%.3f msecs)\n\n", 
       usecs, 
       stop - start,
       (float)(stop - start)/(float)(_clockfreq()/1000)
   );
}

// execute as many millisecond timers of the specified
// time as required to equate to one second, and report
// their accuracy
void multiple_usecs(unsigned long usecs) {
   unsigned long start, stop;
   int i;

   if (usecs < min_waitus()) {
      usecs = min_waitus();
   }
   start = _cnt();
   for (i = 0; i < 1000000/usecs; i++) {
     _waitus(usecs);
   }
   stop = _cnt();
   printf(
      "%lu*%lu usec waits took %lu ticks (%.3f msecs)\n\n", 
      1000000/usecs, 
      usecs, 
      stop - start,
      (float)(stop - start)/(float)(_clockfreq()/1000)
   );
}

#ifdef __CATALINA_P2

// execute a single microsecond timer and report its accuracy
void isingle_usecs(unsigned long usecs) {
   register unsigned int start, stop;
   start = _cnt();
   _iwaitus(usecs);
   stop = _cnt();
   printf("1 %lu usec iwait took %lu ticks (%.3f msecs)\n\n", 
       usecs, 
       stop - start,
       (float)(stop - start)/(float)(_clockfreq()/1000)
   );
}

// execute as many microsecond timers of the specified
// time as required to equate to one second, and report
// their accuracy
void imultiple_usecs(unsigned long usecs) {
   unsigned long start, stop;
   int i;

   if (usecs < min_waitus()) {
      usecs = min_waitus();
   }
   start = _cnt();
   for (i = 0; i < 1000000/usecs; i++) {
     _waitus(usecs);
   }
   stop = _cnt();
   printf(
      "%lu*%lu usec iwaits took %lu ticks (%.3f msecs)\n\n", 
      1000000/usecs, 
      usecs, 
      stop - start,
      (float)(stop - start)/(float)(_clockfreq()/1000)
   );
}

// execute a single millisecond timer and report its accuracy
void isingle_msecs(unsigned long msecs) {
   register unsigned int start, stop;
   start = _cnt();
   _iwaitms(msecs);
   stop = _cnt();
   printf("1 %lu msec iwait took %lu ticks (%.3f msecs)\n\n", 
       msecs, 
       stop - start,
       (float)(stop - start)/(float)(_clockfreq()/1000)
   );
}

// execute as many millisecond timers of the specified
// time as required to equate to one second, and report
// their accuracy
void imultiple_msecs(unsigned long msecs) {
   unsigned long start, stop;
   int i;
   
   if (msecs < min_waitms()) {
      msecs = min_waitms();
   }
   start = _cnt();
   for (i = 0; i < 1000/msecs; i++) {
     _iwaitms(msecs);
   }
   stop = _cnt();
   printf(
      "%lu*%lu msec iwaits took %lu ticks (%.3f msecs)\n\n", 
      1000/msecs, 
      msecs, 
      stop - start,
      (float)(stop - start)/(float)(_clockfreq()/1000)
   );
}

#endif

void press_key_to_continue() {
   printf("press a key to continue ...\n"); 
   k_wait(); 
   printf("\n");
}

void main() {
   unsigned long i;
   unsigned long start, stop;
   unsigned long last, current;

#ifdef __CATALINA_libthreads
   // in case we are compiled to use threads in COMPACT mode
   thread_setup();
#endif

   _waitsec(1);

   printf("Timer Tests\n\n");

   printf("Calculated values:\n\n");
   printf("minumum ticks = %lu\n", min_wait());
   printf("minumum usecs = %lu\n", min_waitus());
   printf("minumum msecs = %lu\n",  min_waitms());
   printf("\n");

   // do a simple one second wait ...
   start = _cnt();
   _waitsec(1);
   stop = _cnt();
   printf("one second wait took %lu ticks (%.3f msecs)\n\n", 
       stop - start,
       (float)(stop - start)/(float)(_clockfreq()/1000)
   );

   press_key_to_continue();

   // do single millisecond waits ...
   single_msecs(1000);

   single_msecs(100);

   single_msecs(10);

   single_msecs(1);

   press_key_to_continue();

   // do single microsecond waits ...
   single_usecs(1000000);

   single_usecs(100000);

   single_usecs(10000);

   single_usecs(1000);

   press_key_to_continue();

   // do multiple millisecond waits ...
   multiple_msecs(1000);

   multiple_msecs(100);

   multiple_msecs(10);

   if (min_waitms() <= 1) {
      multiple_msecs(1);
   }

   press_key_to_continue();

   // do multiple microsecond waits ...
   multiple_usecs(1000000);

   multiple_usecs(100000);

   multiple_usecs(10000);

   multiple_usecs(1000);

   if (min_waitus() <= 100) {
      multiple_usecs(100);
   }

   if (min_waitus() <= 10) {
      multiple_usecs(10);
   }

#ifdef __CATALINA_P2

   press_key_to_continue();

   // do single millisecond iwaits ...
   isingle_msecs(1000);

   isingle_msecs(100);

   isingle_msecs(10);

   isingle_msecs(1);

   press_key_to_continue();

   // do single microsecond iwaits ...
   isingle_usecs(1000000);

   isingle_usecs(100000);

   isingle_usecs(10000);

   isingle_usecs(1000);

   press_key_to_continue();

   // do multiple millisecond iwaits ...
   imultiple_msecs(1000);

   imultiple_msecs(100);

   imultiple_msecs(100);

   imultiple_msecs(10);

   if (min_waitms() <= 1) {
      imultiple_msecs(1);
   }

   press_key_to_continue();

   // do multiple microsecond iwaits ...
   imultiple_usecs(1000000);

   imultiple_usecs(100000);

   imultiple_usecs(10000);

   imultiple_usecs(1000);

   if (min_waitus() <= 100) {
      imultiple_usecs(100);
   }

   if (min_waitus() <= 10) {
      imultiple_usecs(10);
   }

#endif

   printf("done!\n");

   while(1);
}
