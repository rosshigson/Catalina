#include <stdlib.h>

void randomize(void) {
  srand (1);
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
   return getchar();
}

