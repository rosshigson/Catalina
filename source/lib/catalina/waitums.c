#include <stdint.h>

static uint32_t old_freq; // frequency currently in use (initially zero)
static uint32_t cnt_usec; // count of ticks per usec
static uint32_t cnt_msec; // count of ticks per msec
static uint32_t min_tick; // smallest usable number of ticks
static uint32_t min_usec; // smallest usable number of usec
static uint32_t min_msec; // smallest usable number of msec
static uint32_t overhead;

uint32_t _wait(uint32_t ticks);
void _waitus(uint32_t usecs);

// caclulate minimum possible wait time in usecs, recalculating
// if the clock frequency changes. Called automatically when
// a frequency change is detected.
static void recalculate(uint32_t new_freq) {
   register uint32_t start, end;
   // remember new frequency
   old_freq = new_freq;
   // calculate cnt_msec and cnt_usec (and remember them)
   cnt_usec = new_freq/1000000;
   cnt_msec = new_freq/1000;
   // calculate minimum number of ticks we can pass to _wait()
   min_tick = _wait(0);
   // calculate overhead of a call to _waitus() 
#if defined (__CATALINA_SMALL) || defined(__CATALINA_LARGE)
   // if we are an XMM program, there is a good chance we are using 
   // the cache, so get the code into the cache before timing it ...
   _waitus(0);
#endif
   start = _cnt();
   _waitus(0);
   end = _cnt();
#if defined (__CATALINA_SMALL) || defined(__CATALINA_LARGE)
   overhead = end - start - 2*min_tick;
#else
   overhead = end - start - min_tick;
#endif
#if defined (__CATALINA_P2) && defined(__CATALINA_NATIVE)
   // there are too many variants to calculate for every one,
   // and each XMM variant can be affected by code layout,
   // cahce size, XMM memory speed and other factors - so
   // so we use a fudge factor here that seems to work ok
   // in all non-XMM cases, and also seems to be reasonably 
   // well-behaved in XMM cases.
   if (overhead > 100) {
      overhead -= 100;
   }
#endif
   min_usec = (overhead + cnt_usec - 1)/cnt_usec;
   min_msec = (overhead + cnt_msec - 1)/cnt_msec;
}

// return (recalculating if necessary) minium wait time in usecs
uint32_t min_waitus() {
   register uint32_t new_freq  = _clockfreq();
   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   return min_usec;
}

// return (recalculating if necessary) minium wait time in msecs
uint32_t min_waitms() {
   register uint32_t new_freq  = _clockfreq();
   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   return min_msec;
}

// return (recalculating if necessary) minium wait time in ticks
uint32_t min_wait() {
   register uint32_t new_freq  = _clockfreq();
   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   return min_tick;
}

/*
 * _wait - if passed a value of zero, just return ticks taken 
 * (used to calculate overhead) otherwise wait for the specified 
 * number of ticks
 */

#ifndef __CATALINA_P2

/*
 * Propeller 1 version:
 */
uint32_t _wait(uint32_t ticks) {
#if defined (__CATALINA_SMALL) || defined(__CATALINA_LARGE)
   // if we are an XMM program, there is a good chance we are using 
   // the cache, so get the code into the cache before timing it ...
   if (ticks > 0) {
      _wait(0);
   }
#endif   
   return PASM(
      "\n"
      "#ifdef COMPACT\n"
      " word I16B_EXEC\n"
      " alignl\n"
      "#endif\n"
      " cmp _PASM(ticks), #0 wz\n"
      " mov r1, CNT\n"
      " if_nz add r1, _PASM(ticks)\n"
      " if_nz waitcnt r1, #0\n"
      " if_z mov r0, CNT\n"
      " if_z sub r0, r1\n"
      "#ifdef COMPACT\n"
      " jmp #EXEC_STOP\n"
      "#endif\n"
   );
}

#else

/*
 * Propeller 2 version:
 *
 * Note that we use interrupt 2, because the Propeller uses
 * interrupt 3 for multithreading.
 */
uint32_t _wait(uint32_t ticks) {
#if defined (__CATALINA_SMALL) || defined(__CATALINA_LARGE)
   // if we are an XMM program, there is a good chance we are using 
   // the cache, so get the code into the cache before timing it ...
   if (ticks > 0) {
      _wait(0);
   }
#endif   
   return PASM(
      "#ifdef COMPACT\n"
      " word I16B_EXEC\n"
      "   alignl ' align long\n"
      "#endif\n"
      " cmp _PASM(ticks), #0 wz\n"
      " getct  r1\n"
      " if_nz addct2 r1, _PASM(ticks)\n"
      " if_nz waitct2\n"
      " if_z getct r0\n"
      " if_z sub r0, r1\n"
      "#ifdef COMPACT\n"
      " jmp #EXEC_STOP\n"
      "#endif\n"
   );
}

