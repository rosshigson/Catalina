#include <stdio.h>
#include <stdlib.h>
#ifndef EXPORT
#define EXPORT
#endif

static char rcsid[] = "$Id: yynull.c 355 2007-02-18 22:08:49Z drh $";

EXPORT void _YYnull(char *file, int line) {
	fprintf(stderr, "null pointer dereferenced:");
	if (file)
		fprintf(stderr, " file %s,", file);
	fprintf(stderr, " line %d\n", line);
	fflush(stderr);
	abort();
}
