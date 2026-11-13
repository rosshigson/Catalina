/*

 * Fat Catalyst - an SD card program loader for Catalina based on FatFs
 *                Supported on the Propeller 2 only.
 *
 * NOTES:
 *
 * Most of the following user-configurable options are now in fatcat.h.
 *
 * 1. Set the symbol WINDOWS_EOL in fatcat.h to 1 for Windows style line
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
 * 7. Only .BIN, .BIX, and Lua programs loaded from SD Card to Hub RAM 
 *    and XMM RAM are currently supported. There is no multi-CPU support, 
 *    and no EEPROM or FLASH loading. 
 * 8. Unless __CATALINA_NO_ENV is defined, up to MAX_ENV_LEN bytes of 
 *    environment data is loaded from "catalyst.env" on startup, and loaded 
 *    into the LUT RAM of the CogStore cog.
 * 9. On the Propeller 2, Catalysts now supports environment variables. 
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
 *
 *    - the 'linenoise' command line editor can be enabled by linking with
 *      -llinenoise when compiling. This adds a command history and
 *      some simple command line editing functions:
 *      
 *         LEFT ARROW (or CTRL B)  : move cursor left
 *         RIGHT ARROW (or CTRL F) : move cursor right
 *         UP ARROW (or CTRL P)    : previous command in history
 *         DOWN ARROW (or CTRL N)  : next command in history
 *         HOME (or CTRL A)        : move cursor to start of line
 *         END (or CTRL E)         : move cursor to end of line
 *         CTRL U                  : clear entire line
 *         CTRL K                  : clear from cursor to end of line
 *         CTRL L                  : clear screen
 *         CTRL W                  : clear previous word
 *         CTRL T                  : swap current and previous characters 
 *         TAB                     : command completion (see below)
 * 
 *      Note that the command completion function (if enabled by defining
 *      ENABLE_FILE_COMPLETION in fatcat.h) reads a file of completion 
 *      candidates called COMPLETE.TXT. Actually interrogating the SD Card 
 *      for matching file names is enabled by ENABLE_DYNAMIC_COMPLETION (in
 *      fatcat.h).
 */

#include <ctype.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "ff.h"
#include <prop.h>
#include <hmi.h>

#include "fatcat.h"  // most configuration options now here!

#include "cogstore.h" 

#ifdef __CATALINA_liblinenoise
#include "linenoise.h"
#endif

void Execute(int CPU_Num, int File_Mode); // see loader.c

// debugging - note that enabling these options will reduce the size of 
// loadable programs, since the Cluster List overlaps with the registry

typedef struct _tagLOADINFO {
   uint32_t Sect;
   uint32_t Shift;
   uint32_t Size;
   uint32_t List[MAX_FLIST_SIZE];

} LOADINFO, *PLOADINFO;


static FATFS fs;

static char command[MAX_CMD_LEN + 1];
static char keyword[MAX_CMD_LEN + 1];
static char *arguments;


static uint32_t fileext;
static uint32_t filelen;

static int cpu_to_load;

static int file_mode;

static int rows = 0;
static int cols = 0;

static int aborted = 0;

static char lua[MAX_LUA_LEN + 1] = LUA_CMD;  // set to default lua cmd
static char luax[MAX_LUA_LEN + 1] = LUAX_CMD;  // set to default lua cmd

#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)
static char environ[MAX_ENV_LEN + 8]; // allow for 2 additional longs
static char prompt[MAX_PROMPT_LEN + 1] = DEFAULT_PROMPT; 
#endif

#ifdef __CATALINA_liblinenoise

#define DIAGNOSE_COMPLETION 0 // 1 to print diagnostics, 2 for even more

//#define DEBUG_CLUSTERLIST

//#define DEBUG_ENVIRON

#if ENABLE_FILE_COMPLETION
char file_data[MAX_COMPLETION_LEN + 1];
int  file_len;
#endif

char dynamic_data[MAX_COMPLETION_LEN + 1];
int  dynamic_len;

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
 * than MAX_FLIST_SIZE longs then the list is terminated with 0xFFFFFFFFUL.
 *
 * return codes:
 *     0 = ok
 *    -1 = file not found
 *    -2 = bad cluster
 *    -3 = file too large
 */
