#include "catalina_cog.h"
#include "catalina_threads.h"

/*
 * _thread_wait : pause for a specified number of milliseconds 
 *                (a thread cannot simply use the _waitcnt() function)
 */ 
void _thread_wait(unsigned milliseconds) {

   // NOTE: unlike cogs, threads cannot use a simple waitcnt ...
   //_waitcnt(_cnt() + milliseconds * (_clockfreq()/1000));
   // ... so we busy wait instead

   unsigned counts_per_ms = _clockfreq()/1000;
   unsigned start;
   unsigned end;
   unsigned now;

   if (milliseconds == 0) {
      return;
   }   
   
   now = start = _cnt();
   end = start + milliseconds * counts_per_ms;

   if (end > start) {
      while ((now >= start) && (now < end)) {
         _thread_yield();
         now = _cnt();
      }
   }
   else {
      while ((now >= start) || (now < end)) {
         _thread_yield();
         now = _cnt();
      }
   }

}

