This directory contains example programs to demonstrate running Catalina
programs using a single threaded kernel running on multiple cogs.

To build these programs, use the 'build_all' scripts, specifying the
platform and HMI options. For example:

   build_all C3 TTY
or
   build_all HYBRID
or
   build_all TRIBLADEPROP CPU_2 PC VT100
or
   build_all P2_EVAL

Note that currently Catalina can only support LMM, CMM programs running
on multiple cogs. At most one cog can be running an XMM program at a time. 
This is because on some platforms (such as the HYBRID and HYDRA) the XMM RAM
hardware does not support concurrent access at all. It could be supported on
other platforms, but adding the required locks to prevent XMM RAM contention
from multiple cogs would make the programs execute too slowly to be useful.

However, there are ways around this limitation - see the 'demos\multimodel'
directory for a solution.
