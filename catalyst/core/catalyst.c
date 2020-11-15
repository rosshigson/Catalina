/*
 * Catalyst - an SD card program loader for Catalina
 *
 * P1 NOTES (for P2 notes, see below):
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
 * 2. Set the symbol WINDOWS_EOL in catalyst.h to 1 for Windows style line
 *    termination (CRLF) instead of UNIX style line termination for (LF).
 *    This will also apply to all catalyst utilities.
 *
 * 3. Set the symbols AUTOXEC to 1 to enable the auto-execution of a command
 *    file on startup, and the symbol AUTODELETE to 1 to automatically delete
 *    this file after execution.
 *
 * 4. Set the symbol ENABLE_FAT32 to 1 support the FAT32 file system (note
 *    this also has to be defined in the Catalina_XMM_SD_Loader.spin file to
 *    work correclty!). Otherwise only FAT16 is supported. There is probably
 *    no reason to ever change this, unless you need to load Hub programs
 *    that are larger than allowable using the FAT32 support (see the XMM SD
 *    Loader for more details).
 *
 * 5. The CAT command is now an external command - this saves some RAM, which
 *    has been used to allow the DIR command (which is still internal) to
 *    accept a path parameter - so DIR can now list any directory. However,
 *    DIR is still non-recursive. For that, use the external LS command.
 *
 * 6. When compiled to use the Cache and/or FLASH, memory limitations mean 
 *    that Catalyst cannot support the HIRES_VGA HMI option.
 *
 * 7. Note that when compiling Catalina and its utilities to use FLASH
 *    with the 'build_all' batch file, you may see a warning message that 
 *    "FLASH is incompatible with current layout - ignoring". This is 
 *    because the simpleminded build script compiles the XMM loader 
 *    (which needs the FLASH code) and the Catalyst program and utilities
 *    (which  don't) using the same options. You can ignore this warning.
 *
 * P2 NOTES:
 * 
 * 1. Only .BIN and .BIX programs loaded from SD Card to Hub RAM are
 *    currently supported. No loading other CPUs, and no XMM, EEPROM or
 *    FLASH loading. 
 */

#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <propeller.h>
#include <catalina_hmi.h>
#include <catalina_fs.h>

#include "catalyst.h"

#define LINE_LEN 80

#define CATALYST_VER "Catalyst 4.5"   // Banner string
#define AUTOEXEC     1                // 1 = execute cmd read from AUTOFILE
#define AUTODELETE   0                // 1 = delete AUTOFILE after execution
#define AUTOFILE     "AUTOEXEC.TXT"   // enable auto-execution of this file
#define BIN_PATH     "/bin/"          // bin directory prefix
#define MAX_CMD_LEN  128              // length of command line

#define ENABLE_FAT32 1                // 1 = support FAT32 (0 = FAT16 only)

#ifdef __CATALINA_P2

#define INTERNAL_CAT 0                // 1 = CAT cmd is external, 1 = internal

#ifndef __CATALINA_DISABLE_MULTI_CPU
#define __CATALINA_DISABLE_MULTI_CPU  // no multi-CPU support on P2
#endif

#define BIX_EXT      ".BIX"

#else

#define INTERNAL_CAT 0                // 0 = CAT cmd is external, 1 = internal

#define LMM_EXT      ".LMM"
#define SMM_EXT      ".SMM"
#define XMM_EXT      ".XMM"

#endif

#define BIN_EXT      ".BIN"


// debugging - note that using these options will reduce the size of 
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

int rowcount;

int rows;
int cols;

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
 * Prompt for a key to continue - return TRUE if ESC is the key
 */
   t_str("Press a key to continue (or ESC to exit) ...");
   k = k_wait();
   t_eol();
   return (k == 0x1b);
}

