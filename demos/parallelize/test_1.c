/*
 * This program defines one worker, which prints a simple test message. 
 * We then execute 10 of those in a "for" loop. When this program is 
 * "parallelized", we will execute all 10 instances of the worker 
 * in parallel with the main program. 
 *
 * Note what this does to the output when we execute this program as a
 * parallel program, compared to when we execute it as a serial program!
 */

#pragma propeller worker(void)

void main() {
    int i;

    printf("Hello, world!\n\n");

    for (i = 1; i <= 10; i++) {

       #pragma propeller begin
       printf("a simple test ");
       #pragma propeller end

    }

    printf("\n\nGoodbye, world!\n");

    while(1);  // never terminate
}
