This directory contains no source code. It just contains batch scripts that 
can be used to build demos in the other directories for two multi-cpu
Propeller 1 boards:

   TriBladeProp - this board has three CPUs.

TriBladeProp
============

On the TriBladeProp only CPU #1 has built in HMI devices, but only CPU #2 has 
SD Card support. Both have XMM support, but use different XMM hardware, So 
some programs have to be built to use CPU #1 and others have to be built to 
use CPU #2. On CPU #1 programs can be built to use the built-in HMI devices, 
but for CPU #2 they must use the PC or PROPTERMINAL HMI plugins, or using 
proxy HMI devices. 

Before attempting to build programs for the TriBladeProp, refer to the file
TriBladeProp_README.TXT in the target directory, which contains an explanation
of how to configure the TriBladeProp for use with the demo programs. Then
look at the tutorial section on the TriBladeProp in the document 'Getting
Started with Catalina' This tutorial makes use of the batch or script files 
'build_triblade_demos' and 'build_triblade_proxy_demos' contained in this 
directory, which correctly build programs to run on various CPUs on the 
TriBladeProp.

The batch files provided for the TriBladeProp are:

   build_triblade_demos       - build demo programs for the TriBladeProp

   build_triblade_proxy_demos - build proxy demo programs for the TriBladeProp

   copy_triblade_demos        - copy demos to the SD card specified
                                as the parameter (e.g. D:). Also renames
                                the binaries to suit DOS 8.3 format.

   copy_triblade_proxy_demos  - copy demos to the SD card specified
                                as the parameter (e.g. D:). Also renames
                                the binaries to suit DOS 8.3 format.

See the document Getting Started with Catalina for a tutorial on using these
demo programs.

