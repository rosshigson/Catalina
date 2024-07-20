// C program to implement cond(), signal()
// and wait() functions
#include <pthread.h>
#include <stdio.h>
 
// Declaration of thread condition variable
pthread_cond_t cond1 = PTHREAD_COND_INITIALIZER;
 
// declaring mutex
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
 
int done = 1;
 
// Thread function
void* foo(void *arg) {
 
    // acquire a lock
    pthread_mutex_lock(&lock);
    if (done == 1) {
 
        // let's wait on condition variable cond1
        done = 2;
        printf("Waiting on condition variable cond1\n");
        pthread_cond_wait(&cond1, &lock);
    }
    else {
 
        // Let's signal condition variable cond1
        printf("Signaling condition variable cond1\n");
        pthread_cond_signal(&cond1);
    }
 
    // release lock
    pthread_mutex_unlock(&lock);
 
    printf("Returning thread\n");
 
    return NULL;
}
 
// Driver code
int main() {
    pthread_t tid1, tid2;
 
    // Create thread 1
    pthread_create(&tid1, NULL, foo, NULL);
 
    // sleep for 1 sec so that thread 1
    // would get a chance to run first
    pthread_sleep(1);
 
    // Create thread 2
    pthread_create(&tid2, NULL, foo, NULL);
 
    // sleep for 1 sec so that both threads
    // get a chance to run 
    pthread_sleep(1);
 
    // wait for the completion of thread 1
    pthread_join(tid1, NULL);
    printf("Joined thread 1\n");

    // wait for the completion of thread 2
    pthread_join(tid2, NULL);
    printf("Joined thread 2\n");

    printf("All threads joined\n");
    return 0;
}
