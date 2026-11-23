REAL-TIME CLOCK SUPPORT FOR CATALINA/CATALYST
=============================================

In Catalina 6.3 onwards, the Parallax Real-Time Clock module is supported
on the Propeller 2. Catalina's RTC support consists of two different 
implementations of RTC support:

1. A stand-alone C implementation of RTC/I2C drivers based on the original 
   Spin2 drivers written by Michael Mulholland and Jon "JonnyMac" McPhalen. 
   This provides the ability to read and/or set the RTC clock and various 
   associated parameters.

2. A new version of Catalina's existing software clock plugin that adds 
   the ability to read the RTC clock. While this plugin also accepts setting 
   a new time, this new time is maintained only until the Propeller is reset - 
   the plugin does not actually set the RTC clock (due to space limitations, 
   and also for compatibility with the existing software clock).

This folder contains programs that use both of these implementations.

The build_all script will build the following executables:

   time.bin           <-- a Catalyst time utility
   rtc_ex.bin         <-- a C translation of RTC_Example.spin2
   ex_time.bin        <-- a C program to test the C time and clock functions

The main program is the "time" utility program. It is intended to be used in 
conjunction with Catalyst. It uses the stand-alone RTC/I2C drivers, and can
be used to read or set the RTC time, and also set various RTC parameters.

There is also a C version of the Spin 2 RTC example program called "rtc_ex"
that uses the stand-alone RTC/I2C drivers. 

Finally, there is a version of the existing Catalina "ex_time" demo program, 
which was initially written to use only the software clock plugin, but this
version can also be compiled to use the new RTC version of that plugin. Two 
versions of the program will be buit:

  ex_time1             <-- use the CLOCK plugin, set from the RTC using
                        -- the stand-alone I2C/RTC drivers

  ex_time2             <-- use the RTC plugin

Specify the Propeller 2 platform as the first parameter of the build_all 
script. For example:

   build_all P2_EVAL VT100
or
   build_all P2_EVAL VGA
or
   build_all P2_EDGE OPTIMIZE MHZ_200 VT100 

If you specify RTC on the command line it will also be ignored, because it 
should not be included for the "time" or "rtc_ex" programs, which use the 
stand/alone RTC/I2C drivers, and you cannot use both. The Makefile will 
automatically define the RTC symbol for the "ex_time2" program, which uses 
the RTC plugin.

This means it is ok to specify both a memory model and the RTC option when 
building these programs as part of building Catalyst. But note that the 
programs will only build successfully when a Propeller 2 platform is 
specified as the first parameter to the build_all script.

The configuration of the Real-Time Clock add-on board is done by specifying 
the value of _RTC_BASE in the platform configuration file (e.g. P2_EVAL.inc, 
P2_EDGE.inc or P2_CUSTOM.inc).


