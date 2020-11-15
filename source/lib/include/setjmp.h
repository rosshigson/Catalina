/*
 * setjmp.h - save/restore calling environment
 *
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: setjmp.h,v 1.8 1994/06/24 11:41:07 ceriel Exp $ */

#if	!defined(_SETJMP_H)
#define	_SETJMP_H

/* In a jmp_buf there is room for:  1 mask (long), 1 flag (long) and 3
 * pointers (stack-pointer, frame pointer and program-counter). 
 * The fields is in the structure have no meaning, they just get the 
 * size right. In particular, the values are not guaranteed to be saved
 * in the position or order implied by the definition.
 */

typedef struct {
	long     __flag;
	long     __mask;
	void *   __pc;
	void *   __sp;
	void *   __fp;
	long     __regs[18]; // r6 .. r23
} jmp_buf[1];

extern int _setjmp(jmp_buf _env, int _savemask);

#define	setjmp(env)	_setjmp(env, 0)

void	longjmp(jmp_buf _env, int _val);

#if defined(_POSIX_SOURCE)

typedef jmp_buf sigjmp_buf;

#define	sigsetjmp(env, savemask)	_setjmp(env, savemask)

int	siglongjmp(sigjmp_buf _env, int _val);

#endif

#endif	/* _SETJMP_H */
