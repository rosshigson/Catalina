/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: raise.c,v 1.4 1994/06/24 11:46:13 ceriel Exp $ */

#if	defined(_POSIX_SOURCE)
#include	<sys/types.h>
#endif
#include	<signal.h>

typedef void (* _t_sig_handler)(int);

static _t_sig_handler _sig_handler[_NSIG] = { SIG_IGN };

int raise(int sig) {
   void (*sig_func)(int);

	if (sig < 0 || sig > _NSIG) {
		return -1;
   }
   sig_func = _sig_handler[sig];
   if (sig_func != SIG_IGN) {
      (*sig_func)(sig);
   }
   if (sig == SIGABRT) {
      // SIGABRT must not return
      exit(-1);
   }
   else {
      return 0;
   }
}

void	(*signal(int _sig, void (*_func)(int)))(int) {
   void (*sig_func)(int);
	if (_sig < 0 || _sig > _NSIG) {
     // _errno = TBD
		return SIG_ERR;
   }
   sig_func = _sig_handler[_sig];
   if (_func == SIG_DFL) {
      _sig_handler[_sig] = SIG_IGN;
   }
   else {
      _sig_handler[_sig] = _func;
   }
   return sig_func;
}