int LoadClusterList (const char *filename, PLOADINFO li)  {
   int offset, chain_count, cluster, i;
   FIL fi;
   DIR di;
   uint32_t clustersize;
   char pathname[MAX_PATH + 1];

   clustersize = fs.csize * SECTOR_SIZE;

   // try opening file in current directory
   if (f_open(&fi, filename, FA_READ) != FR_OK) {
      // try opening file in bin directory
      strcpy((char *)pathname, BIN_PATH);
      strncat((char *)pathname, (char *)filename, MAX_PATH-strlen((char *)pathname));
      if (f_open(&fi, pathname, FA_READ) != FR_OK) {
         return -1;
      }
   }
#ifdef DEBUG_CLUSTERLIST
      t_printf("opened file '%s'\n", filename);
#endif

   li->Sect = _low(fs.database) - 2 * fs.csize; 

#ifdef DEBUG_CLUSTERLIST
   t_str("Sect= ");
   t_hex(1, li->Sect);
#endif

   i = fs.csize;
   li->Shift = 0;
   while (i > 1) {
      li->Shift++;
      i >>= 1;
   }
#ifdef DEBUG_CLUSTERLIST
  t_str(", Shft= ");
  t_hex(1, li->Shift);
#endif

  li->Size = _low(fi.obj.objsize);
#ifdef DEBUG_CLUSTERLIST
  t_str(", Size= ");
  t_hex(1, li->Size);
#endif

   chain_count = 0;
   offset = 0;
   cluster = fi.obj.sclust;
#ifdef DEBUG_CLUSTERLIST
  t_str(", Cluster= ");
  t_hex(1, cluster);
#endif

#ifdef DEBUG_CLUSTERLIST
   t_str("\nList= ");
#endif
   while (offset < _low(fi.obj.objsize)) {
      if (chain_count < MAX_FLIST_SIZE) {
         li->List[chain_count] = cluster;
#ifdef DEBUG_CLUSTERLIST
         t_hex(1, cluster);
         t_ch('\n');
         {
            char buff[SECTOR_SIZE];
            unsigned int size;
            f_read(&fi, buff, SECTOR_SIZE, &size);
         }
#endif
         chain_count++;
         if (cluster >= 0) {
            offset += clustersize;
            f_lseek(&fi, _uint32(offset));
            cluster = fi.clust+1;
         }
         else {
#ifdef DEBUG_CLUSTERLIST
            t_eol();
#endif
            f_close(&fi);
            return -2;
         }
      }
      else {
#ifdef DEBUG_CLUSTERLIST
         t_eol();
#endif
         f_close(&fi);
         return -3;
      }
   }

#ifdef DEBUG_CLUSTERLIST
   t_eol();
#endif

   if (chain_count < MAX_FLIST_SIZE) {
      li->List[chain_count] = 0xFFFFFFFFUL;
   }

   f_close(&fi);
   return 0;
}

#ifdef __CATALINA_liblinenoise

#if ENABLE_FILE_COMPLETION || ENABLE_DYNAMIC_COMPLETION

#if 0
// case insensitive strcmp
static int strcmp_i(const char *str1, const char *str2) {
   while ((*str1) && (*str2) && (toupper(*str1) == toupper(*str2))) {
      str1++;
      str2++;
   }
   return (toupper(*str1) - toupper(*str2));
}
#endif

// case insensitive strncmp
static int strncmp_i(const char *str1, const char *str2, int len) {
   int i = 0;
   if (len <= 0) {
      return 0;
   }
   while ((*str1) && (*str2)
   &&     (toupper(*str1) == toupper(*str2))
   &&     (i < len - 1)) {
      str1++;
      str2++;
      i++;
   }
   return (toupper(*str1) - toupper(*str2));
}

