#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define NUM_THREADS 4

typedef struct Task {
    int a, b;
} Task;

Task taskQueue[256];
int taskCount = 0;

pthread_mutex_t mutexQueue;
pthread_cond_t condQueue;

void executeTask(Task* task) {
    int result;
    pthread_usleep(50000);
    if ((task->a == -1) && (task->b == -1)) {
       // this means terminate our task
       pthread_exit(NULL);
    }
    result = task->a + task->b;
    printf("The sum of %d and %d is %d\n", task->a, task->b, result);
}

void submitTask(Task task) {
    pthread_mutex_lock(&mutexQueue);
    taskQueue[taskCount] = task;
    taskCount++;
    pthread_mutex_unlock(&mutexQueue);
    pthread_cond_signal(&condQueue);
}

// 1 2 3 4 5
// 2 3 4 5

void* startThread(void* args) {
    while (1) {
        Task task;
        int i;

        pthread_mutex_lock(&mutexQueue);
        while (taskCount == 0) {
            pthread_cond_wait(&condQueue, &mutexQueue);
        }

        task = taskQueue[0];
        for (i = 0; i < taskCount - 1; i++) {
            taskQueue[i] = taskQueue[i + 1];
        }
        taskCount--;
        pthread_mutex_unlock(&mutexQueue);
        executeTask(&task);
    }
    return NULL;
}

int main(int argc, char* argv[]) {
    pthread_t th[NUM_THREADS];
    int i;
    pthread_mutex_init(&mutexQueue, NULL);
    pthread_cond_init(&condQueue, NULL);
    for (i = 0; i < NUM_THREADS; i++) {
        if (pthread_create(&th[i], NULL, &startThread, NULL) != 0) {
            perror("Failed to create the thread");
        }
    }

    srand(_cnt());
    for (i = 0; i < NUM_THREADS*10; i++) {
        Task t;
       
        t.a = rand() % 100;
        t.b = rand() % 100;
        submitTask(t);
    }

    for (i = 0; i < NUM_THREADS; i++) {
        Task t;
       
        t.a = -1;
        t.b = -1;
        submitTask(t);
    }

    for (i = 0; i < NUM_THREADS; i++) {
        if (pthread_join(th[i], NULL) != 0) {
            perror("Failed to join the thread");
        }
    }
    printf("Done\n");
    pthread_mutex_destroy(&mutexQueue);
    pthread_cond_destroy(&condQueue);
    return 0;
}
