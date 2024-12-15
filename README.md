Overview
--------

Catalina is an ANSI C compiler, plus C libraries and various utilities, for the Parallax Propeller family of microcontrollers. 

Catalina supports both internal and external memory models on both the Propeller 1 and 2, for program sizes up to 16Mb.

Catalina runs under Windows, Linux, the Raspberry Pi OS and also its own self-hosted development enviroment (**Catalyst**).

Catalina supports command-line use (Windows, Linux, Pi and Catalyst) and an Integrated Development Environment based on Geany (Windows, Linux and Pi).

Catalina supports the Lua scripting language, both stand-alone and embedded.

Catalina supports multi-threaded, multi-processor and multi-model programming. Catalina supports lightweight threads as well as Posix threads and Lua threads.

The main components of Catalina are:

-  **catalina**    : C compiler (Windows, Linux, Pi and Catalyst)
-  **catalyst**    : SD card based program loader and self-hosted development environment
-  **catalina_geany** : Integrated Development Environment (Windows Linux, and Pi)
-  **payload**     : Serial program loader and simple terminal emulator (Windows, Linux and Pi)
-  **comms**       : Full-featured VT100 terminal emulator (Windows only)
-  **blackbox**    : C source level debugger (Windows Linux, and Pi)
-  **catapult**    : Utility for building multi-model C programs (Windows Linux, and Pi)
-  **parallelize** : Utility for building multi-processor C programs (Windows Linux, and Pi)
-  **spinnaker**   : Propeller 1 Spin compiler and assembler (Windows Linux, and Pi)
-  **p2asm**       : Propeller 2 assembler (Windows Linux, Pi and Catalyst)

Setting up Catalina 
-------------------

Windows using Setup
-------------------
If you used a Windows Installer package (e.g. **Catalina_7.7_Setup.exe**) to install Catalina and accepted the recommended settings, the Windows Start Menu should contain the following shortcuts:

-   **Catalina Command Line** : Start a Windows command shell (i.e. cmd.exe) in the Catalina directory and set up the Catalina environment variables and paths.
-   **Catalina Geany** : Start the Catalina version of the Geany Integrated Development Environment.
-   **Documents** : Contains links to Catalina tutorial and reference documents.

Note that the Windows Installer may offers the option of installing Make and additional GNU utilities. While installing **make** is recommended, this method of doing so is deprecated, and may be removed from future versions of the Windows Installer. See the **Catalina and make** section of this document (below) for details on the recommended way to install **make**.

Windows Manual install
----------------------

If you did not use the Windows Setup package but either cloned the Git repository or downloaded it as a compressed file and then uncompressed it, then the distribution will includes all sources, but not the Windows binaries. 

If you do not want to rebuild Catalina from source (which is a complex process under Windows) then one or more separate packages of precompiled binaries will be available suitable for Windows 10 or Windows 11 as assets associated with the Git release. Download the assets and uncompress them into the relevant directory (e.g. from Catalina_7.7_Windows_binaries.zip into _Catalina\bin_ or from Catalina_7.7_Windows_Geany_binaries.zip into _Catalina\catalina_geany_).
    
Open a Windows command shell (i.e. **cmd.exe**), then **cd** to the Catalina installation folder. Then execute the command **use_catalina** to set up the Catalina environment variables and paths.

The **use_catalina** script will also check whether the Catalina binaries have been installed, and also whether there is a version of **make** installed. While **make** is not required to use the Catalina compiler, it is required to _build_ Catalina or Catalyst, and also to execute the various **build_all** scripts in the release. See the section called **Catalina and make** below.

Then you can either use Catalina directly from the command line, or use the command **catalina_geany** to start the Catalina Geany Integrated Deveopment Environment. The Catalina documents are available in the **Documents** folder.

To create Windows Start Menu entries, open a Windows command shell (i.e. **cmd.exe**) with Administrator privileges, then **cd** to the Catalina installation folder. Then execute the command **catalina_shortcuts** optionally specifying the name of the Start Menu entry to create (in quotes). For example: **catalina_shortcuts "Catalina 7.7"**. If you do not specify a name then "Catalina" will be used. Then you can start either a Catalina Command Line or Catalina Geany from the Windows Start Menu. Also, the Start Menu will contain links to the Catalina Documents.

Linux Precompiled Package
-------------------------

If you downloaded a Linux release package (e.g. **Catalina_7.7_Linux.tar.gz**) then the package will contain executables built for a recent Ubuntu release (currently Ubuntu version 23). Simply open a Terminal window, **cd** to the directory where you installed Catalina and enter (note the back quotes):

**export LCCDIR=\`pwd\`**

**source use_catalina**

The **use_catalina** script will also check whether the Catalina binaries have been installed, and also whether there is a version of **make** installed. While **make** is not required to use the Catalina compiler, it is required to _build_ Catalina or Catalyst, and also to execute the various **build_all** scripts in the release. See the section called **Catalina and make** below.

Then you can either use Catalina directly from the command-line or enter **catalina_geany** to use the Catalina Geany IDE. However, if the pre-built Catalina executables do not work on your Linux installation, refer to the next section on installing it manually.

Linux Manual Install
--------------------
If you cloned the Git repository or downloaded it as a compressed file and then uncompressed it then you must always rebuild Catalina from source. Follow the Linux instructions in the **BUILD.TXT** document in the main Catalina installation folder to build Catalina. This document also contains instructions on setting Catalina up for use.

Raspberry Pi OS Install
-----------------------

If you cloned the Git repository or downloaded it as a compressed file and then uncompressed it then you must always rebuild Catalina from source. Follow the Raspberry Pi instructions in the **BUILD.TXT** document in the main Catalina installation folder to build Catalina. This document also contains instructions on setting Catalina up for use.

Catalina and make
-----------------

While Catalina does not _require_ **make** to just use the C compiler, it _is_ required to rebuild Catalina, Geany and Catalyst from source, and is also used by **catalina_geany**, and also various Catalina scripts such as the **build_all** scripts in the _Catalina\demos_ directories. 

The **use_catalina** script will warn if **make** is not installed.

Linux will usually have **make** installed. If it does not, use the appropriate package manager to install it.

Windows does not have a native version of **make**. The GNU version can be installed either by installing Cygwin, MinGW, MSYS2 or GNuWin32, but the recommended method is to execute the following in a Command Line window (requires an active internet connection):

**winget install ezwinports.make**

Note that this installation only has to be done once, but that the current Command Line window will have to be closed and a new one opened for the installation to take effect.

More Information
----------------
The documents **Getting Started with Catalina** and **Getting Started with the Catalina Geany IDE** for tutorial information on using Catalina.

See the other Catalina documents for more detailed information on various Catalina components.

