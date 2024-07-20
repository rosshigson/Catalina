/*
 * Catalyst - an SD card program loader for Catalina
 *
 * P1 & P2 GENERAL NOTES (for P1-SPECIFC and P2-SPECIFIC notes, see below):
 *
 * Most of the following user-configurable options are now in catalyst.h.
 *
 * 1. Set the symbol WINDOWS_EOL in catalyst.h to 1 for Windows style line
 *    termination (CRLF) instead of UNIX style line termination for (LF).
 *    This will also apply to all catalyst utilities.
 *
 * 2. Set the symbols ENABLE_AUTO to 1 to enable the auto-execution of a 
 *    command file on startup (by default AUTOEXEC.TXT), and set the symbol 
 *    ENABLE_DELETE to 1 to automatically delete this file after execution.
 *    The first command found in the file is executed.
 *
 * 3. Set the symbol ENABLE_FAT32 to 1 support the FAT32 file system (note
 *    this also has to be defined in the Catalina_XMM_SD_Loader.spin file to
 *    work correctly!). Otherwise only FAT16 is supported. There is probably
 *    no reason to ever change this, unless you need to load Hub programs
 *    that are larger than allowable using the FAT32 support (see the XMM SD
 *    Loader for more details).
 *
 * 4. Catalyst now attempts to execute the command as a lua script - this
 *    occurs after trying the built-in commands, but before trying to load
 *    a binary program. This means that the built-in commands cannot be
 *    overridden but the binary commands can. If the Lua script has a ".lua"
 *    extension then by default it will be executed with LUA.BIN. If it has
 *    a ".lux" extension it will be executed with LUAX.BIN. Note that ".lux"
 *    is tried before ".lua" so ".lux" will be used if both files exist.
 *
 * 5. Set the symbol ENABLE_ONCE to enable the auto-execution of a once-only 
 *    command file (by default EXECONCE.TXT). This occurs prior to checking 
 *    for the AUTO file. The first command found in this file is executed. 
 *    If ENABLE_SCRIPT is set to 0 Catalyst then deletes the file so this 
 *    command will not be executed again. This is similar to AUTOEXEC.TXT 
 *    when ENABLE_DELETE is set to 1. The ONCE functionality is intended 
 *    to allow a program such as Lua to execute any Catalyst command by 
 *    writing the command to the file and then rebooting the Propeller. 
 *    If ENABLE_SCRIPT is set to 1, then instead of deleting the file, only 
 *    the first command in the file is deleted. This means that after the 
 *    execution of the first command and the reboot, the next command in 
 *    the file will then be executed. This process continues until there 
 *    are no more commands in the file. This functionality allows for a 
 *    basic text scripting mechanism to be implemented by simply copying 
 *    the script to be executed to the ONCE file and then rebooting the 
 *    Propeller.
 *
 * 6. Catalyst echoes commands in the AUTOEXEC.TXT or EXECONCE.TXT files 
 *    before execution unless the first character of the command is '@' 
 *    (which is ignored). Also, if the first character of a command is '#' 
 *    then it the command is treated as a comment. Note that this does not 
 *    interfere with the use of these characters when multi-cpu mode is 
 *    enabled, since that only applies to commands entered interactively.
 *    
 * 7. Before it executes each command in the AUTOEXEC.TXT or EXECONCE.TXT
 *    files, Catalyst checks for a key press and offers to abort the command 
 *    auto-execution if one is detected. Note that since the key buffer is 
 *    discarded before each new command is executed, it may be necessary to 
 *    hold a key down (the ESC key is recommended) in order to ensure it is 
 *    detected. 
 *
 * P1-SPECIFIC NOTES:
 *
 * 1. If you compile this program manually, it MUST be compiled in compact
 *    mode (-C COMPACT), and it MUST be compiled with the CATALYST symbol
 *    defined (-C CATALYST). The batch file (build_all) does both of these
 *    automatically. Defining the CATALYST symbol does several things:
 *
 *    (a) Ensures the C stack is allocated from LOADTIME_ALLOC instead of
 *        from the usual RUNTIME_ALLOC - this is required for all loaders.
 *
 *    (b) Enables minor changes in Extras.spin and HMI.spin to ensure that
 *        the startup sequence and memory layout enables the use of HUB Ram
 *        occupied by Spin objects as HMI buffers. This allows the program 
 *        to be run using any HMI mode except HiRes VGA. Without these 
 *        changes, only serial HMI modes (TTY, PC) would be possible.
 *
 * 2. When compiled to use the Cache and/or FLASH, memory limitations mean 
 *    that Catalyst cannot support the HIRES_VGA HMI option.
 *
 * 3. Note that when compiling Catalina and its utilities to use FLASH
 *    with the 'build_all' batch file, you may see a warning message that 
 *    "FLASH is incompatible with current layout - ignoring". This is 
 *    because the simpleminded build script compiles the XMM loader 
 *    (which needs the FLASH code) and the Catalyst program and utilities
 *    (which  don't) using the same options. You can ignore this warning.
 *
 * 4. On the Propeller 1, there may not be sufficient Hub RAM to enable
 *    both Lua scripting and the ability to execute multiple commands in
 *    the EXECONCE.TXT file. This depends partly on the HMI option in use. 
 *    By default, Lua scripting is enabled and the multiple EXECONCE.TXT 
 *    command option is disabled. This should work on platforms that use 
 *    a serial HMI option. If it does not, then you may need to manually 
 *    disable both these options.
 *   
 *
 * P2-SPECIFIC NOTES:
 * 
 * 1. Only .BIN, .BIX, and Lua programs loaded from SD Card to Hub RAM 
 *    and XMM RAM are currently supported. There is no multi-CPU support, 
 *    and no EEPROM or FLASH loading. 
 * 2. Unless __CATALINA_NO_ENV is defined, up to MAX_ENV_LEN bytes of 
 *    environment data is loaded from "catalyst.env" on startup, and loaded 
 *    into the LUT RAM of the CogStore cog.
 * 3. On the Propeller 2, Catalysts now supports environment variables. 
 *    - The environment variable PROMPT can be used to set a prompt of up
 *      to 20 characters. Use the "set" command to set it. For example:
 *         set PROMPT="Catalyst> "
 *    - The environment variables LUA and LUAX can be used to set the 
 *      specific Lua executable that will be used to execute lua scripts 
 *      and compiled Lua scripts direct from the command line. For example:
 *         set LUA=mlua
 *         set LUAX=xl_lua
 *    - the environment variable LUA_INIT can be used to specify either a 
 *      Lua command, or a Lua script to execute on startup. For example:
 *         set LUA_INIT="_PROMPT='Lua> '"
 *         set LUA_INIT="@script.lua"
 */

