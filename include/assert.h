/*
 * assert.h - diagnostics
 *
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: assert.h,v 1.5 1994/06/24 11:40:23 ceriel Exp $ */

void __bad_assertion(const char *_mess);

#undef	assert

#define	__str(x)	# x
#define	__xstr(x)	__str(x)

#if	defined(NDEBUG)
#define	assert(ignore)	((void)0)
#else
#define	assert(expr)	((expr)? (void)0 : \
				__bad_assertion("Assertion \"" #expr \
				    "\" failed, file " __xstr(__FILE__) \
				    ", line " __xstr(__LINE__) "\n"))
#endif	/* NDEBUG */
