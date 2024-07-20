This program demonstrates a Catalina secondary loader implemented in C. It
is intended to be used in conjunction with the payload serial loader.

It accepts, acknowledges and decodes the packets sent by the payload loader
when loading the second and subsequent files specified on the payload command
line (the first file uses the Parallax protocol, unless the payload -x option 
is specified) but it does nothing with the packets or the data in them.
                                                                          
To see the diagnostic messages generated from this program, you must use a
non-serial HMI option, such as VGA or TV. If you do not have a non-serial 
HMI option, you should instead specify NO_HMI.

There is only one C program in this folder (loader.c). To build the 
programs, use the "build_all" command, specifying the platform for which you 
want to build (P2_EVAL etc) and the HMI option to use.

For example:

   build_all C3 VGA
or
   build_all P2_EDGE NO_HMI

The following programs are built: 

   loader  - the secondary loader.

To test it using payload, use a command like:

   payload loader loader

The first file should be the loader program, but the second file can be any 
file.

Note that if you have both .bin and .binary versions of the loader in the 
directory, you may need to explicitly add -o1 or -o2 to the payload command 
to tell it to load the .bin or the .binary version of the loader program.