#if ENABLE_FILE_COMPLETION
void initialize_file_data() {
   FIL fi;
   int key_file = 0;
   char *key_start, *key_end;

   file_len = 0;
   key_file = (f_open(&fi, COMPLETION_FILE, FA_READ) == FR_OK);
   if (key_file) {
      // read a maxmium of MAX_COMPLETION_LEN bytes
      f_read(&fi, file_data, MAX_COMPLETION_LEN, &file_len);
      f_close(&fi);
   }
   if (file_len >= 0) {
      // process each keyword in file_data, terminating it with null
      key_start = file_data;
      key_end   = file_data;
      while (key_end < &file_data[file_len]) {
         while ((*key_end != '\n') && (*key_end != '\0')) {
            key_end++;
         }
         *key_end = '\0';
         //t_printf("keyword=%s ", key_start);
         key_start = key_end + 1;
         key_end = key_start;
      }
   }
   else {
      // an error was returned by f_read
      file_len = 0;
   }
   file_data[file_len] = '\0';
}
#endif

/*
 * function - called on each file name
 */
void function(char *path, char *filename) {
   int len1;
   int len2;
   int i;

   if ((strcmp(filename, ".") == 0) || (strcmp(filename, "..") == 0)) {
       // do not process "." or ".."
       return;
   }
   if (strlen(path) == 0) {
#if DIAGNOSE_COMPLETION
      t_printf("%s\n", filename);
#endif
      len1 = strlen(filename);
      if (dynamic_len + len1 + 1 < MAX_COMPLETION_LEN) {
         for (i = 0; i <= len1; i++) {
            dynamic_data[dynamic_len++] = filename[i];
         }
      }
   }
   else {
#if DIAGNOSE_COMPLETION
      t_printf("%s%c%s\n", path, DIR_SEPARATOR, filename);
#endif
      len1 = strlen(path);
      len2 = strlen(filename);
      if (dynamic_len + len1 + len2 + 2 < MAX_COMPLETION_LEN) {
         for (i = 0; i < len1; i++) {
            dynamic_data[dynamic_len++] = path[i];
         }
         dynamic_data[dynamic_len++]=DIR_SEPARATOR;
         for (i = 0; i <= len2; i++) {
            dynamic_data[dynamic_len++] = filename[i];
         }
      }
   }
}

// safecpy will never write more than size characters, 
// and is guaranteed to null terminate its result, so
// make sure the buffer passed is at least size + 1
char * safecpy(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncpy(dst, src, size - strlen(dst));
   }
   return NULL;
}

// safecat will never write more than size characters, 
// and is guaranteed to null terminate its result, so
// make sure the buffer passed is at least size + 1
char * safecat(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncat(dst, src, size - strlen(dst));
   }
   return NULL;
}

/*
 * format a directory entry name
 */
char * formatted_name(char *name) {
   static char filename[12+1]; // 8.3 filename plus terminator
   int i;
   int j;
   filename[0] = 0;
   if (name[0] != 0) {
      i = 0;
      j = 0;
      while (i < 8) {
         if (name[i] != ' ') {
            filename[j++] = name[i];
         }
         i++;
      }
#if 0      
      if (strncmp((char *)&name[8],"BIN", 3) == 0) {
         // treat 'BIN' as a special case - do not include the extension!
         filename[j] = '\0';
         return filename;
      }
      if (strncmp((char *)&name[8],"LUA", 3) == 0) {
         // treat 'LUA' as a special case - do not include the extension!
         filename[j] = '\0';
         return filename;
      }
#endif
      if (strncmp((char *)&name[8],"   ", 3) != 0) {
         filename[j++] = '.';
      }
      i = 8;
      while (i < 11) {
         if (name[i] != ' ') {
            filename[j++] = name[i];
         }
         i++;
      }
      filename[j] = '\0';
   }
   return filename;
}


/*
 * process a single directory entry
 */
void do_direntry(char *path, FILINFO *de, int use_path) {
   char *filename;
   int i;

   // get name
   filename = de->fname;
/*
   if (de->attr & ATTR_VOLUME_ID) {
      // do not process volume id
      // function(path, filename);
      return;  
   }
   */
   if (use_path) {
      // add path and filename
      function(path, filename);
   }
   else {
      // just add file name
      function("", filename);
   }
}