/*
 * Propeller 2 INTERRUPT-SAFE VERSIONS ...
 *
 * Note that we use interrupt 2, because the Propeller uses
 * interrupt 3 for multithreading.
 */

void _iwait(uint32_t delay, uint32_t cnt) {
   PASM(
#if defined(__CATALINA_COMPACT)
      " word I16B_EXEC\n"
      " alignl ' align long\n"
      "   cmp    _PASM(cnt), #0 wz\n"
      " if_z     add PC, #(@_IWAIT_RET-@_IWAIT_0)\n"
      "_IWAIT_0\n"
      "   getct  r0\n"
      "_IWAIT_LOOP\n"
      "   addct2 r0, _PASM(delay)\n"
      "_IWAIT_POLL\n"
      "   pollct2 wc\n"
      " if_nc sub PC,#(@_IWAIT_POLLED-@_IWAIT_POLL)\n"      
      "_IWAIT_POLLED\n"
      "   sub    _PASM(cnt), #1 wz\n"
      "  if_nz sub PC,#(@_IWAIT_RET-@_IWAIT_LOOP)\n"
      "_IWAIT_RET\n"
      " jmp #EXEC_STOP\n"
#elif defined(__CATALINA_NATIVE)
      "   cmp    _PASM(cnt), #0 wz\n"
      " if_z     jmp #_IWAIT_RET\n"
      "   getct  r0\n"
      "_IWAIT_LOOP\n"
      "   addct2 r0, _PASM(delay)\n"
      "_IWAIT_POLL\n"
      "   pollct2 wc\n"
      " if_nc jmp #_IWAIT_POLL\n"
      "   djnz   _PASM(cnt), #_IWAIT_LOOP\n"
      "_IWAIT_RET\n"
#else
      "   cmp    _PASM(cnt), #0 wz\n"
      "   jmp #BR_Z\n"
      "   long @_IWAIT_RET\n"
      "_IWAIT_0\n"
      "   getct  r0\n"
      "_IWAIT_LOOP\n"
      "   addct2 r0, _PASM(delay)\n"
      "_IWAIT_POLL\n"
      "   pollct2 wc\n"
      "   jmp #BRAE\n"
      "   long @_IWAIT_POLL\n"
      "   sub    _PASM(cnt), #1 wz\n"
      "   jmp #BRNZ\n"
      "   long @_IWAIT_LOOP\n"
      "_IWAIT_RET\n"
#endif
   );
}

void _iwaitus(uint32_t usecs) {
   register uint32_t new_freq  = _clockfreq();

   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   _iwait(cnt_usec, (usecs > min_usec) ? usecs - min_usec : min_usec);
}

void _iwaitms(uint32_t msecs) {
   register uint32_t new_freq  = _clockfreq();

   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   _iwait(cnt_msec, (msecs > min_msec) ? msecs - min_msec : min_msec);
}

void _iwaitsec(uint32_t secs) {
   register uint32_t new_freq  = _clockfreq();

   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   _iwait(new_freq, secs);
}

#endif

void _waitus(uint32_t usecs) {
   register uint32_t new_freq  = _clockfreq();
   register int ticks;
   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   ticks = usecs*cnt_usec;
   if (ticks >= overhead) {
      ticks -= overhead;
   }
   while (ticks > new_freq) {
      _wait(new_freq - min_tick);
      ticks -= new_freq;
   }
   if (ticks > min_tick) {
      _wait(ticks);
      return;
   }
   else if (ticks > 0) {
      _wait(min_tick);
      return;
   }
   // this code looks odd, but it is here to make the case when a zero 
   // value is passed have similar timing to the case when a non-zero 
   // value is passed ... the effect is to just call _wait(0) ...
   if (ticks > min_tick) { 
     _wait(0); 
     return;
   } else { 
     _wait(0); 
     return;
   };
}

void _waitms(uint32_t msecs) {
   register uint32_t new_freq  = _clockfreq();
   register uint32_t ticks;
   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   ticks = msecs*cnt_msec;
   if (ticks >= overhead) {
      ticks -= overhead;
   }
   while (ticks > new_freq) {
      _wait(new_freq - min_tick);
      ticks -= new_freq;
   }
   if (ticks > min_tick) {
      _wait(ticks);
      return;
   }
   else if (ticks > 0) {
      _wait(min_tick);
      return;
   }
}

void _waitsec(uint32_t secs) {
   register uint32_t new_freq  = _clockfreq();
   if (new_freq != old_freq) {
      recalculate(new_freq);
   }
   while (secs > 0) {
      _wait(new_freq - min_tick);
      secs--;
   }
}


