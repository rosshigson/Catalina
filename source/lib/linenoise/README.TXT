This version of 'linenoise' has had minimal changes to make it suitable
for use with Catalina. It is used in both Catalyst and Lua, mainly to add 
better line editing and command history.

The changes are mostly enabled by detecting if __CATALINA__ is defined, except
in trivial cases (e.g. something was missing, or was needlessly platform 
dependent, or the existing code was not ANSI compliant).

Or see linenoise.c.original for the original version.
