This directory contains an alternative interactive Lua REPL (Read Evaluate
Print Loop). It is based on 'lua-repl' and also on the 'linenoise' command 
line editor. It adds command line editing and history capability to Lua.

There are no programs to build, since all the C code required is already
in the C library. So there are no 'build_all', 'clean_all' scripts or 
Makefiles, just some Lua programs and data files that should be copied to a 
Catalyst SD card - so there is a 'copy_all' script. The files that will be
copied are:

   ilua.lua  - a demonstration of "Interactive" Lua, which uses 'linenoise' 
               and 'lua-repl' to add command line editing and command history 
               to Lua (similar to what has been added to Catalyst).
               See below for more details.

   _rc.lua   - a customizable file that is used to overwrite the default
               plugins and add any other customizations to ilua. This file
               is executed on startup by ilua.lua

   help.lua  - a simple help file that displays some helpful information
               on startup. Called by the _rc.lua file. Can be edited if
               required.

   repl      - this is a folder that contains the 'lua-repl' code and plugins. 
               Note that this directory contains ALL the standard 'lua-repl' 
               plugins, including some that may not yet work with Catalyst's 
               version of Lua, because they depend on other Lua libraries not 
               yet ported. Also, the 'lua-repl' names have had to be shortened
               to fit in DOS 8.3 filenames. The plugins known to work (and 
               which are loaded by default) along with their original file 
               names are:

                  auto (autoreturn) - no need to use 'return' keyword
                  comp (completion) - command completion support
                  history (history) - command history support
                  noise (linenoise) - linenoise support
                  pretty (pretty_print) - pretty printer (for tables etc)
                  semi (semicolon_suppress_output) - suppress output on ';'

After copying the files to the SD card, to invoke "Interactive Lua" from the
Catalyst prompt, simply type:

   ilua

Here is a summary of the capabilities added by ilua:

   LEFT ARROW (or CTRL B)  : move cursor left
   RIGHT ARROW (or CTRL F) : move cursor right
   UP ARROW (or CTRL P)    : previous command in history
   DOWN ARROW (or CTRL N)  : next command in history
   HOME (or CTRL A)        : move cursor to start of line
   END (or CTRL E)         : move cursor to end of line
   CTRL L                  : clear screen
   CTRL U                  : clear line
   CTRL K                  : clear from cursor to end of line
   CTRL W                  : clear previous word
   CTRL T                  : swap current and previous characters 
   CTRL C                  : exit
   CTRL D                  : if at start of line, exit (otherwise delete)
   TAB                     : command completion

Note that the command history is stored in a file on the SD card, but is only 
saved on exit, so you must exit using CTRL C or CTRL D. Resetting the Prop
will mean that any commands entered in the current session will be lost (but 
previous sessions will still be remembered).

The command completion feature is intended to assist in entering Lua symbols 
(e.g. variable and function names). For example:

   p<TAB>      will cycle through all symbols starting with the letter "p"
   pr<TAB>     will complete to "print("
   math.<TAB>  will cycle through all functions in the "math" package