#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <prop.h>
#include <hmi.h>
#include <fs.h>

#include "catalyst.h"  // most configuration options now here!

// debugging - note that enabling these options will reduce the size of 
// loadable programs, since the Cluster List overlaps with the registry

//#define DEBUG_CLUSTERLIST

typedef struct _tagLOADINFO {
   uint32_t Sect;
   uint32_t Shift;
   uint32_t Size;
   uint32_t List[MAX_FLIST_SIZE];

} LOADINFO, *PLOADINFO;


uint8_t command[MAX_CMD_LEN + 1];
uint8_t keyword[MAX_CMD_LEN + 1];
uint8_t *arguments;


uint32_t fileext;
uint32_t filelen;

int cpu_to_load;

int file_mode;

static int rows = 0;
static int cols = 0;

static int aborted = 0;

static char lua[MAX_LUA_LEN + 1] = LUA_CMD;  // set to default lua cmd
static char luax[MAX_LUA_LEN + 1] = LUAX_CMD;  // set to default lua cmd

#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)
static char environ[MAX_ENV_LEN + 8]; // allow for 2 additional longs
static char prompt[MAX_PROMPT_LEN + 1] = "> ";  // set to default prompt
#endif

void t_eol() {
   t_string(1, END_OF_LINE);
}

void t_ch(char ch) {
   t_char(1, ch);
}

