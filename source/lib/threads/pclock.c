#include <pthread.h>

int clock_getcpuclockid(pid_t pid, clockid_t *clk_id) {
   return CLOCK_REALTIME;
}

int   clock_getres(clockid_t clk_id, struct timespec *res) {
   if (res == NULL) {
      errno = EINVAL;
      return -1;
   }
   if (clk_id == CLOCK_WALLCLOCK) {
      // resolution of the WALLCLOCK is 1 second
      res->tv_sec = 1;
      res->tv_nsec = 0;
   }
   else {
      // all other clocks have a resoltion of 
      // 1000000000/CLOCKS_PERS_SEC nanoseconds
      res->tv_sec = 0;
      res->tv_nsec = 1000000000/CLOCKS_PER_SEC;
   }
   return 0;
}

int   clock_gettime(clockid_t clk_id, struct timespec *tp) {

   if (tp == NULL) {
      errno = EINVAL;
      return -1;
   }
   if (clk_id == CLOCK_WALLCLOCK) {
      time (&tp->tv_sec);
      tp->tv_nsec = 0;
   }
   else {
      time_t now = clock();
      tp->tv_sec  = now/1000;
      tp->tv_nsec = (now%1000)*1000;
   }
   return 0;
}

int   clock_settime(clockid_t clk_id, const struct timespec *tp) {
   if (tp == NULL) {
      errno = EINVAL;
      return -1;
   }
   if (clk_id == CLOCK_WALLCLOCK) {
      rtc_settime(tp->tv_sec);
   }
   else {
      errno = EINVAL; // not settable
      return -1;
   }
   return 0;
}

#define _MILLISECS(ts) ((ts)->tv_sec*1000000 + (ts)->tv_nsec/1000)
#define _NANOSECS_PER_SEC 1000000000

// normalize timespecs - i.e. make sure tv_nsec < _NANOSECS_PER_SEC
void clock_normalize(struct timespec *t) {
   if (t->tv_nsec > _NANOSECS_PER_SEC) {
      t->tv_sec += t->tv_nsec / _NANOSECS_PER_SEC;
      t->tv_nsec = t->tv_nsec % _NANOSECS_PER_SEC; 
   }
}

// compare timespecs - returns -1 if t1 < t2, 0 if t1 == t2, 1 if t1 > t2
// NOTE - both timespecs are assumed to be "normal" by this call
int clock_compare(const struct timespec *t1, const struct timespec *t2) {
   if (t1->tv_sec > t2->tv_sec) {
      return 1;
   }
   else if (t1->tv_sec < t2->tv_sec) {
      return -1;
   }
   else if (t1->tv_nsec > t2->tv_nsec) {
      return 1;
   }
   else if (t1->tv_nsec < t2->tv_nsec) {
      return -1;
   }
   return 0;
}

// subtract timespecs - the time in t2 is subtracted from t1
// NOTE - that t1 is assumed to be later than t2!
void clock_sub(struct timespec *t1, const struct timespec *t2) {
   if (t1->tv_nsec >= t2->tv_nsec) {
      t1->tv_nsec -= t2->tv_nsec;
   }
   else {
      t1->tv_sec--;
      t1->tv_nsec -= _NANOSECS_PER_SEC - t2->tv_nsec;
   }
   t1->tv_sec -= t2->tv_sec;
}

// add timespecs - the time in t2 is added to t1
// NOTE - t1 is normalized by this call
void clock_add(struct timespec *t1, const struct timespec *t2) {
   t1->tv_sec += t2->tv_sec;
   t1->tv_nsec += t2->tv_nsec;
   clock_normalize(t1);
}

int clock_nanosleep(clockid_t clk_id, int flags, 
                    const struct timespec *request,
                    struct timespec *remain) {

   struct timespec now;

   if (request == NULL) {
      errno = EINVAL;
      return -1; 
   }

   if (!clock_gettime(clk_id, &now)) {
      errno = EINVAL;
      return -1;
   } 

   if (flags & TIMER_ABSTIME) {
      // absolute sleep
      if (clock_compare(request, &now) > 0) {
         struct timespec delay = *request;
         clock_sub(&delay, &now);
         pthread_msleep(_MILLISECS(&delay));
      }
   }
   else {
      // relative sleep
      pthread_msleep(_MILLISECS(request));
   }
   return 0;
}

int nanosleep(const struct timespec *request, 
                struct timespec *remain) {
   return clock_nanosleep(CLOCK_REALTIME, 0, request, remain);
}


