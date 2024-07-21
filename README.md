Overview
--------

Catalina is an ANSI C compiler, with C libraries and utilities, for the Parallax Propeller family of microcontrollers. 

Catalina supports both internal and external memory models on both the Propeller 1 and 2, for program sizes up to 16Mb.

Catalina runs under Windows, Linux and its own self-hosted development enviroment (Catalyst).

Catalina supports command-line use (Windows, Linux and Catalyst) and an Integrated Development Environment (Windows and Linux).

Catalina supports the Lua scripting language, both stand-alone and embedded.

Catalina supports multi-threaded and multi-model programming. Catalina supports lightweight threads as well as Posix threads and Lua threads.

The main components of Catalina are:

-  **catalina**    : C compiler (Windows, Linux and Catalyst)
-  **catalyst**    : SD card program loader and self-hosted development environment
-  **geany**       : Integrated Development Environment (Windows and Linux)
-  **payload**     : Serial program loader (Windows and Linux)
-  **comms**       : VT100 terminal emulator (Windows only)
-  **blackbox**    : C source level debugger (Windows and Linux)
-  **catapult**    : Utility for building multi-model C programs (Windows and Linux)
-  **parallelize** : Utility for building parallel C programs (Windows and Linux)
-  **spinnaker**   : Propeller 1 Spin compiler and assembler (Windows and Linux)
-  **p2asm**       : Propeller 2 assembler (Windows, Linux and Catalyst)

NOTE: The README.TXT file that used to accompany each Catalina release to summarize the changes is now called CHANGES.TXT.

Setting up Catalina 
-------------------

If you used the Windows installer to install Catalina, the Windows Start Menu should contain at least the following shortcuts:

-   **Catalina Command Line** : Start a Windows command shell (i.e. cmd.exe) in the Catalina directory and set up the LCCDIR environment variable
-   **Catalina Geany** : Start the Geany Integrated Development Environment.
-   **Documents** : Links to the various Catalina documents.

If you cloned the Git repository, or downloaded it as a ZIP file and then uncompressed it, then:

- In Windows : The Github repository includes binaries suitable for Windows 10 or Windows 11. Open a Windows command shell (i.e. cmd.exe), then **cd** to the Catalina installation folder. Then execute the command **use_catalina** to set up the LCCDIR environment variable. Then you can use Catalina from the command line, or use the command **catalina_geany** to start the Catalina Geany Integrated Deveopment Environment. To create Windows Start Menu entries, open a Windows command shell (i.e. cmd.exe) with Administrator privileges, then **cd** to the Catalina installation folder. Then execute the command **catalina_shortcuts**, optionally specifying the name of the Start Menu entry to create (in quotes). For example, **catalina_shortcuts "Catalina 7.6.3"**

- In Linux : You must rebuild Catalina from source. Manually open a Terminal window, then **cd** to the Catalina installation folder. Then follow the instructions in the document **BUILD.TXT** to rebuild Catalina from source. Then you can use Catalina from the command line, or use the command **catalina_geany** to start the Catalina Geany Integrated Deveopment Environment.

See the document "Getting Started with Catalina" in the documents folder for more details.