void t_str(char *str) {
   t_string(1, str);
}

void t_strln(char *str) {
   t_string(1, str);
   t_eol();
}

int press_key_to_continue() {
   int k;
/*
 * Prompt for a key to continue - set aborted to 1 
 * and return TRUE if ESC is the key
 */
   t_str("Continue? (ESC exits) ...");
   k = k_wait();
   t_eol();
   aborted = (k == 0x1b);
   return aborted;
}

/*
 * Load the cluster list of the file whose name is in filename, storing up
 * to MAX_FLIST_SIZE words starting at FLIST_ADDRESS - if there are less
 * than MAX_FLIST_SIZE longs then the list is terminated with 0xFFFFFFFF.
 *
 * return codes:
 *     0 = ok
 *    -1 = file not found
 *    -2 = bad cluster
 *    -3 = file too large
 */
int LoadClusterList (PVOLINFO vi, uint8_t *filename, PLOADINFO li)  {
   int offset, chain_count, cluster, i;
   FILEINFO fi;
   DIRINFO di;
   uint8_t scratch[SECTOR_SIZE];
   uint32_t clustersize;
   uint8_t pathname[MAX_PATH + 1];

   clustersize = vi->secperclus * SECTOR_SIZE;

   // try opening file in current directory
   if (DFS_OpenFile(vi, filename, DFS_READ, scratch, &fi) != DFS_OK) {
      // try opening file in bin directory
      strcpy((char *)pathname, BIN_PATH);
      strncat((char *)pathname, (char *)filename, MAX_PATH-strlen((char *)pathname));
      if (DFS_OpenFile(vi, pathname, DFS_READ, scratch, &fi) != DFS_OK) {
         return -1;
      }
   }

   li->Sect = vi->dataarea - 2 * vi->secperclus;
#ifdef DEBUG_CLUSTERLIST
   t_str("Sect= ");
   t_hex(1, li->Sect);
#endif

   i = vi->secperclus;
   li->Shift = 0;
   while (i > 1) {
      li->Shift++;
      i >>= 1;
   }
#ifdef DEBUG_CLUSTERLIST
  t_str(", Shft= ");
  t_hex(1, li->Shift);
#endif

  li->Size = fi.filelen;
#ifdef DEBUG_CLUSTERLIST
  t_str(", Size= ");
  t_hex(1, li->Size);
#endif

   chain_count = 0;
   offset = 0;
   cluster = fi.cluster;

#ifdef DEBUG_CLUSTERLIST
   t_str(", List= ");
#endif
   while (offset < fi.filelen) {
      if (chain_count < MAX_FLIST_SIZE) {
         li->List[chain_count] = cluster;
#ifdef DEBUG_CLUSTERLIST
         t_hex(1, cluster);
         t_ch(' ');
#endif
         chain_count++;
         if (cluster >= 0) {
            offset += clustersize;
            DFS_Seek(&fi, offset, scratch);
            cluster = fi.cluster;
         }
         else {
#ifdef DEBUG_CLUSTERLIST
            t_eol();
#endif
            return -2;
         }
      }
      else {
#ifdef DEBUG_CLUSTERLIST
         t_eol();
#endif
         return -3;
      }
   }

#ifdef DEBUG_CLUSTERLIST
   t_eol();
#endif

   if (chain_count < MAX_FLIST_SIZE) {
      li->List[chain_count] = 0xFFFFFFFF;
   }

   return 0;
}

