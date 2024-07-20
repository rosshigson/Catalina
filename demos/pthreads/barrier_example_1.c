#include <stdio.h>
#include <pthread.h>

#ifndef STATIC_STACKS
#define STATIC_STACKS 1                // 0 for dynamic stacks, 1 for static
#endif

#define NUM_THREADS  3 
#define BARRIER_SIZE (NUM_THREADS + 1) // the main function is also a thread

#if STATIC_STACKS
#define STACK_SIZE 100                 // longs ensure stacks are long aligned
#endif

pthread_barrier_t barrier;

void *thread(void *param) {
    printf("thread %d waiting\n", (int)param);
    // wait at the barrier until we are allowed to proceed
    pthread_barrier_wait(&barrier);
    printf("thread %d done\n", (int)param);
    return NULL;
}

void main(void) {
    pthread_t      t[NUM_THREADS];
    pthread_attr_t a[NUM_THREADS];
#if STATIC_STACKS
    long           s[NUM_THREADS*STACK_SIZE];
#endif
    int i;

#if STATIC_STACKS
    printf("thread stacks allocated statically\n");
#else
    printf("thread stacks allocated dynamically\n");
#endif

    // initialize the thread attributes with stacks - this prevents 
    // pthread_create from dynamically allocating stack space, which
    // we cannot then re-use
    for (i = 0; i < NUM_THREADS; i++) {
       pthread_attr_init(&a[i]);
#if STATIC_STACKS
       pthread_attr_setstack(&a[i], &s[i*STACK_SIZE], STACK_SIZE*4);
#endif
    }

    // initialize the barrier to synchronize all threads
    pthread_barrier_init(&barrier, NULL, BARRIER_SIZE);

    for (i = 0; i < NUM_THREADS; i++) {
       pthread_create(&t[i], &a[i], thread, (void *)i);
       pthread_sleep(1);
    }

    // by waiting on the barrier ourself, we meet 
    // the criteria to release all waiting threads
    printf("all waiting threads go!\n");
    pthread_barrier_wait(&barrier);

    for (i = 0; i < NUM_THREADS; i++) {
       pthread_join(t[i], NULL);
    }

    printf("all threads finished!\n");

    pthread_sleep(1);
    printf("let's try that again!\n");

    // since the old threads have now terminated, we can
    // create new threads that use the same stack space as the
    // old ones - this is one way to reclaim the thread
    // stack space once a thread terminates - but note that
    // we must be sure that it has terminated, which is what
    // pthread_join assures us.
    for (i = 0; i < NUM_THREADS; i++) {
       pthread_create(&t[i], &a[i], thread, (void *)i);
       pthread_sleep(1);
    }

    // by waiting on the barrier ourself, we meet 
    // the criteria to release all waiting threads
    printf("all waiting threads go!\n");
    pthread_barrier_wait(&barrier);

    for (i = 0; i < NUM_THREADS; i++) {
       pthread_join(t[i], NULL);
    }

    printf("all threads finished!\n");

    pthread_barrier_destroy(&barrier);

    printf("all done\n");
}
