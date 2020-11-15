#ifndef __CTYPE
#define __CTYPE

extern int isalnum(int);
extern int isalpha(int);
extern int iscntrl(int);
extern int isdigit(int);
extern int isgraph(int);
extern int islower(int);
extern int isprint(int);
extern int ispunct(int);
extern int isspace(int);
extern int isupper(int);
extern int isxdigit(int);
extern int tolower(int);
extern int toupper(int);

#ifndef __STRICT_ANSI__
extern int isblank(int);
extern int isascii(int);
extern int toascii(int);
extern int _tolower(int);
extern int _toupper(int);
#endif


#define	___U	01
#define	___L	02
#define	___N	04
#define	___S	010
#define	___P	020
#define	___C	040
#define	___B	0100
#define	___X	0200

/* RJH: replaced _ctype_ with _imp___ctype_ to get compiled under cygwin */

extern const char  _imp___ctype_[];
#define	isalnum(c)	((_imp___ctype_+1)[c]&(___U|___L|___N))
#define	isalpha(c)	((_imp___ctype_+1)[c]&(___U|___L))
#define	iscntrl(c)	((_imp___ctype_+1)[c]&___C)
#define	isdigit(c)	((_imp___ctype_+1)[c]&___N)
#define	isgraph(c)	((_imp___ctype_+1)[c]&(___P|___U|___L|___N))
#define	islower(c)	((_imp___ctype_+1)[c]&___L)
#define	isprint(c)	((_imp___ctype_+1)[c]&(___P|___U|___L|___N|___B))
#define	ispunct(c)	((_imp___ctype_+1)[c]&___P)
#define	isspace(c)	((_imp___ctype_+1)[c]&___S)
#define	isupper(c)	((_imp___ctype_+1)[c]&___U)
#define	isxdigit(c)	((_imp___ctype_+1)[c]&___X)

#endif /* __CTYPE */
