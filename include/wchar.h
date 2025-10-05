#ifndef _WCHAR_H
#define _WCHAR_H  1

// Catalina does not implement wide characters (yet!)

#ifndef WCHAR_MIN
#define WCHAR_MIN 0x00
#endif

#ifndef WCHAR_MAX
#define WCHAR_MAX 0xff
#endif

#if	!defined(_WCHAR_T)
#define	_WCHAR_T
typedef char	wchar_t;		/* type expanded character set */
#endif	/* _WCHAR_T */

#endif