void ReadCmd() {
   int i, j;
   int x, y, x_y;
   uint8_t ch;

   i = 0;
   fileext = 0;
   filelen = 0;

   k_clear();

   while (i == 0) {
#if ENABLE_CPU
      if (cpu_to_load != 0) {
         t_str("CPU ");
         t_integer(1, cpu_to_load);
      }
#endif
#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)
      t_str(prompt);
#else
      t_str("> ");
#endif
      while (i < MAX_CMD_LEN) {
         ch = (uint8_t) k_wait() & 0xFF;
#if ENABLE_CPU
         if ((i == 0) && (ch == ')') && (cpu_to_load != 0)) {
           t_eol();
           cpu_to_load = 0;
           break;
         }
         else if ((i == 0) && (ch == '!') && (cpu_to_load != 1)) {
           t_eol();
           cpu_to_load = 1;
           break;
         }
         else if ((i == 0) && (ch == '@') && (cpu_to_load != 2)) {
           t_eol();
           cpu_to_load = 2;
           break;
         }
         else if ((i == 0) && (ch == '#') && (cpu_to_load != 3)) {
           t_eol();
           cpu_to_load = 3;
           break;
         }
#endif
         if ((ch == 8) || (ch == 127)) { // BS or DEL
#ifdef SERIAL_HMI
            t_ch(ch);
#else
            x_y = t_getpos(1);
            x = x_y >> 8;
            y = x_y & 0xFF;
            if (x > 0) {
               x--;
               t_setpos(1, x, y);
               t_ch(' ');
               t_setpos(1, x, y);
            }
#endif
            if (i > 0) {
               i--;
            }
         }
         else {
            if ((ch == '\n') || (ch == '\r')) {
               break;
            }
            else if (i < MAX_CMD_LEN) {
               command[i++] = ch;
            }
            t_ch(ch);
         }
      }
      t_eol();
      command[i] = '\0';
   }
}


void ParseCmd() {
   int i = 0;

   arguments = NULL;

   while ((command[i] == ' ') && (command[i] != '\0')) {
      i++;
   }

   if (command[0] == '@') {
      i++; // ignore leading '@' (means don't echo in AUTOEXEC or EXECONCE!)
   }

   while (command[i] != '\0') {
      if (command[i] == '.') {
         fileext = 1;
      }
      if (command[i] == ' ') {
         break;
      }
      else {
         keyword[filelen++] = command[i++];
      }
   }
   keyword[filelen] = '\0';

   // check for arguments
   while (command[i] == ' ') {
      i++;
   }
   if (command[i] != '\0') {
      arguments = &command[i];
   }

   // keyword is upper case
   for (i = 0; i < filelen; i++) {
      keyword[i] = toupper(keyword[i]);
   }
}


int TryExtension(PVOLINFO vi, PLOADINFO li, char *ext) {
//
// Try loading a file with the name of the keyword, 
// plus the specified extension. 
// If that doesn't work, remove the extension
//
   int len;
   int result;
  
   len = strlen((char *)keyword);
   strcpy((char *)&keyword[filelen], ext);
   if ((result = LoadClusterList(vi, keyword, li)) != 0) {
      keyword[len] = 0;
   }
   return result;
}


int BuiltInCommand(PVOLINFO vi, uint8_t *keyword, uint8_t *arguments) {
   if (*keyword == '#') {
      // comment line - just ignore it!
      return 1;
   }
   if (strcmp((char *)keyword, "CLS") == 0) {
#ifdef SERIAL_HMI
      t_str("\x1b[0;0H\x1b[2J");   // VT 100 HVP + Erase Page
#else
      t_scroll(rows-1, 0, rows-1);
      t_setpos(1, 0, 0) ;
#endif
      return 1;
   }
   return 0;
}

//#define DISPLAY_REGISTRY

#ifdef DISPLAY_REGISTRY
/*
 * display_registry - decode and display the registry before each command
 *                    (this is useful when debugging Catalyst)
 */
void display_registry(void) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   while (i < COG_MAX) {
      t_printf("Registry Entry %2d: ", i);
      // display plugin type
      t_printf("%3d ", (REGISTERED_TYPE(i)));
      // display plugin name
      t_printf("%24s ", _plugin_name(REGISTERED_TYPE(i))); 
      // display pointer to the request block
      t_printf("$%05x: ", (REQUEST_BLOCK(i)));
      a_ptr = (unsigned long *)(REQUEST_BLOCK(i));   
      // first  Request_Block long                       
      t_printf("$%08x ", *(a_ptr +0));     
      // second Request_Block long                          
      t_printf("$%08x ", *(a_ptr +1));     
      t_printf("\n");
      i++;
   };
   t_printf("\n");
}
#endif