/*
 * list a single directory, no recursion
 */ 
void do_single_directory(char *path, char *name, int use_path) {
   DIR di;
   FILINFO de;
   char pattern[] = "*";

   if (f_findfirst(&di, &de, name, pattern) != FR_OK) {
#if DIAGNOSE_COMPLETION
      t_printf("cannot open directory '%s'\n", name);
#endif
      return;
   }

   do {
      if (de.fname[0] != 0) {
         do_direntry(path, &de, use_path);
      }
   } while ((de.fname[0] != 0) && (f_findnext(&di, &de) == FR_OK));
} 

/*
 * process a directory, first by processing its contents, then by
 * recursing into any subdirectories (if requested)
 */ 
void do_directory(char *name, int recurse, int use_path) {
   char *dirname;
   char path[MAX_PATH+1];
   DIR di;
   FILINFO de;
   int count = 0;
   int len = 0;
   int i, j;
   int match = 0;
   char pattern[] = "*";

   safecpy(path, name, MAX_PATH);
   len = strlen(path);

   // remove any trailing separators
   if (path[len] == DIR_SEPARATOR) {
      len--;
      path[len] = 0;
   }

   // process this directory
   do_single_directory(path, name, use_path);

   // now list all subdirectories, if recursive
   if (recurse) {
      if (f_findfirst(&di, &de, name, pattern) != FR_OK) {
#if DIAGNOSE_COMPLETION
         t_printf("cannot open directory %s\n", name);
#endif
         return;
      }

      do {
         if (de.fname[0] != 0) {
            if (de.fattrib & AM_DIR) {
               dirname = de.fname;
               if (strcmp(dirname, ".") == 0) {
#if DIAGNOSE_COMPLETION
                  t_printf("ignoring special entry .\n");
#endif
               }
               else if (strcmp(dirname, "..") == 0) {
#if DIAGNOSE_COMPLETION
                  t_printf("ignoring special entry ..\n");
#endif
               }
               else {
                  path[len] = DIR_SEPARATOR;
                  path[len + 1] = '\0';
                  safecat(path, dirname, MAX_PATH);
                  do_directory(path, 0, use_path);
                  path[len] = '\0';
               }
            }
         }
      } while ((de.fname[0] != 0) && (f_findnext(&di, &de) == FR_OK));
   }
} 

void initialize_dynamic_data(char *dirname, int use_path) {
   int i;

   if ((dirname == NULL) || (strlen(dirname) == 0)) {
      // process the root ("") and BIN direcotories
      do_directory("", 0, 0); // do not include path for root
      do_directory("BIN", 0, 1); // include path for bin
   }
   else if (strcmp(dirname, "/") == 0) {
      // process the root directory, not recursing into subdirectories, 
      // but including the path (because this was specified!)
      do_directory("", 0, use_path);
   }
   else {
      // process a specific sub-directory, recursing into subdirectories
      do_directory(dirname, 1, use_path);
   }
}

