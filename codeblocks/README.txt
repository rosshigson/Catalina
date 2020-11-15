Code::Blocks for Catalina
=========================

This directory contains some Code::Blocks project and workspaces that can be
used to build various Catalina and Catalyst demo programs within Code::Blocks. 

It also contains configuration files that allow the Catalina C compiler to be 
manually configured into an existing Code::Blocks installation (these are the
files codeblocks_Win32.zip for Windows, and codeblocks_Linux.tgz for Linux).

If you used the Catalina Windows installer to install Code::Blocks, you do not 
need to manually configure it - you can simply open the file workspace files
and begin compiling Catalina programs!

The following workspaces are provided in this folder (from within Code::Blocks,
open the file with the following name and the '.workspace' extension):

   demos             - some simple programs from the demos folder
                       (should run on all platforms)
   more_demos        - more complex programs from the demos folder
                       (may require SD Card or XMM RAM platforms)
   smm_demos         - demo programs built to use the SDCARD loader
                       (must be loaded from SD Card using Catalyst)
   emm_demos         - demo programs built to use the EEPROM loader 
                       (some programs also use XMM)
   xmm_demos         - demo programs built to use XMM RAM
   proxy_demos       - demo programs that use proxy drivers
                       (these programs require a TriBlade or Morpheus)
   debug_demos       - programs from demos\debug
   graphics_demos    - programs from demos\graphics
   multicog_demos    - programs from demos\multicog
   multithread_demos - programs from demos\multithread
   spinc_demos       - programs from demos\spinc
   catalyst_demos    - programs from the catalyst folder
   vgraphics_demos   - programs from demos\vgraphics
   sound_demos       - programs from demos\sound

For more details on manually installing and using Code::Blocks, see the 
instructions in the "Getting Started with CodeBlocks" document. For more 
details on using CodeBlocks as installed by the Windows installer, see the 
"CodeBlocks QuickStart" guide.

For more details on Code::Blocks, see the documents "Getting Started with 
CodeBlocks" or the "CodeBlocks QuickStart" guide.