#if ENABLE_LUA

// see if the keyword is a lua command (i.e. a lua script of that name exists 
// in either the root or BIN_DIR directory) and if so, quietly adjust the 
// command etc to invoke the lua interpteter on the script and arguments.
void LuaCommandMagic(PVOLINFO vi, uint8_t *filename, uint8_t *arguments) {
   char lua_script[MAX_CMD_LEN + 1];
   char lua_cmd[MAX_CMD_LEN + 1];
   int result = 0;
   FILEINFO fi;
   uint8_t scratch[SECTOR_SIZE];

   strcpy(lua_script, (char *)filename);
   // if the filename has an extension make sure it is LUA_EXT or LUAX_EXT
   if (fileext) {
      if (strcmp(LUA_EXT, strchr((char *)filename, '.')) == 0) {
         strcpy(lua_cmd, lua); // use normal Lua
      }
      else if (strcmp(LUAX_EXT, strchr((char *)filename, '.')) == 0) {
         strcpy(lua_cmd, luax); // use compiled Lua
      }
      else {
         // not a Lua file
         return;
      }
   }
   else {
      // no extension - first, try compiled Lua
      strcpy(lua_cmd, luax);
   }

   // first, try opening a script with this name in root directory,
   // try a compiled verson of the name if it has no extenstion

   if (!fileext) {
      strcat(lua_script, LUAX_EXT);
   }
   result = (DFS_OpenFile(vi, (uint8_t *)lua_script, DFS_READ, scratch, &fi) == DFS_OK);
   if (!result) {
      // next, try opening a script with that name in the bin directory
      strcpy(lua_script, BIN_PATH);
      strcat(lua_script, (char *)filename);
      if (fileext == 0) {
         strcat(lua_script, LUAX_EXT);
      }
      result = (DFS_OpenFile(vi, (uint8_t *)lua_script, DFS_READ, scratch, &fi) == DFS_OK);
   }

   // next, if there was no extension specified, try a non-compiled 
   // version of the name

   if (!result && !fileext) {
      // try opening a non-compiled script in the root directory
      strcpy(lua_cmd, lua);
      strcpy(lua_script, (char *)filename);
      strcat(lua_script, LUA_EXT);
      result = (DFS_OpenFile(vi, (uint8_t *)lua_script, DFS_READ, scratch, &fi) == DFS_OK);
   
      if (!result) {
         // try opening a non-compiled script in the bin directory
         strcpy(lua_script, BIN_PATH);
         strcat(lua_script, (char *)filename);
         strcat(lua_script, LUA_EXT);
         result = (DFS_OpenFile(vi, (uint8_t *)lua_script, DFS_READ, scratch, &fi) == DFS_OK);
      }
   }
   if (result) {
      strcat(lua_cmd, " ");
      strcat(lua_cmd, lua_script);
      strcat(lua_cmd, " ");
      if (arguments != NULL) {
         strcat(lua_cmd, (char *)arguments);
      }
      // parse lua command to set up keyword and arguments to execute 
      strcpy((char *)command, lua_cmd);
      filelen = 0;
      fileext = 0;
      ParseCmd();
   }
}

#endif

#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)

static char *find_name(char *environ, char *name, char **value) {
   char *curr_name;
   int  len;

   // point to first name
   curr_name = environ;
   while (*curr_name != '\0') {
      // try this name
      *value = curr_name;
      while ((**value != '\n') && (**value != '=') && (**value != '\0')) {
         (*value)++;
      }
      len = *value - curr_name;
      if ((len == strlen(name)) && (strncmp(name, curr_name, len) == 0)) {
         // found it!
         if (**value == '=') {
            // value starts beyond '='
            (*value)++;
         }
         return curr_name;
      }
      else {
         // skip to next name
         while ((*curr_name != '\n') && (*curr_name != '\0')) {
            curr_name++;
         }
         if (*curr_name == '\n') {
            curr_name++;
         }
      }
   }
   // name not found
   *value = NULL;
   return NULL;
}