/*
 * Load the cluster list of the file whose name is in filename, storing up
 * to MAX_FLIST_SIZE words starting at FLIST_ADDRESS - if there are less
 * than MAX_FLIST_SIZE longs then the list is terminated with $FFFF.
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
      if (cpu_to_load != 0) {
         t_str("CPU ");
         t_integer(1, cpu_to_load);
      }
      t_str("> ");
      while (i < MAX_CMD_LEN) {
         ch = (uint8_t) k_wait() & 0xFF;
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
         else if ((ch == 8) || (ch == 127)) { // BS or DEL
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
               t_eol();
               command[i] = '\0';
               break;
            }
            else if (i < MAX_CMD_LEN) {
               command[i++] = ch;
            }
            t_ch(ch);
         }
      }
   }
}


void ParseCmd() {
   int i = 0;

   arguments = NULL;

   while ((command[i] == ' ') && (command[i] != '\0')) {
      i++;
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
   arguments = &command[i];

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


void DoHelp(PVOLINFO vi, uint8_t *arguments) {
   t_eol();
   t_strln(CATALYST_VER);
   t_strln("This program is used to load and run");
   t_strln("programs from the root directory of a");
   t_strln("FAT16/32 SD card. Enter the filename");
   t_strln("and any parameters. If no extension is");
   t_strln("specified then '.BIN' is assumed.");
#ifndef __CATALINA_DISABLE_MULTI_CPU
   t_strln("On multi-CPU systems, specify CPU by");
   t_strln("typing SHIFT+CPU (e.g. SHIFT+1 is '!')");
#endif   
   t_strln("The following are built-in commands:");
#if INTERNAL_CAT
   t_strln("   CAT    display a text file");
#endif   
   t_strln("   CLS    clear the screen");
   t_strln("   DIR    display a directory listing");
   t_strln("   HELP   display this help");
}


void DoCls(PVOLINFO vi, uint8_t *arguments) {
#ifdef SERIAL_HMI
    t_ch(0x1b);
    t_str("[1;1H");              // VT 100 Cursor Home
    t_ch(0x1b);
    t_str("[2J");                // VT 100 Erase Page
    t_ch(0x1b);
    t_str("[1;1H");              // VT 100 Cursor Home
#else
    t_scroll(rows-1, 0, rows-1);
    t_setpos(1, 0, 0) ;
#endif
}


void DoDir(PVOLINFO vi, uint8_t *arguments) {
   
//
// Display the root directory of the SD card.
//
   uint8_t sector[SECTOR_SIZE];
   DIRINFO di;
   DIRENT de;
   int i, j, k;
   int done = 0;
   char ch;
   uint8_t dummy[1] = "";
   int col = cols/13;
   int row = rows;
   int header = 2;

   t_str("Directory \"");
   t_str((char *)arguments);
   t_strln("\"");

   if (col == 0) {
      col = 3;
   }
   for (i = 0; i < col; i++) {
      t_str("------------ ");
   }
   t_eol();

   j = 0;
   k = header;
   di.scratch = sector;
   if (strcmp((char*)arguments, ".") == 0) {
      // don't understand "." - so use "" instead
      arguments = dummy;
   }
   if (DFS_OpenDir(vi, arguments, &di) == DFS_OK) {
      while (!done) {
         while (!done && (j < col)) {
            if (DFS_GetNext(vi, &di, &de) == DFS_OK) {
               if (de.name[0] != 0) {
                  i = 0;
                  while (i < 11) {
                     if (i == 8) {
                        if (strncmp((char *)&de.name[8],"   ", 3) != 0) {
                           t_ch('.');
                        }
                        else {
                           t_ch(' ');
                        }
                     }
                     if (de.name[i] != 0) {
                        t_ch(de.name[i]);
                        i++;
                     }
                     else {
                        break;
                     }
                  }
                  while (i < 12) {
                     if (i == 8) {
                        if (strncmp((char *)&de.name[8],"   ", 3) != 0) {
                           t_ch('.');
                        }
                        else {
                           t_ch(' ');
                        }
                     }
                     t_ch(' ');
                     i++;
                  }
                  j++;
               }
            }
            else {
               done = 1;
            }
         }
         t_eol();
         j = 0;
         k++;         
         if (!done && (k >= row - 1)) {
            k = 0;
            t_str("Press a key to continue ...");
            if ((ch = k_wait()) == 0x1b) {
               done = 1;
            }
            else {
               t_eol();
            }
         }
      }
   }
   else {
      t_str("Cannot open directory ");
      t_strln((char *)arguments);
   }
}

#if INTERNAL_CAT

/* 
 * we are about to output 'count' rows - if this would make the top of 
 * the current page scroll off the screen, prompt to continue first
 * return TRUE if ESCAPE was pressed.
 */
int increment_rowcount(int count) {
   int result = 0;

   if (rowcount + count + 1 > rows) {
      result = press_key_to_continue();
      rowcount = count;
   }
   else {
      rowcount += count;
   }
   return result;
}


void DoCat(PVOLINFO vi, uint8_t *arguments) {
   int my_file;
   FILEINFO my_info;
   char line_in[LINE_LEN + 1];
   char line_out[LINE_LEN + 1];
   int count;
   char ch;
   int i, j;
   int stop = 0;

   if ((my_file = _open_unmanaged((const char *)arguments, 0, &my_info)) != -1)
   {
      j = 0;
      while (((count = _read(my_file, line_in, LINE_LEN))) > 0) {
         for (i = 0; i < count; i++) {
            ch = (line_out[j++] = line_in[i]);
            if ((ch == 0x0a) || (j >= cols)) {
               line_out[j] = '\0';
               t_str(line_out);
               j = 0;
               stop = increment_rowcount(1);
            }
            if (stop) {
               break;
            }
         }
         if (stop) {
            break;
         }
      }
      if (j > 0) {
         line_out[j] = '\0';
         t_str(line_out);
         j = 0;
         stop = increment_rowcount(1);
      }
      t_eol();
      _close_unmanaged(my_file);
   }
   else {
      t_eol();
      t_strln("Cannot open file for read");
   }
}

#endif   

