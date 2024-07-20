/*************************************************************************\
*                  Copyright (C) Michael Kerrisk, 2022.                   *
*                                                                         *
* This program is free software. You may use, modify, and redistribute it *
* under the terms of the GNU General Public License as published by the   *
* Free Software Foundation, either version 3 or (at your option) any      *
* later version. This program is distributed without any warranty.  See   *
* the file COPYING.gpl-v3 for details.                                    *
\*************************************************************************/

/* thread_incr_spinlock.c

   This program employs two POSIX threads that increment the same global
   variable, synchronizing their access using a spinlock. As a consequence,
   updates are not lost. Compare with thread_incr.c, thread_incr_mutex.c,
   and thread_incr_rwlock.c

   Modified to be Catalina (ANSI C) compatible by Ross Higson.
*/
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#ifdef __CATALINA_P2
#define NUM_LOOPS 10000
#else
#define NUM_LOOPS 1000
#endif

#define NUM_THREADS 5

#define errExitEN(v1, v2) printf("Error: Thread %6x: %s\n", v1, v2)


static volatile int glob = 0;
static pthread_spinlock_t splock;

/* Loop 'arg' times incrementing 'glob' */
static void *threadFunc(void *arg) {
    int loops = *((int *) arg);
    int loc, s;
    int j;

    for (j = 0; j < loops; j++) {
        s = pthread_spin_lock(&splock);
        if (s != 0)
            errExitEN(s, "pthread_spin_lock");

        loc = glob;
        loc++;
        glob = loc;

        s = pthread_spin_unlock(&splock);
        if (s != 0)
            errExitEN(s, "pthread_spin_unlock");
    }

    return NULL;
}

void main(int argc, char *argv[]) {
    int loops = NUM_LOOPS;
    pthread_t t[NUM_THREADS];
    int i;

    int s = pthread_spin_init(&splock, 0);

    printf("Looping %d threads %d times\n", NUM_THREADS, NUM_LOOPS);

    if (s != 0)
        errExitEN(s, "pthread_spin_init");

    for (i = 0; i < NUM_THREADS; i++) {
       s = pthread_create(&t[i], NULL, threadFunc, &loops);
       if (s != 0)
           errExitEN(s, "pthread_create");
    }

    for (i = 0; i < NUM_THREADS; i++) {
       s = pthread_join(t[i], NULL);
       if (s != 0)
           errExitEN(s, "pthread_join");
    }

    printf("All threads joined, result = %d\n", glob);

    exit(EXIT_SUCCESS);
}
