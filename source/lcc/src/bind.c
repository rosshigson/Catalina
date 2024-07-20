#include "c.h"
#undef yy
#if defined(__CATALINA_P2)
#define yy \
xx(symbolic,       symbolicIR) \
xx(bytecode,       bytecodeIR) \
xx(catalina/catalyst, catalinaIR) \
xx(catalina/linux, catalinaIR) \
xx(catalina/win32, catalinaIR) \
xx(catalina_p2/catalyst, catalina_p2IR) \
xx(catalina_p2/linux, catalina_p2IR) \
xx(catalina_p2/win32, catalina_p2IR) \
xx(catalina_native_p2/catalyst, catalina_native_p2IR) \
xx(catalina_native_p2/linux, catalina_native_p2IR) \
xx(catalina_native_p2/win32, catalina_native_p2IR) \
xx(catalina_large/catalyst, catalina_largeIR) \
xx(catalina_large/linux, catalina_largeIR) \
xx(catalina_large/win32, catalina_largeIR) \
xx(catalina_compact/catalyst, catalina_compactIR) \
xx(catalina_compact/linux, catalina_compactIR) \
xx(catalina_compact/win32, catalina_compactIR) \
xx(null,           nullIR)
#else
#define yy \
xx(alpha/osf,      alphaIR) \
xx(mips/irix,      mipsebIR) \
xx(sparc/sun,      sparcIR) \
xx(sparc/solaris,  solarisIR) \
xx(x86/win32,      x86IR) \
xx(x86/linux,      x86linuxIR) \
xx(x86/cygwin,     x86cygwinIR) \
xx(symbolic/osf,   symbolic64IR) \
xx(symbolic/irix,  symbolicIR) \
xx(symbolic,       symbolicIR) \
xx(bytecode,       bytecodeIR) \
xx(catalina/catalyst, catalinaIR) \
xx(catalina/linux, catalinaIR) \
xx(catalina/win32, catalinaIR) \
xx(catalina_p2/catalyst, catalina_p2IR) \
xx(catalina_p2/linux, catalina_p2IR) \
xx(catalina_p2/win32, catalina_p2IR) \
xx(catalina_native_p2/catalyst, catalina_native_p2IR) \
xx(catalina_native_p2/linux, catalina_native_p2IR) \
xx(catalina_native_p2/win32, catalina_native_p2IR) \
xx(catalina_large/catalyst, catalina_largeIR) \
xx(catalina_large/linux, catalina_largeIR) \
xx(catalina_large/win32, catalina_largeIR) \
xx(catalina_compact/catalyst, catalina_compactIR) \
xx(catalina_compact/linux, catalina_compactIR) \
xx(catalina_compact/win32, catalina_compactIR) \
xx(null,           nullIR)
#endif

#undef xx
#define xx(a,b) extern Interface b;
yy

Binding bindings[] = {
#undef xx
#define xx(a,b) #a, &b,
yy
	NULL, NULL
};
#undef yy
#undef xx
