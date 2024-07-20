/*
 * Help - display a help message, tailored for this platform.
 *
 */

#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <prop.h>
#include <hmi.h>

#include "catalyst.h"                 // most configuration options now here!

static int rows = 0;
static int cols = 0;

static int colcount = 0;
static int rowcount = 0;

static int aborted = 0;

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
   if (colcount > 0) {
      t_eol();
      colcount = 0;
      rowcount += 1;
   }
   t_str("Continue? (ESC exits) ...");
   k = k_wait();
   t_eol();
   aborted = (k == 0x1b);
   return aborted;
}

/* We are about to output 'count' rows - if this would make the top of 
 * the current page scroll off the screen, prompt to continue first.
 * Sets aborted to 1 if ESCAPE is pressed.
 */
void increment_rowcount(int count) {

   if (rowcount + count + 1 > rows) {
      press_key_to_continue();
      rowcount = count;
   }
   else {
      rowcount += count;
   }
   return;
}

/* We are about to output 'count' cols - if this would exceed the screen
 * width, then reset the column count and increment the row count.
 * Sets aborted to 1 if ESCAPE is pressed.
 */
void increment_colcount(int count) {

   if (colcount + count + 1 > cols) {
      increment_rowcount(1);
      t_eol();
   }
   colcount += count;
   return;
}

void output_line(char *text) {
   increment_colcount(strlen(text));
   t_str(text);
   increment_rowcount((strlen(text) + cols - 1)/cols);
}

void main() {
   int rowcol;

#ifndef SERIAL_HMI
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

   output_line(CATALYST_VER);
   rowcount = 1;
   t_eol();
   output_line("Catalyst can be used to load and run");
   output_line("programs from the / or BIN directory of");
#if ENABLE_FAT32
   output_line("a FAT16/32 SD card. Enter the filename");
#else
   output_line("a FAT16 SD card. Enter the filename");
#endif
   output_line("and any parameters. If no extension is");
#if ENABLE_LUA
   output_line("specified then '.LUX' and '.LUA' are");
   output_line("tried first. Then the following:");
#else
   output_line("specified then the following are tried:");
#endif
#if __CATALINA_P2
   output_line("'.BIN' then '.BIX'");
#else
   output_line("'.BIN' then '.XMM', '.SMM', '.LMM'.");
#endif
#if ENABLE_CPU
   output_line("On multi-CPU systems, specify CPU by");
   output_line("typing SHIFT+CPU (e.g. SHIFT+1 is '!')");
#endif   
   output_line("The following are built-in commands:");
   output_line("   CLS    clear the screen");
   output_line("   HELP   display this help");
   t_eol();

#ifdef SERIAL_HMI
   // allow some time for characters to be sent out before terminating
   msleep(250);
#else
   if (!aborted) {
      // wait for the user to press a key before terminating
      press_key_to_continue();
   }
#endif    
}
