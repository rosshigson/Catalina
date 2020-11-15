Catalina release 4.6 is a full release. You can install this over an existing
version of Catalina, but it is recommended that you instead uninstall any
previous Catalina release before installing, or install this release to a 
different location. 

If you are installing under Linux, you should execute the following command 
to set your permissions correctly after installing (this command is a script 
in the Catalina bin directory, and may itself need to have its permissions 
manually set to allow execution):

   Set_Linux_Permissions

The following changes have been made since the previous release of Catalina. 
If you have not used a previous release of Catalina, you can ignore the
following list:

RELEASE 4.6

1. The Catalina Parallelizer is now an integral component of Catalina. To
   invoke the parallelizer, use the -Z option in any Catalina command. Note
   that this option is positional - it will enable parallelizing all C source
   files in the command after it appears. You can also use -z (i.e. with a 
   lower case z) to stop parallelizing source files. This means the
   Parallelizer can now easily be used in Code::Blocks or Geany IDEs.

2. Added the demos\parallelize subdirectory, with documents and examples that
   demonstrate the Parallelizer.

3. Added the option of named exclusive code segments to the Parallelizer - all
   segments with the same name will all use the same lock, which means only
   one worker can be in ANY of the exclusive zones that specify that name. The
   name is optional, and _region will be used if no other name is specified.

4. Added more error checking to the Parallelizer, and reformatted the error 
   messages to use the same format as the compiler. Also, the line numbers will
   now generally refer to the input C source file, not the output C source.

5. Added support for other C compilers and thread libraries to the 
   Parallelizer - a complete example is provided in the demos/parallelize
   subdirectory - see the file custom_threads.h in that directory for more 
   details.



