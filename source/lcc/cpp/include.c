#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "cpp.h"

Includelist	includelist[NINCLUDE];

extern char	*objname;
/* RJH added from here ... */
extern void replace(char *src, char *dst, int from, int to);

/* replace - copy str, replacing occurrences of from with to */
void replace(char *src, char *dst, int from, int to) {
	int len = strlen(src);
        int j;
        for (j = 0; j < len; j++)
              dst[j]=(src[j]==from?to:src[j]);
	dst[len]='\0';
}

/* ... to here */

void
doinclude(Tokenrow *trp, int next)
{
	char fname[256], iname[256];
/* RJH added from here ... */
	char wname[256];
	static int last=0;
/* ... to here */
	Includelist *ip;
	int angled, len, i;
	FILE *fd;

	trp->tp += 1;
	if (trp->tp>=trp->lp)
		goto syntax;
	if (trp->tp->type!=STRING && trp->tp->type!=LT) {
		len = trp->tp - trp->bp;
		expandrow(trp, "<include>");
		trp->tp = trp->bp+len;
	}
	if (trp->tp->type==STRING) {
		len = trp->tp->len-2;
		if (len > sizeof(fname) - 1)
			len = sizeof(fname) - 1;
		strncpy(fname, (char*)trp->tp->t+1, len);
		angled = 0;
	} else if (trp->tp->type==LT) {
		len = 0;
		trp->tp++;
		while (trp->tp->type!=GT) {
			if (trp->tp>trp->lp || len+trp->tp->len+2 >= sizeof(fname))
				goto syntax;
			strncpy(fname+len, (char*)trp->tp->t, trp->tp->len);
			len += trp->tp->len;
			trp->tp++;
		}
		angled = 1;
	} else
		goto syntax;
	trp->tp += 2;
	if (trp->tp < trp->lp || len==0)
		goto syntax;
	fname[len] = '\0';
	if (fname[0]=='/') {
		fd = fopen(fname, "r");
		strcpy(iname, fname);
/* RJH added from here ... */
        } else if (fname[0]=='\\') {
                fd = fopen(fname, "r");
                strcpy(iname, fname);
/* ... to here */
	} else for (fd = NULL,i=NINCLUDE-1; i>=0; i--) {
/* RJH added from here ... */
		if (next > 0) {
			i = --last;
			/* fprintf(stderr,"processing include_next : i = %d\n", i); */
			if (i <= 0) {
				break;
			}
		} else {
			/* fprintf(stderr,"processing include : i = %d\n", i); */
                }
/* ... to here */
		ip = &includelist[i];
		if (ip->file==NULL || ip->deleted || (angled && ip->always==0))
			continue;
		if (strlen(fname)+strlen(ip->file)+2 > sizeof(iname))
			continue;
		strcpy(iname, ip->file);
		strcat(iname, "/");
		strcat(iname, fname);
               	/* fprintf(stderr, "trying (1) %s\n",iname); */
		if ((fd = fopen(iname, "r")) != NULL)
			break;
/* RJH added from here ... */
               	replace(iname,wname,'/','\\');
               	/* fprintf(stderr, "trying (2) %s\n",wname); */
               	if ((fd = fopen(wname, "r")) != NULL)
                       	break;
/* ... to here */
	}
	if ( Mflag>1 || !angled&&Mflag==1 ) {
		fwrite(objname,1,strlen(objname),stdout);
		fwrite(iname,1,strlen(iname),stdout);
		fwrite("\n",1,1,stdout);
	}
	if (fd != NULL) {
/* RJH added from here ... */
		last = i;
		/* fprintf(stderr,"finished processing : last = %d\n", last); */
/* ... to here */
		if (++incdepth > 10)
			error(FATAL, "#include too deeply nested");
		setsource((char*)newstring((uchar*)iname, strlen(iname), 0), fd, NULL);
		genline();
	} else {
		trp->tp = trp->bp+2;
		error(ERROR, "Could not find include file %r", trp);
	}
	return;
syntax:
	error(ERROR, "Syntax error in #include");
	return;
}

/*
 * Generate a line directive for cursource
 */
void
genline(void)
{
	static Token ta = { UNCLASS };
	static Tokenrow tr = { &ta, &ta, &ta+1, 1 };
	uchar *p;

	ta.t = p = (uchar*)outp;
#ifdef SPIN_PREPROCESSOR
	strcpy((char*)p, "'#line ");
	p += sizeof("'#line ")-1;
#else
	strcpy((char*)p, "#line ");
	p += sizeof("#line ")-1;
#endif
	p = (uchar*)outnum((char*)p, cursource->line);
	*p++ = ' '; *p++ = '"';
	strcpy((char*)p, cursource->filename);
	p += strlen((char*)p);
	*p++ = '"'; *p++ = '\n';
	ta.len = (char*)p-outp;
	outp = (char*)p;
	tr.tp = tr.bp;
	puttokens(&tr);
}

void
setobjname(char *f)
{
	int n = strlen(f);
	objname = (char*)domalloc(n+5);
	strcpy(objname,f);
	if(objname[n-2]=='.'){
		strcpy(objname+n-1,"$O: ");
	}else{
		strcpy(objname+n,"$O: ");
	}
}
