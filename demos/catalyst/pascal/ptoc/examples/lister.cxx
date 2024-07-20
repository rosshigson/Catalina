#include "ptoc.h"

/************************************************/
/*                                                */
/* Turbo List Demo                                */
/* Copyright (c) 1985,90 by Borland International */
/*                                                */
/************************************************/


/*
          SOURCE LISTER DEMONSTRATION PROGRAM

   This is a simple program to list your TURBO PASCAL source programs.

   PSEUDO CODE
   1.  Find Pascal source file to be listed
   2.  Initialize program variables
   3.  Open main source file
   4.  Process the file
       a.  Read a character into line buffer until linebuffer full or eoln;
       b.  Search line buffer for include file.
       c.  If line contains include file command:
             Then process include file and extract command from line buffer
             Else print out the line buffer.
       d.  Repeat step 4.a thru 4.c until Eof(main file);

   INSTRUCTIONS
   1. Compile and run the program:
       a. In the Development Environment load LISTER.PAS and
          press ALT-R R.
       b. From the command line type TPC LISTER.PAS (then type
          LISTER to run the program)
   2. Specify the file to print.
*/

#include "printer.h"


const integer pagewidth = 80;
const integer printlength = 55;
const integer pathlength = 65;
const char formfeed = '\14';
const integer verticaltablength = 3;

typedef varying_string<126> workstring;
typedef varying_string<pathlength> filename;

integer currow;
filename mainfilename;
text mainfile;
varying_string<5> search1,
search2,
search3,
search4;

  void initialize()
  {
    currow = 0;
    search1 = string("{$")+'I';    /* different forms that the include compiler */
    search2 = string("{$")+'i';    /* directive can take. */
    search3 = string("(*$")+'I';
    search4 = string("(*$")+'i';
  }   /*initialize*/

  boolean open(text& fp, filename name)
  {
    boolean open_result;
    assign(fp,name);
    /*$I-*/
    reset(fp);
    /*$I+*/
    open_result = ioresult == 0;
    return open_result;
  }   /* Open */

  void openmain()
  {
    if (paramcount == 0) 
    {
      output << "Enter filename: ";
      input >> mainfilename >> NL;
    }
    else
      mainfilename = paramstr(1);

    if ((mainfilename == "") || ! open(mainfile,mainfilename)) 
    {
      output << "ERROR:  file not found (" << mainfilename << ')' << NL;
      exit(1);
    }
  }   /*Open Main*/

  void verticaltab()
  {
      integer i;

    for( i = 1; i <= verticaltablength; i ++) lst << NL;
  }   /*vertical tab*/

  void processline(workstring printstr)
  {
    currow = succ(integer,currow);
    if (length(printstr) > pagewidth)  currow += 1;
    if (currow > printlength) 
    {
      lst << formfeed;
      verticaltab();
      currow = 1;
    }
    lst << printstr << NL;
  }   /*Process line*/

  void processfile();


static boolean includein(workstring& curstr)
{
  char chkchar;
  integer column;

  boolean includein_result;
  chkchar = '-';
  column = pos(search1,curstr);
  if (column != 0) 
    chkchar = curstr[column+3];
  else
  {
    column = pos(search3,curstr);
    if (column != 0) 
      chkchar = curstr[column+4];
    else
    {
      column = pos(search2,curstr);
      if (column != 0) 
        chkchar = curstr[column+3];
      else
      {
        column = pos(search4,curstr);
        if (column != 0) 
          chkchar = curstr[column+4];
      }
    }
  }
  if (set::of('+','-', eos).has(chkchar))  includein_result = false;
  else includein_result = true;
  return includein_result;
}   /* IncludeIn */

  static void processincludefile(workstring& incstr, workstring& linebuffer);


static workstring parse(workstring incstr, integer& namestart, integer& nameend)
{
  workstring parse_result;
  namestart = pos("$I",incstr)+2;
  while (incstr[namestart] == ' ') 
    namestart = succ(integer,namestart);
  nameend = namestart;
  while ((! (set::of(' ','}','*', eos).has(incstr[nameend])))
       && ((nameend - namestart) <= pathlength)) 
    nameend += 1;
  nameend -= 1;
  parse_result = copy(incstr,namestart,(nameend-namestart+1));
  return parse_result;
}   /*Parse*/



static void processincludefile(workstring& incstr, workstring& linebuffer)

{
    integer namestart, nameend;
    text includefile;
    filename includefilename;

       /*Process include file*/
  includefilename = parse(incstr, namestart, nameend);

  if (! open(includefile,includefilename)) 
  {
    linebuffer = string("ERROR:  include file not found (") +
                  includefilename + ')';
    processline(linebuffer);
  }
  else
  {
    while (! eof(includefile)) 
    {
      includefile >> linebuffer >> NL;
      /* Turbo Pascal 6.0 allows nested include files so we must
             check for them and do a recursive call if necessary */
      if (includein(linebuffer)) 
        processincludefile(linebuffer, linebuffer);
      else
        processline(linebuffer);
    }
    close(includefile);
  }
}   /*Process include file*/

  void processfile()
  /* This procedure displays the contents of the Turbo Pascal program on the */
  /* printer. It recursively processes include files if they are nested.     */

  {
    workstring linebuffer;

         /*Process File*/
    verticaltab();
    output << "Printing . . . " << NL;
    while (! eof(mainfile)) 
    {
      mainfile >> linebuffer >> NL;
      if (includein(linebuffer)) 
         processincludefile(linebuffer, linebuffer);
      else
         processline(linebuffer);
    }
    close(mainfile);
    lst << formfeed;     /* move the printer to the beginning of the next */
                         /* page */
  }   /*Process File*/

int main(int argc, const char* argv[])
{
  pio_initialize(argc, argv);
  initialize();      /* initialize some global variables */
  openmain();        /* open the file to print */
  processfile();     /* print the program */
  return EXIT_SUCCESS;
}
