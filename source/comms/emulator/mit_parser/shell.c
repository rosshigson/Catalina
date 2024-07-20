/* Monitor for the parser */

#include <stdio.h>
/* #include <conio.h> */
#include <stdlib.h>
/* #include <search.h> */ /* RJH : removed */
#include "vt420.h"

PS ps;

struct CmndName
{
  int command;
  char *name;
} cmndtbl[] =
{
#include "vtdebug.tbl"
};

#define MAXBUF 20

#define iOpt1 args[0]
#define iOpt2 args[1]

char buffer[MAXBUF];
int count;                           

int cmpint( int *a, int *b )
{
  return *a - *b;
}

void PASCAL ProcessAnsi( const LPSES pSesptr, int iCode, LPARGS args ) /* RJH : modified for GNAT compiler */
{                 
  struct CmndName curcmnd;
  struct CmndName *pcmnd;
  int i;
  char *apoint;
                         
  if( iCode < 0 ){
    printf( "\a\n*****ERROR*****  Internal Command %d has been passed!\n\a", iCode );
/*    printf( "\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a" ); */
    exit(1);
  }    
  else if( iCode < 256 )
    printf("%c", iCode);
  else{
    curcmnd.command = iCode;                                 
    if( ( pcmnd = (struct CmndName *)bsearch( (char *)&curcmnd, (char *)cmndtbl, 
                sizeof( cmndtbl ) / sizeof( cmndtbl[0] ), sizeof( cmndtbl[0] ),
                (int (*)(const void*, const void*))cmpint ) ) != NULL ){
      printf( "\nFunction# %d  \t%s\n", iCode, pcmnd->name );
      for( i = 0 ; i < VTARGS ; i++ )
        printf( "Arg[%d] = %d\t", i, args[i]);
      printf( "\n" );
      
      INTSTOPOINTER( apoint, args[2], args[3] );
/*      
      if( (args[0] == -1) && (args[1] != -1) )
        printf( "The string is: '%s'", apoint );
*/

    }
    else
      printf( "\a\n*****ERROR**** UNKNOWN FUNCTION# %d  \tArg1: %d  \tArg2: %d\n", iCode, iOpt1, iOpt2 );
  }
}

int main( void ) /* RJH : modified for GNAT compiler */
{
  char ch = '\0';
  
  ps = InitializeParser();
  
  /*  vterrorchar = -300; */ /* Induce error #-300 if unknown sequence */
  ps->vterrorchar = DO__IGNORE;
  ps->dumperror = FALSE;

  while( ch != '\377' ){
    count = 0;
    while( ( count < MAXBUF ) &&
      ( ( buffer[count++] = ch = getchar() /* _getch */ ) != '\377' ) )
      ;
    ParseAnsiData( ps, NULL, buffer, count );
  };  
}
