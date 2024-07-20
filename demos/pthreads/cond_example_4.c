#include <pthread.h>
#include <stdio.h>

#define NUM_CARS 10
#define NUM_TANKERS 4

pthread_mutex_t mutexFuel;
pthread_cond_t condFuel;
int fuel = 0;

void* tanker(void* arg) {
    int i;
    for (i = 0; i < 5; i++) {
        pthread_mutex_lock(&mutexFuel);
        fuel += 30;
        pthread_printf("Tanker %d arrived. Station now has %d\n", (int)arg, fuel);
        pthread_mutex_unlock(&mutexFuel);
        pthread_cond_broadcast(&condFuel);
    }
    return NULL;
}

void* car(void* arg) {
    pthread_mutex_lock(&mutexFuel);
    while (fuel < 40) {
        pthread_printf("Station does not have enough fuel. Car %d waiting.\n", 
                       (int)arg);
        pthread_cond_wait(&condFuel, &mutexFuel);
    }
    fuel -= 40;
    pthread_printf("Car %d got fuel. Station now has %d\n", (int)arg, fuel);
    pthread_mutex_unlock(&mutexFuel);
    return NULL;
}

int main(int argc, char* argv[]) {
    pthread_t th[NUM_CARS + NUM_TANKERS];
    int i;
    pthread_mutex_init(&mutexFuel, NULL);
    pthread_cond_init(&condFuel, NULL);
    for (i = 0; i < NUM_CARS + NUM_TANKERS; i++) {
        if (i > NUM_CARS) {
            if (pthread_create(&th[i], NULL, &tanker, (void *)(i-NUM_CARS)) != 0) {
                pthread_printf("Failed to create tanker thread");
            }
        } else {
            if (pthread_create(&th[i], NULL, &car, (void *)i) != 0) {
                pthread_printf("Failed to create car thread");
            }
        }
    }

    for (i = 0; i < NUM_CARS + NUM_TANKERS; i++) {
        if (pthread_join(th[i], NULL) != 0) {
            pthread_printf("Failed to join thread");
        }
    }
    pthread_printf("All Done\n");
    pthread_mutex_destroy(&mutexFuel);
    pthread_cond_destroy(&condFuel);
    return 0;
}
