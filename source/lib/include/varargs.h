/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: varargs.h,v 1.2 1994/06/24 11:41:35 ceriel Exp $ */

typedef char *va_list;
# define __va_sz(mode)	(((sizeof(mode) + sizeof(int) - 1) / sizeof(int)) * sizeof(int))
# define va_dcl int va_alist;
# define va_start(list) (list = (char *) &va_alist)
# define va_end(list)
# define va_arg(list,mode) (*((mode *)((list += __va_sz(mode)) - __va_sz(mode))))
