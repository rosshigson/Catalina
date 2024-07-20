#include <stdio.h>
#include <hmi.h>

void randomize(void) {
  srand ((unsigned) _cnt());
}


int max(int a, int b) {
	if (a > b) return a;
	return b;
}

int min(int a, int b) {
	if (a < b) return a;
	return b;
}

int getch(void) {
   fflush(stdout);
   return k_wait();
}