void completion(const char *buf, linenoiseCompletions *lc) {
   char completed[MAX_CMD_LEN + 1];
   char *key_start;
   int  key_len;
   char *word;
   char *path;
   char tmp_path[MAX_CMD_LEN];
   char *pch;
   int  i, j;

#if DIAGNOSE_COMPLETION
   t_printf("buf=%s\n", buf);
#endif

   // the word we want to match is the last word in buf
   word = (char *)buf + strlen(buf); 
   while ((word > buf) && (*(word-1) != ' ')) {
      word--;
   }

   // if that word starts with a "/" then remove it because
   // the data we read from the SD does not, so we will not 
   // match it with anything on the SD ...
   if (*word == '/') {
      word++;
   }

#if DIAGNOSE_COMPLETION == 2
   t_printf("word=%s\n", word);
#endif

#if ENABLE_FILE_COMPLETION
   key_start = file_data;
   while (key_start < &file_data[file_len]) {
      // examine every completion for a match
      key_len = strlen(key_start);
      if (*key_start != '#') {
         // not a comment line
         if (strncmp_i(word, key_start, strlen(word)) == 0) {
#if DIAGNOSE_COMPLETION == 2
            t_printf("candidate=%s, len=%d\n", key_start, key_len);
#endif
            // the completion is not just the word, it is buf with
            // the partial word replaced with the complete word!
            for (i = 0; i < (word - buf); i++) {
               completed[i] = buf[i];
            }
            for (j = 0; j < key_len; j++) {
               completed[i+j] = key_start[j];
            }
            completed[i+j] = '\0';
#if DIAGNOSE_COMPLETION == 2
            t_printf("completion=%s\n", completed);
#endif
            linenoiseAddCompletion(lc, completed);
         }
      }
      key_start += key_len + 1;
   }
#endif

#if ENABLE_DYNAMIC_COMPLETION

   // discard any existing dynamic data, or we will run out of space
   dynamic_len = 0;

   // the path we want to match is the last word in buf, 
   // removing anything back to the last DIR_SEPARATOR.
   path = word + strlen(word); 
   while ((path > word) && (*(path-1) != DIR_SEPARATOR)) {
      path--;
   }

#if DIAGNOSE_COMPLETION == 2
   t_printf("path=%s\n", path);
#endif

   for (i = 0; i < path - word - 1; i++) {
      tmp_path[i] = word[i];
   }
   tmp_path[i] = '\0';
#if DIAGNOSE_COMPLETION
   t_printf("from buf '%s' using path '%s'\n", buf, tmp_path);
#endif
   initialize_dynamic_data(tmp_path, 1);
#if DIAGNOSE_COMPLETION
   for (i = 0; i < dynamic_len; i++) {
     t_char(1, dynamic_data[i]);;
   }
#endif   
   key_start = dynamic_data;
   while (key_start < &dynamic_data[dynamic_len]) {
      // examine every completion for a match
      key_len = strlen(key_start);
      if (*key_start != '#') {
         // not a comment line
         if (strncmp_i(word, key_start, strlen(word)) == 0) {
#if DIAGNOSE_COMPLETION == 2
            t_printf("candidate=%s, len=%d\n", key_start, key_len);
#endif
            // the completion is not just the word, it is buf with
            // the partial word replaced with the complete word!
            for (i = 0; i < (word - buf); i++) {
               completed[i] = buf[i];
            }
            for (j = 0; j < key_len; j++) {
               completed[i+j] = key_start[j];
            }
            completed[i+j] = '\0';
#if DIAGNOSE_COMPLETION == 2
            t_printf("completion=%s\n", completed);
#endif
            linenoiseAddCompletion(lc, completed);
         }
         // special case - also match if the candidate is "bin/word" ...
         if ((strncmp_i(key_start, "bin/", 4) == 0)
         &&  (strncmp_i(word, key_start+4, strlen(word)) == 0)) {
#if DIAGNOSE_COMPLETION == 2
            t_printf("candidate=%s, len=%d\n", key_start, key_len);
#endif
            // the completion is not just the word, it is buf with
            // the partial word replaced with the complete word!
            for (i = 0; i < (word - buf); i++) {
               completed[i] = buf[i];
            }
            for (j = 0; j < key_len; j++) {
               completed[i+j] = key_start[j];
            }
            completed[i+j] = '\0';
#if DIAGNOSE_COMPLETION == 2
            t_printf("completion=%s\n", completed);
#endif
            linenoiseAddCompletion(lc, completed);
         }
      }
      key_start += key_len + 1;
   }
#endif
}

#endif

void ReadCmd() {
   char *line = NULL;
   int i;

   k_clear();

   fileext = 0;
   filelen = 0;

   command[0]='\0';
   keyword[0]='\0';

   while (line == NULL) {
      line = linenoise(prompt);
      if (line != NULL) {
         if (line[0] != '\0') {
            //printf("echo: '%s'\n", line);
            // add to the history
            linenoiseHistoryAdd(line);
            //save history on disk
            linenoiseHistorySave(HISTORY_FILE);
            break;
         }
         else {
            free(line);
            line = NULL;
         }
      }
   }
   for (i = 0; i < MAX_CMD_LEN; i++) {
      if (line[i] == '\0') break;
      command[i] = line[i];
   }
   command[i]='\0';
   free(line);
}

