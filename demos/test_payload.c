#include <stdio.h>

/*
 * Use this program to understand the effects of various payload -q options. 
 *
 * For example, try compiling it with:
 *
 *    catalina test_payload.c -lci -C TTY
 * 
 * Then try loading it with:
 *
 *    payload -i test_payload
 *    payload -i test_payload -q1
 *    payload -i test_payload -q2
 *    payload -i test_payload -q3
 *    payload -i test_payload -q4
 *    payload -i test_payload -q5
 *    payload -i test_payload -q6
 *
 */

void main() {
   printf("Windows style (CR/LF) - press key to start");
   fflush(stdout);
   getchar();
   printf("Hello, World 1\r\n"); // Windows style line termination
   printf("Hello, World 2\r\n"); // Windows style line termination
   printf("Hello, World 3\r\n"); // Windows style line termination
   fflush(stdout);
   printf("Unix style (LF only) - press key to start");
   fflush(stdout);
   getchar();
   printf("Hello, World 4\n"); // Windows style line termination
   printf("Hello, World 5\n"); // Windows style line termination
   printf("Hello, World 6\n"); // Windows style line termination
   fflush(stdout);
   printf("Other (CR only) -  press key to start");
   fflush(stdout);
   getchar();
   printf("Hello, World 7\r"); // Windows style line termination
   printf("Hello, World 8\r"); // Windows style line termination
   printf("Hello, World 9\r"); // Windows style line termination
   fflush(stdout);
   printf("Press key to exit");
   fflush(stdout);
   while(1) ; // loop forever
}
