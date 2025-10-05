#include <stdio.h>
#include <stdlib.h>	/* For free(). */
#include <prop.h>   /* for getrealrand() */
#include <stdarg.h>

int test_vasprintf(char **_s, const char *_format, ...) {

  va_list ap;

  va_start(ap, _format);
	if (vasprintf(_s, _format, ap) < 0) {
		perror("asprintf failed");
    va_end(ap);
		return -1;
	}
  va_end(ap);
  return 0;
}

int test_vsnprintf(char *_s, size_t n, const char *_format, ...) {

  va_list ap;

  va_start(ap, _format);
	if (vsnprintf(_s, n, _format, ap) < 0) {
		perror("asprintf failed");
    va_end(ap);
		return -1;
	}
  va_end(ap);
  return 0;
}

int main(void) {
	char *buf;
  char buf2[64];
	unsigned int random;

	/* test asprintf */
	random = getrealrand();
	if (asprintf(&buf, "Random %zu-bit integer: %#.*x",
	    sizeof(random) * 8, (int)sizeof(random) * 2, random) < 0) {
		perror("asprintf failed");
		return 1;
	}
	(void)puts(buf);
	free(buf);

	/* test vasprintf */
	random = getrealrand();
	if (test_vasprintf(&buf, "Random %zu-bit integer: %#.*x",
	    sizeof(random) * 8, (int)sizeof(random) * 2, random) < 0) {
		perror("vasprintf failed");
		return 1;
	}
	(void)puts(buf);
	free(buf);

	/* test snprintf */
	random = getrealrand();
	if (snprintf(buf2, sizeof(buf2), "Random %zu-bit integer: %#.*x",
	    sizeof(random) * 8, (int)sizeof(random) * 2, random) < 0) {
		perror("snprintf failed");
		return 1;
	}
  printf("%s\n", buf2);

	/* test vsnprintf */
	random = getrealrand();
	if (test_vsnprintf(buf2, sizeof(buf2), "Random %zu-bit integer: %#.*x",
	    sizeof(random) * 8, (int)sizeof(random) * 2, random) < 0) {
		perror("vsnprintf failed");
		return 1;
	}
  printf("%s\n", buf2);
	return 0;
}