#else

void ReadCmd() {
   int i, j;
   int x, y, x_y;
   char ch;

   k_clear();

   fileext = 0;
   filelen = 0;

   command[0]='\0';
   keyword[0]='\0';

   i = 0;

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
         ch = k_wait() & 0xFF;
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

#endif

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


int TryExtension(PLOADINFO li, char *ext) {
//
// Try loading a file with the name of the keyword, 
// plus the specified extension. 
// If that doesn't work, remove the extension
//
   int len;
   int result;
  
   len = strlen((char *)keyword);
   strcpy((char *)&keyword[filelen], ext);
   if ((result = LoadClusterList(keyword, li)) != 0) {
      keyword[len] = 0;
   }
   return result;
}


int BuiltInCommand(char *keyword, char *arguments) {

   if (*keyword == '#') {
      // comment line - just ignore it!
      return 1;
   }
   if (strcmp((char *)keyword, "CLS") == 0) {
#ifdef SERIAL_HMI
#ifdef __CATALINA_VT100
      t_str("\x1b[0;0H\x1b[2J");   // VT 100 HVP + Erase Page
#else
      t_str("\f");   // form feed
#endif
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
   while (i < 8) {
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
void LuaCommandMagic(char *filename, char *arguments) {
   char lua_script[MAX_CMD_LEN + 1];
   char lua_cmd[MAX_CMD_LEN + 1];
   int result = 0;
   FIL fi;

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
   result = (f_open(&fi, lua_script, FA_READ) == FR_OK);
   if (!result) {
      // next, try opening a script with that name in the bin directory
      strcpy(lua_script, BIN_PATH);
      strcat(lua_script, (char *)filename);
      if (fileext == 0) {
         strcat(lua_script, LUAX_EXT);
      }
      result = (f_open(&fi, lua_script, FA_READ) == FR_OK);
   }

   // next, if there was no extension specified, try a non-compiled 
   // version of the name

   if (!result && !fileext) {
      // try opening a non-compiled script in the root directory
      strcpy(lua_cmd, lua);
      strcpy(lua_script, (char *)filename);
      strcat(lua_script, LUA_EXT);
      result = (f_open(&fi, lua_script, FA_READ) == FR_OK);
   
      if (!result) {
         // try opening a non-compiled script in the bin directory
         strcpy(lua_script, BIN_PATH);
         strcat(lua_script, (char *)filename);
         strcat(lua_script, LUA_EXT);
         result = (f_open(&fi, lua_script, FA_READ) == FR_OK);
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
  else {
     strncpy(prompt, DEFAULT_PROMPT, MAX_PROMPT_LEN);
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

unsigned SD_get_kilobytes();

void main() {
   FIL en;
   FIL af;
   FIL mi;
   DIR di;
   FILINFO de;
   LOADINFO li;
   int i, j;
   unsigned int len;
   char filename[32];
   char ch;
   char buff[SECTOR_SIZE];
   unsigned int size;
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
#endif
   request_t *rqst;
   int rowcol;

#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)
   int env_file = 0;
   unsigned int elen = 0;
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

   f_mount(&fs, "", 1); // force mount

#if defined(__CATALINA_P2) && !defined(__CATALINA_NO_ENV)

   // read environment from file
   
   env_file = (f_open(&en, ENV_FILE, FA_READ) == FR_OK);
   environ[elen] = 0;
   if (env_file) {
      // read a maxmium of MAX_ENV_LEN bytes
      f_read(&en, environ, MAX_ENV_LEN, &elen);
      f_close(&en);
   }
   // add 7 nulls to ensure there is a zero long at
   // the end of the environment (to terminate it)
   for (i = elen; i < elen + 7; i++) {
      environ[i] = 0;
   }
#ifdef DEBUG_ENVIRON   
   t_printf("Len = %d, Env = \"%s\"\n", elen, environ);
#endif   

   // initialize various values from environment (if present)
   initialize_environ();

#endif

#ifdef __CATALINA_liblinenoise
#if ENABLE_FILE_COMPLETION
   file_len = 0;
   initialize_file_data();
#endif
#if ENABLE_DYNAMIC_COMPLETION
   dynamic_len = 0;
#endif
#if ENABLE_FILE_COMPLETION || ENABLE_DYNAMIC_COMPLETION
   linenoiseSetCompletionCallback(completion);
#endif
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
            auto_file = (f_open(&af, auto_name, FA_READ) == FR_OK);
            // always delete the file once executed
            delete = 1;
         }
         if (auto_file == -1) {
            auto_name = AUTOFILE;
            auto_file = (f_open(&af, auto_name, FA_READ) == FR_OK);
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
            while ((read_ok = (f_read(&af, &ch, 1, &len) == FR_OK)) && (len > 0)) {
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
                  read_ok = (f_read(&af, &ch, 1, &len) == FR_OK) && (len > 0);
               }
            }
            command[i] = '\0';

#if ENABLE_SCRIPT
            // read until we find another command, or end of file
            while ((read_ok = (f_read(&af, &ch, 1, &len))) && (len > 0)) {
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
                      f_unlink(once_name); // delete file if it exists
                      more_exec = 0;   // terminate auto execute
                      command[0]='\0'; // do not execute current command
                   }
                   else {
                      t_printf("Continuing\n");
                   }
               }
               f_unlink(more_name); // delete file if it exists
               if (more_exec) {
                  if (f_open(&mi, more_name, FA_WRITE) == FR_OK) {
                     buff[0]=ch;
                     f_read(&af, &buff[1], SECTOR_SIZE-1, &size);
                     size++;
                     read_ok = 1;
                     while (read_ok) {
                        f_write(&mi, buff, size, &len);
                        read_ok = ((f_read(&af, buff, SECTOR_SIZE, &size) == FR_OK) && (size > 0));
                     }
                  }
                  f_close(&mi);
               }
            }
            if ((command[0] != '@') && (command[0] != 0)) {
               // echo the command about to be executed
               t_printf("%s\n", command);
            }
#endif

            f_close(&af);
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
               f_unlink(auto_name);
            }
#if ENABLE_SCRIPT
            if (more_exec) {
               // rename the remaining command file
               // for once-off auto execution next time
               f_rename(more_name, once_name);
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

#ifdef __CATALINA_liblinenoise
         // load history from file - the history file is a plain 
         // text file with entries are separated by newlines.
         linenoiseHistorySetMaxLen(MAX_HISTORY_LEN);
         linenoiseHistoryLoad(HISTORY_FILE);
#endif

         // display banner and prompt for a command
         t_str(CATALYST_VER);
         t_eol();
         // get the command
         ReadCmd();
         // extract keyword and arguments
         ParseCmd();
      }

      if (!BuiltInCommand(keyword, arguments)) {
#if ENABLE_LUA
         LuaCommandMagic(keyword, arguments);
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
         if ((result = LoadClusterList(keyword, &li)) == 0) {
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
         else if (fileext == 0) {
            if (TryExtension(&li, BIN_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
            else if (TryExtension(&li, XMM_EXT) == 0) {
               loaded = 1;
               file_mode = 5;
            }
            else if (TryExtension(&li, LMM_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
#ifdef __CATALINA_P2
            else if (TryExtension(&li, BIX_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
#else
            else if (TryExtension(&li, SMM_EXT) == 0) {
               loaded = 1;
               file_mode = 6;
            }
#endif
         }
         if (loaded) {

            f_unmount("");

            //t_printf("SD size = %dkb\n", SD_get_kilobytes());

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
               while ((i < MAX_FLIST_SIZE) && (li.List[i] != 0xFFFFFFFFUL)) {
                  *list = (long)li.List[i];
#else
               short *list = (short *)FLIST_ADDRESS;
               while ((i < MAX_FLIST_SIZE) && (li.List[i] != 0xFFFFFFFFUL)) {
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
