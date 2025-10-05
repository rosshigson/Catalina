/*
 * stdarg.h - variable arguments
 *
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: stdarg.h,v 1.5 1994/06/24 11:41:14 ceriel Exp $ */

#if	!defined(_STDARG_H)
#define	_STDARG_H

typedef	char	*va_list;

#define __vasz(x)		((sizeof(x)+sizeof(int)-1) & ~(sizeof(int) -1))

#define va_start(ap, parmN)	(ap = (va_list)&parmN + __vasz(parmN))
#define va_copy(dst, src) ((dst) = (src))
#define va_arg(ap, type)	(*((type *)(void *)((ap += __vasz(type)) - __vasz(type))))
#define va_end(ap)

#endif	/* _STDARG_H */