void initialize_environ() {
  // find the prompt in environ - if it exists, it may be terminated by 
  // EITHER '\n' or '\0', so copy it to prompt and terminate it with
  // a null character.
  char *e;
  int i = 0;
  find_name(environ, "PROMPT", &e);
  if (e != NULL) {
     while ((i < MAX_PROMPT_LEN) && ((e[i]) != '\0') && (e[i] != '\n')) {
       prompt[i] = e[i++];
     }
     prompt[i] = 0;
  }
  // find the name of the lua and luax executable in environ - if they
  // exits (as LUA and LUAX) copy them to lua and luax and terminate 
  // them with a NULL character.
  i = 0;
  find_name(environ, "LUA", &e);
  if (e != NULL) {
     while ((i < MAX_LUA_LEN) && ((e[i]) != '\0') && (e[i] != '\n')) {
       lua[i] = e[i++];
     }
     lua[i] = 0;
  }
  i = 0;
  find_name(environ, "LUAX", &e);
  if (e != NULL) {
     while ((i < MAX_LUA_LEN) && ((e[i]) != '\0') && (e[i] != '\n')) {
       luax[i] = e[i++];
     }
     luax[i] = 0;
  }
}

#endif

void main() {
   uint8_t sector[SECTOR_SIZE];
   uint32_t pstart, psize;
   uint8_t pactive, ptype;
   VOLINFO vi;
   FILEINFO fi;
   FILEINFO mi;
   DIRINFO di;
   DIRENT de;
   LOADINFO li;
   int i, j;
   uint8_t filename[32];
   char ch;
   char buff[SECTOR_SIZE];
   int size;
   int result = 0;
   int loaded = 0;
   int stop_cogstore = 0;
   int type = 0;
   int read_ok = 0;
   int once_exec = ENABLE_ONCE;
   int auto_exec = ENABLE_AUTO;
   int delete = 0;
   char *auto_name = NULL;
   char *once_name = ONCEFILE;
   int auto_file = 0;
#if ENABLE_SCRIPT
   int more_exec = 0;
   char *more_name = MOREFILE;
   int more_file = 0;
#endif
   request_t *rqst;
   int rowcol;

#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)
   int env_file = 0;
   int elen = 0;
#endif

#ifndef SERIAL_HMI
   rowcol = t_geometry();
   cols = (rowcol >> 8) & 0xFF;
   rows = rowcol & 0xFF;
   t_scroll(rows-1, 0, rows-1);
   t_setpos(1, 0, 0) ;
#endif   

   if (rows == 0) {
      rows = 24;
   }
   if (cols == 0) {
      cols = 80;
   }

   pstart = DFS_GetPtnStart(0, sector, 0, &pactive, &ptype, &psize);
   DFS_GetVolInfo(0, sector, pstart, &vi);

#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)

   // read environment from file
   
   env_file = _open_unmanaged(ENV_FILE, 0, &fi);
   environ[elen] = 0;
   if (env_file >= 0) {
      // read a maxmium of MAX_ENV_LEN bytes
      elen = _read(env_file, environ, MAX_ENV_LEN);
      env_file = _close_unmanaged(env_file);
   }
   // add 7 nulls to ensure there is a zero long at
   // the end of the environment (to terminate it)
   for (i = elen; i < elen + 7; i++) {
      environ[i] = 0;
   }
   //t_printf("Len = %d, Env = \"%s\"\n", elen, environ);

   // initialize various values from environment (if present)
   initialize_environ();

#endif

   while(1) {

      loaded = 0;
      file_mode = 0;
      cpu_to_load = 0;
      StartCogStore();

#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)
      WriteLUTStore(environ);
#endif

#if ENABLE_AUTO||ENABLE_ONCE
      if (once_exec||auto_exec) {
         auto_file = -1;
         if (once_exec) {
            auto_name = ONCEFILE;
            auto_file = _open_unmanaged(auto_name, 0, &fi);
            // always delete the file once executed
            delete = 1;
         }
         if (auto_file == -1) {
            auto_name = AUTOFILE;
            auto_file = _open_unmanaged(auto_name, 0, &fi);
            // delete the file only if ENABLE_DELETE set to 1
            delete = ENABLE_DELETE;
         }
         if (auto_file != -1) {
            i = 0;
            filelen = 0;
            fileext = 0;
            command[0] = 0;
            keyword[0] = 0;
            // skip spaces
            while (read_ok = (_read(auto_file, &ch, 1) > 0)) {
               if (!isspace(ch)) {
                  break;
               }
            }
            // read command and arguments
            while (read_ok && (i < MAX_CMD_LEN)) {
               if ((ch == '\n') || (ch == '\r') || (ch == '\0')) {
                  read_ok = 0;
               }
               else {
                  command[i++] = ch;
                  read_ok = (_read(auto_file, &ch, 1) > 0);
               }
            }
            command[i] = '\0';

#if ENABLE_SCRIPT
            // read until we find another command, or end of file
            while (read_ok = (_read(auto_file, &ch, 1) > 0)) {
               if (!isspace(ch)) {
                  // found more commands in once_exec file
                  more_exec = 1;
                  break;
               }
            }
            if (more_exec) {
               // we found another command, copy remainder to more file
               // unless we detect a keypress - if we do then prompt
               if (k_ready()) {
                   char key;
                   k_clear();
                   t_printf("Continue auto execution (y/n)? ");
                   do {
                      key = toupper(k_wait());
                   }
                   while ((key != 'Y') && (key != 'N'));
                   if (toupper(key) != 'Y')  {
                      t_printf("Aborting\n");
                      _unlink(once_name); // delete file if it exists
                      more_exec = 0;   // terminate auto execute
                      command[0]='\0'; // do not execute current command
                   }
                   else {
                      t_printf("Continuing\n");
                   }
               }
               _unlink(more_name); // delete file if it exists
               if (more_exec) {
                  more_file = _open_unmanaged(more_name, 1, &mi);
                  buff[0]=ch;
                  size = _read(auto_file, &buff[1], SECTOR_SIZE-1);
                  size++;
                  read_ok = 1;
                  while (read_ok) {
                     _write(more_file, buff, size);
                     read_ok = ((size = _read(auto_file, buff, SECTOR_SIZE)) > 0);
                  }
                  _close_unmanaged(more_file);
               }
            }
            if ((command[0] != '@') && (command[0] != 0)) {
               // echo the command about to be executed
               t_printf("%s\n", command);
            }
#endif

            _close_unmanaged(auto_file);
            if (command[0] == 0) {
               // no command found in auto file, so
               // do not try auto execution again
               once_exec = auto_exec = 0;
            }
            else {
               // extract keyword and arguments
               ParseCmd();
            }
            if (delete) {
               // delete the auto execution file
               _unlink(auto_name);
            }
#if ENABLE_SCRIPT
            if (more_exec) {
               // rename the remaining command file
               // for once-off auto execution next time
               _rename(more_name, once_name);
            }
#endif
         }
         else {
            // we only try auto execution once,
            // then get an interactive command
            once_exec = auto_exec = 0;
         }
      }
#endif

      if (!(once_exec||auto_exec)) {
         // display banner and prompt for a command
         t_str(CATALYST_VER);
         t_eol();
         // get the command
         ReadCmd();
         // extract keyword and arguments
         ParseCmd();
      }

      if (!BuiltInCommand(&vi, keyword, arguments)) {
#if ENABLE_LUA
         LuaCommandMagic(&vi, keyword, arguments);
#endif
         WriteCogStore(command);
         if (arguments == NULL) {
#if !defined(__CATALINA_P2) || defined(__CATALINA_NO_ENV)
            // this is not a built-in command, and we have no arguments,
            // so stop cogstore in case it interferes with non-Catalyst
            // programs that do not expect any arguments
            StopCogStore();
#else
            if (elen == 0) {
            // this is not a built-in command, and we have no arguments
            // and no environment to pass, so stop cogstore in case it 
            // interferes with non-Catalyst programs that do not expect 
            // any arguments or environment
               StopCogStore();
            }
#endif
         }
         if ((result = LoadClusterList(&vi, keyword, &li)) == 0) {
            loaded = 1;
            if ((fileext == 0) || (filelen < 5)) {
               file_mode = 0;
            }
            else if (strcmp((char *)&keyword[filelen-4], XMM_EXT) == 0) {
               file_mode = 5;
            }
#ifndef __CATALINA_P2
            else if (strcmp((char *)&keyword[filelen-4], SMM_EXT) == 0) {
               file_mode = 6;
            }
#endif
            else {
               file_mode = 0;
            }
         }
         else if ((fileext == 0 && filelen <= 8)) {
            if (TryExtension(&vi, &li, BIN_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
            else if (TryExtension(&vi, &li, XMM_EXT) == 0) {
               loaded = 1;
               file_mode = 5;
            }
            else if (TryExtension(&vi, &li, LMM_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
#ifdef __CATALINA_P2
            else if (TryExtension(&vi, &li, BIX_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
#else
            else if (TryExtension(&vi, &li, SMM_EXT) == 0) {
               loaded = 1;
               file_mode = 6;
            }
#endif
         }
         if (loaded) {
            // the order of actions is important here - first, we must
            // shut down all extraneous cogs since they may be using
            // the area we need to use to build the cluster list

#ifdef DISPLAY_REGISTRY
            display_registry();
            _waitsec(1);
#endif

            for (i = 0; i < 8; i++) {
               type = REGISTERED_TYPE(i);
               rqst = REQUEST_BLOCK(i);
               if ((type != LMM_VMM) && (type != LMM_FIL) && (type != LMM_STO) 
#ifdef __CATALINA_libpsram
               &&  (type != LMM_PM1)
#endif
#ifdef __CATALINA_libhyper
               &&  (type != LMM_HYP)
#endif
               &&  (type != LMM_XCH) && (type != LMM_NUL)) {
#ifndef DEBUG_CLUSTERLIST
                  _cogstop(i);
#endif
               }
            }

            // now set up the file cluster list
            *(long *)FLIST_FSIZ = li.Size;
            *(long *)FLIST_SHFT = li.Shift;
            *(long *)FLIST_SECT = li.Sect;
            {
               int i = 0;
#if ENABLE_FAT32
               long *list = (long *)FLIST_ADDRESS;
               while ((i < MAX_FLIST_SIZE) && (li.List[i] != 0xFFFFFFFF)) {
                  *list = (long)li.List[i];
#else
               short *list = (short *)FLIST_ADDRESS;
               while ((i < MAX_FLIST_SIZE) && (li.List[i] != 0xFFFFFFFF)) {
                  *list = (short)li.List[i];
#endif
#ifdef DEBUG_CLUSTERLIST
                  t_printf("list addr = %x, ", (long)list);
                  t_printf("entry = %x", *list);
                  t_eol();
#endif
                  list++;
                  i++;
               }
               if (i < MAX_FLIST_SIZE) {
                  *list = 0;
               }
            }
#ifdef DEBUG_CLUSTERLIST
            t_printf("Press a key to continue ...");
            k_wait();
            t_eol();
#endif

#ifndef __CATALINA_P2

#if ENABLE_CPU
#ifndef __USING_CACHE // currently can't use serial loader AND the cache
            // now start the SIO cog (used for Multi-CPU Loaders)
            StartSIO();
#endif
#endif

#ifdef __USING_CACHE
            // now start the cache
            StartCache();
#endif            

#endif

            // now load the SD Card loader (never returns!)
            Execute(cpu_to_load, file_mode);
         }
         else {
            t_str("cannot open file ");
            t_str((char *)keyword);
            t_eol();
         }
      }
   }
}
