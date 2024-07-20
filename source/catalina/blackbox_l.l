%{

/*
 * Blackbox_l - A flex parser for BlackBox. Used to parse .dbg files.
 *
 * version 2.4 - initial release (to coincide with Catalina 2.4)
 * 
 * version 2.5 - allow '?'
 *
 * version 3.0.3 - standardize on y.tab.h for both Linux and Windows
 * 
 * version 3.14 - allow <anon> in place of identifier
 *
 */

/*--------------------------------------------------------------------------
    This file is part of Catalina.

    Copyright 2009 Ross Higson

    Catalina is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Catalina is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Catalina.  If not, see <http://www.gnu.org/licenses/>.

  -------------------------------------------------------------------------- */
#include "ctype.h"

//#ifdef __linux__

#include "y.tab.h"

//#else /* windows */

//#include "y_tab.h"

//#endif

void yyerror (char *s);

%}

%%

^"RELOC"              return RELOC;
^"SOURCE"             return SOURCE;
^"INCSRC"             return INCSRC;
^"TYPEDEF"            return TYPEDEF;
^"GLOBFILE"           return GLOBFILE;
^"GLOBVAR"            return GLOBVAR;
^"LOCVAR"             return LOCVAR;
^"LINENUM"            return LINENUM;
^"FRAMED"             return FRAMED;
^"NOFRAME"            return NOFRAME;


"static"              return STATIC;
"struct"              return STRUCT;
"union"               return UNION;
"array"               return ARRAY;
"enum"                return ENUM;
"func"                return FUNC;

<<EOF>>               {
                         yyterminate();
                      }

=====[^\n]*\n         {
                         yylval.a_string = strdup(yytext+5);
                         //printf("found errmsg \"%s\"\n", yylval.a_string);
                         return errmsg;
                      }

\"[^"\n]*["\n]        {
                         yylval.a_string = strdup(yytext+1);
                         if (yylval.a_string[yyleng-2] != '"') {
                            printf("improperly terminated string\n");
                         }
                         else {
                            yylval.a_string[yyleng-2] = 0;
                         }
                         //printf("found string \"%s\"\n", yylval.a_string);
                         return string;
                      }

[A-Za-z_][A-Za-z0-9_]* {
                         yylval.a_string = strdup(yytext);
                         //printf("found identifier %s\n", yylval.a_string);
                         return identifier;
                      }

"<anon>"              {
                         yylval.a_string = strdup(yytext);
                         //printf("found anon identifier\n");
                         return identifier;
                      }

0x[A-Fa-f0-9]*        {
                         sscanf(yytext+2, "%x", &yylval.a_number); 
                         //printf("found qualified hex %x\n", yylval.a_number);
                         return number;
                      }

0[A-Fa-f0-9]*         {
                         sscanf(yytext, "%x", &yylval.a_number); 
                         //printf("found unqualified hex %x\n", yylval.a_number);
                         return number;
                      }

[1-9][0-9]*           {
                         yylval.a_number = atoi(yytext); 
                         //printf("found dec %d\n", yylval.a_number);
                         return number;
                      }

[ \t\n\r]             ; /* ignore whitespace */

[\[\](),*\.\-\|{}\?]  {
                         return yytext[0];
                      }

"@ FP"                return AT_FP;

"@"                   return AT;

.                     {
                         //ECHO; 
                         char msg[40];
                         if (isprint(yytext[0])) {
                            sprintf(msg, "unexpected character in dbg file '%c'", yytext[0]);
                         }
                         else {
                            sprintf(msg, "unexpected character in dbg file 0x%2X", yytext[0]);
                         }
                         yyerror (msg);
                      }

%%

int yywrap (void) {
   return 1;
}
