#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "cpp.h"

extern	int getopt(int, char *const *, const char *);
extern	char	*optarg, rcsid[];
extern	int	optind;
int	verbose;
int	Mflag;	/* only print active include files */
char	*objname; /* "src.$O: " */
int	Cplusplus = 1;

void
setup_env(char *name)
{
   char *env;
   int i, j;
   char prefix[] = "__CATALINA_"; /* C prefix for Catalina symbols */
   int len;
   char def[256]; /* allow for identifiers up to 255 characters */
   Tokenrow tr;

   len = strlen(prefix);
   env = getenv(name);
   i = 0;
   /* fprintf(stderr, "<%s> is \"%s\"\n", name, env); */
   if (env != NULL) {
      while (env[i] != '\0') {
#ifndef SPIN_PREPROCESSOR
         /* for C preprocessor, define Catalina symbols with prefix */
         strcpy(def, prefix);
         j = len;
#else
         /* for SPIN preprocessor, define Catalina symbols "as is" */
         j = 0;
#endif
         while ((env[i] != '\0') && (env[i] != ' ')) {
           def[j++] = env[i++];
         }
         def[j] = '\0';
         /* define symbol ... */
         setsource("<environment>", NULL, def);
         maketokenrow(3, &tr);
         gettokens(&tr, 1);
         doadefine(&tr, 'D');
         unsetsource();
         while (env[i] == ' ') {
            i++;
         }
      }
   }
}

void
setup(int argc, char **argv)
{
	int c, i;
	FILE *fd;
	char *fp, *dp;
	Tokenrow tr;
	extern void setup_kwtab(void);

	setup_kwtab();
	while ((c = getopt(argc, argv, "MNOVv+I:D:U:F:lg")) != -1)
		switch (c) {
		case 'N':
			for (i=0; i<NINCLUDE; i++)
				if (includelist[i].always==1)
					includelist[i].deleted = 1;
			break;
		case 'I':
			for (i=NINCLUDE-2; i>=0; i--) {
				if (includelist[i].file==NULL) {
					includelist[i].always = 1;
/* RJH added from here ... */
               /* printf("including file %s\n", optarg); */
               if ((optarg[0] == '"') 
               &&  (strlen(optarg) >= 2) 
               &&  (optarg[strlen(optarg)-1] == '"')) {
                  optarg[strlen(optarg)-1] = '\0';
                  optarg++;
               }
/* ... to here */
	
					includelist[i].file = optarg;
					break;
				}
			}
			if (i<0)
				error(FATAL, "Too many -I directives");
			break;
		case 'D':
		case 'U':
			setsource("<cmdarg>", NULL, optarg);
			maketokenrow(3, &tr);
			gettokens(&tr, 1);
			doadefine(&tr, c);
			unsetsource();
			break;
		case 'M':
			Mflag++;
			break;
		case 'v':
			fprintf(stderr, "%s %s\n", argv[0], rcsid);
			break;
		case 'V':
			verbose++;
			break;
		case '+':
			Cplusplus++;
			break;
		default:
			break;
		}
	dp = ".";
	fp = "<stdin>";
	fd = stdin;
	if (optind<argc) {
		if ((fp = strrchr(argv[optind], '/')) != NULL) {
			int len = fp - argv[optind];
			dp = (char*)newstring((uchar*)argv[optind], len+1, 0);
			dp[len] = '\0';
		}
		fp = (char*)newstring((uchar*)argv[optind], strlen(argv[optind]), 0);
		if ((fd = fopen(fp, "r")) == NULL)
			error(FATAL, "Can't open input file %s", fp);
	}
	if (optind+1<argc) {
		FILE *fdo = freopen(argv[optind+1], "w", stdout);
		if (fdo == NULL)
			error(FATAL, "Can't open output file %s", argv[optind+1]);
	}
	if(Mflag)
		setobjname(fp);
	includelist[NINCLUDE-1].always = 0;
	includelist[NINCLUDE-1].file = dp;
	setsource(fp, fd, NULL);
}


#ifndef __APPLE__
/* memmove is defined here because some vendors don't provide it at
   all and others do a terrible job (like calling malloc) */
void *
memmove(void *dp, const void *sp, size_t n)
{
	unsigned char *cdp, *csp;

	if (n<=0)
		return 0;
	cdp = dp;
	csp = (unsigned char *)sp;
	if (cdp < csp) {
		do {
			*cdp++ = *csp++;
		} while (--n);
	} else {
		cdp += n;
		csp += n;
		do {
			*--cdp = *--csp;
		} while (--n);
	}
	return 0;
}
#endif
