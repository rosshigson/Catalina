#include <cog.h>
#include <threads.h>

/*
 * _thread_wait : pause for a specified number of milliseconds 
 *                (a thread cannot simply use the _waitcnt() function)
 */ 
void _thread_wait(unsigned milliseconds) {

   // NOTE: unlike cogs, threads cannot use a simple waitcnt ...
   // e.g. _waitcnt(_cnt() + milliseconds * (_clockfreq()/1000));
   // ... so we busy wait instead

   unsigned counts_per_sec = _clockfreq();
   unsigned counts_per_ms  = counts_per_sec/1000;
   unsigned start;
   unsigned end;
   unsigned now;
   
   // wait for a maximum of 1 second each iteration  
   while (milliseconds > 0) {
      now = start = _cnt();
      if (milliseconds >= 1000) {
         end = start + counts_per_sec;
         milliseconds -= 1000;
      }
      else {
         end = start + milliseconds * counts_per_ms;
         milliseconds = 0;
      }
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
}

