/*
 * In this program, we declare two factories and two workers, but we use 
 * only one cog in each factory, and only one thread for each worker. 
 * This allows us to execute several different parts of the program in
 * parallel, and on different cogs. The main program also continues to 
 * execute on its own cog, but we can stop that if we want to by simply 
 * waiting for all the workers to complete. 
 *
 * Also, note the use of the symbol __PARALLELIZED, which is defined only
 * if this program has been processed by the pragma preprocessor.
 *
 * Note the differences in the output when this program is executed as a
 * parallel program, compared to when it is executed as a serial program.
 *
 */

#pragma propeller factory ping cogs(1)
#pragma propeller factory pong cogs(1)

// a simple sleep function
void sleep(int msec) {
   _waitcnt(_cnt() + msec *(_clockfreq()/1000));
}

// a simple thread-safe print function
void print(char *str) {
   #pragma propeller exclusive
   printf(str);
   #pragma propeller shared
}

void ping(void) {
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
   print("ping ");
   sleep(250);
}

void pong(void) {
   sleep(200);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
   sleep(250);
   print("pong\n");
}

#pragma propeller worker ping(void) threads(1) factory(ping)
#pragma propeller worker pong(void) threads(1) factory(pong)

void main(void) {

    #ifdef __PARALLELIZED
    char *serial_or_parallel = "parallel";
    #else
    char *serial_or_parallel = "serial";
    #endif

    #pragma propeller start ping
    #pragma propeller start pong

    printf("Hello, %s world!\n\n", serial_or_parallel);

    #pragma propeller begin ping
    ping();
    #pragma propeller end ping

    #pragma propeller begin pong
    pong();
    #pragma propeller end pong

    #pragma propeller wait ping
    #pragma propeller wait pong

    printf("\nGoodbye, %s world!\n", serial_or_parallel);

    while(1);  // never terminate
}