int BuiltInCommand(PVOLINFO vi, uint8_t *keyword, uint8_t *arguments) {
   if (strcmp((char *)keyword, "HELP") == 0) {
      DoHelp(vi, arguments);
      return 1;
   }
   else if (strcmp((char *)keyword, "CLS") == 0) {
      DoCls(vi, arguments);
      return 1;
   }
#if INTERNAL_CAT
   else if (strcmp((char *)keyword, "CAT") == 0) {
      DoCat(vi, arguments);
      return 1;
   }
#endif 
   else if (strcmp((char *)keyword, "DIR") == 0) {
      DoDir(vi, arguments);
      return 1;
   }
   return 0;
}


int main()
{

   uint8_t sector[SECTOR_SIZE];
   uint32_t pstart, psize;
   uint8_t pactive, ptype;
   VOLINFO vi;
   FILEINFO fi;
   DIRINFO di;
   DIRENT de;
   LOADINFO li;
   int i, j;
   uint8_t filename[32];
   char ch;
   int result = 0;
   int loaded = 0;
   int stop_cogstore = 0;
   int type = 0;
   int read_ok = 0;
   int auto_exec = AUTOEXEC;
   int auto_file = 0;
   request_t *rqst;
   int rowcol;

#ifdef SERIAL_HMI
   rows = 0;
   cols = 0;
#else
   rowcol = t_geometry();
   cols = (rowcol >> 8) & 0xFF;
   rows = rowcol & 0xFF;
#endif   

   if (rows == 0) {
      rows = 24;
   }
   if (cols == 0) {
      cols = 80;
   }

   rowcount = 1;

   pstart = DFS_GetPtnStart(0, sector, 0, &pactive, &ptype, &psize);
   DFS_GetVolInfo(0, sector, pstart, &vi);

   while(1) {

      loaded = 0;
      file_mode = 0;
      cpu_to_load = 0;
      StartCogStore();

      if (auto_exec) {
         if ((auto_file = _open_unmanaged(AUTOFILE, 0, &fi)) != -1) {
            i = 0;
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
               }
               read_ok = (_read(auto_file, &ch, 1) > 0);
            }
            command[i] = '\0';
            _close_unmanaged(auto_file);
            if (strlen((char *)command) == 0) {
               // no command found in file
               auto_exec = 0;
            }
            else {
               // extract keyword and arguments
               ParseCmd();
            }
            if (AUTODELETE) {
               // delete the autofile
               _unlink(AUTOFILE);
            }
         }
         else {
            auto_exec = 0;
         }
      }

      if (!auto_exec) {
         // display banner and prompt for a command
         t_eol();
         t_str(CATALYST_VER);
         t_eol();
         // get the command
         ReadCmd();
         // extract keyword and arguments
         ParseCmd();
      }

      if (!BuiltInCommand(&vi, keyword, arguments)) {
         if (!(stop_cogstore = (arguments == NULL))) {
            // we have arguments - write them to CogStore
            WriteCogStore(command);
         }
         if (stop_cogstore) {
            // this is not a built-in command, and we have no arguments,
            // so stop cogstore in case it interferes with non-Catalyst
            // programs that do not expect any arguments
            StopCogStore();
         }
         if ((result = LoadClusterList(&vi, keyword, &li)) == 0) {
            loaded = 1;
#ifdef __CATALINA_P2
            file_mode = 0;
#else
            if ((fileext == 0) || (filelen < 5)) {
               file_mode = 0;
            }
            else if (strcmp((char *)&keyword[filelen-4], XMM_EXT) == 0) {
               file_mode = 5;
            }
            else if (strcmp((char *)&keyword[filelen-4], SMM_EXT) == 0) {
               file_mode = 6;
            }
            else {
               file_mode = 0;
            }
#endif
         }
         else if ((fileext == 0 && filelen <= 8)) {
            if (TryExtension(&vi, &li, BIN_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
#ifdef __CATALINA_P2
            else if (TryExtension(&vi, &li, BIX_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
#else
            else if (TryExtension(&vi, &li, XMM_EXT) == 0) {
               loaded = 1;
               file_mode = 5;
            }
            else if (TryExtension(&vi, &li, SMM_EXT) == 0) {
               loaded = 1;
               file_mode = 6;
            }
            else if (TryExtension(&vi, &li, LMM_EXT) == 0) {
               loaded = 1;
               file_mode = 0;
            }
#endif
         }
         if (loaded) {
            // the order of actions is important here - first, we must
            // shut down all extraneous cogs since they may be using
            // the area we need to use to build the cluster list
            for (i = 0; i < 8; i++) {
               type = REGISTERED_TYPE(i);
               rqst = REQUEST_BLOCK(i);
               if ((type != LMM_VMM) && (type != LMM_FIL) && (type != LMM_NUL)) {
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

#ifndef __USING_CACHE // currently can't use serial loader AND the cache

            // now start the SIO cog (used for Multi-CPU Loaders)
            StartSIO();
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
      auto_exec = 0; // only ever try autoexecuting once
   }

   return 0;
}
