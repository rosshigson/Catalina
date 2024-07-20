/*************************************************************************\
*                  Copyright (C) Michael Kerrisk, 2022.                   *
*                                                                         *
* This program is free software. You may use, modify, and redistribute it *
* under the terms of the GNU General Public License as published by the   *
* Free Software Foundation, either version 3 or (at your option) any      *
* later version. This program is distributed without any warranty.  See   *
* the file COPYING.gpl-v3 for details.                                    *
\*************************************************************************/

/* pthread_barrier_demo.c

   A demonstration of the use of the pthreads barrier API.

   Usage: pthread_barrier_demo num-barriers num-threads

   The program creates 'num-threads' threads, each of which loop
   'num-threads' times, waiting on the same barrier.

   Modified to be Catalina (ANSI C) compatible by Ross Higson.

*/
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM_THREADS 5
#define NUM_BARRIERS 3

#define errExit(v1) printf("Error: %s\n", v1)
#define errExitEN(v1, v2) printf("Error: Thread %6x: %s\n", v1, v2)
#define errExitEN2(v1, v2, v3) printf("Error: Thread %6x: %s\n", v1, v2, v3)

static pthread_barrier_t barrier;
                                /* Barrier waited on by all threads */

static int numBarriers;         /* Number of times the threads will
                                   pass the barrier */

static void *
threadFunc(void *arg)
{
    long threadNum = (long) arg;
    int j;
    int s;

    printf("Thread %ld started\n", threadNum);

    /* Seed the random number generator based on the current time
       (so that we get different seeds on each run) plus thread
       number (so that each thread gets a unique seed). */

    //srandom(time(NULL) + threadNum);
    srand(threadNum);

    /* Each thread loops, sleeping for a few seconds and then waiting
       on the barrier. The loop terminates when each thread has passed
       the barrier 'numBarriers' times. */

    for (j = 0; j < numBarriers; j++) {

        int nsecs = random() % 5 + 1;   /* Sleep for 1 to 5 seconds */
        pthread_sleep(nsecs);

        /* Calling pthread_barrier_wait() causes each thread to block
           until the call has been made by number of threads specified
           in the pthread_barrier_init() call. */

        printf("Thread %ld about to wait on barrier %d "
                "after sleeping %d seconds\n", threadNum, j, nsecs);
        s = pthread_barrier_wait(&barrier);

        /* After the required number of threads have called
           pthread_barrier_wait(), all of the threads unblock, and
           the barrier is reset to the state it had after the call to
           pthread_barrier_init(). In other words, the barrier can be
           once again used by the threads as a synchronization point.

           On success, pthread_barrier_wait() returns the special value
           PTHREAD_BARRIER_SERIAL_THREAD in exactly one of the waiting
           threads, and 0 in all of the other threads. This permits
           the program to ensure that some action is performed exactly
           once each time a barrier is passed. */

        if (s == 0) {
            printf("Thread %ld passed barrier %d: return value was 0\n",
                    threadNum, j);

        } else if (s == PTHREAD_BARRIER_SERIAL_THREAD) {
            printf("Thread %ld passed barrier %d: return value was "
                    "PTHREAD_BARRIER_SERIAL_THREAD\n", threadNum, j);

            /* In the thread that gets the PTHREAD_BARRIER_SERIAL_THREAD
               return value, we briefly delay, and then print a newline
               character. This should give all of the threads a chance
               to print the message saying they have passed the barrier,
               and then provide a newline that separates those messages
               from subsequent output. (The only purpose of this step
               is to make the program output a little easier to read.) */

            pthread_usleep(100000);
            printf("\n");

        } else {        /* Error */
            errExitEN2(s, "pthread_barrier_wait (%ld)", threadNum);
        }
    }

    /* Print out thread termination message after a briefly delaying,
       so that the other threads have a chance to display the return
       value they received from pthread_barrier_wait(). (This simply
       makes the program output a little easier to read.)*/

    pthread_usleep(200000);
    printf("Thread %ld terminating\n", threadNum);

    return NULL;
}

void
main(int argc, char *argv[])
{
    int numThreads;
    pthread_t *tid;
    int s;
    long threadNum;

    if (argc != 3 || strcmp(argv[1], "--help") == 0) {
        //usageErr("%s num-barriers num-threads\n", argv[0]);
        numBarriers = NUM_BARRIERS;
        numThreads = NUM_THREADS;
    }
    else {
       numBarriers = atoi(argv[1]);
       numThreads = atoi(argv[2]);
    }

    /* Allocate array to hold thread IDs */

    tid = calloc(sizeof(pthread_t), numThreads);
    if (tid == NULL)
        errExit("calloc");

    /* Initialize the barrier. The final argument specifies the
       number of threads that must call pthread_barrier_wait()
       before any thread will unblock from that call. */

    s = pthread_barrier_init(&barrier, NULL, numThreads);
    if (s != 0)
        errExitEN(s, "pthread_barrier_init");

    /* Create 'numThreads' threads */

    for (threadNum = 0; threadNum < numThreads; threadNum++) {
        s = pthread_create(&tid[threadNum], NULL, threadFunc,
                (void *) threadNum);
        if (s != 0)
            errExitEN(s, "pthread_create");
    }

    /* Each thread prints a start-up message. We briefly delay,
       and then print a newline character so that an empty line
       appears after the start-up messages. */

    pthread_usleep(100000);
    printf("\n");

    /* Wait for all of the threads to terminate */

    for (threadNum = 0; threadNum < numThreads; threadNum++) {
        s = pthread_join(tid[threadNum], NULL);
        if (s != 0)
            errExitEN(s, "pthread_join");
    }

    exit(EXIT_SUCCESS);
}
