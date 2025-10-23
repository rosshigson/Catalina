/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    UNEXPECTED = 258,              /* UNEXPECTED  */
    BAD_DECIMAL = 259,             /* BAD_DECIMAL  */
    NL = 260,                      /* NL  */
    SEMI_COLON = 261,              /* SEMI_COLON  */
    LBRACE = 262,                  /* LBRACE  */
    RBRACE = 263,                  /* RBRACE  */
    LBOX = 264,                    /* LBOX  */
    RBOX = 265,                    /* RBOX  */
    COMMA = 266,                   /* COMMA  */
    IO_OUT = 267,                  /* IO_OUT  */
    COPROCESS_OUT = 268,           /* COPROCESS_OUT  */
    ASSIGN = 269,                  /* ASSIGN  */
    ADD_ASG = 270,                 /* ADD_ASG  */
    SUB_ASG = 271,                 /* SUB_ASG  */
    MUL_ASG = 272,                 /* MUL_ASG  */
    DIV_ASG = 273,                 /* DIV_ASG  */
    MOD_ASG = 274,                 /* MOD_ASG  */
    POW_ASG = 275,                 /* POW_ASG  */
    QMARK = 276,                   /* QMARK  */
    COLON = 277,                   /* COLON  */
    OR = 278,                      /* OR  */
    AND = 279,                     /* AND  */
    MATCH = 280,                   /* MATCH  */
    EQ = 281,                      /* EQ  */
    NEQ = 282,                     /* NEQ  */
    LT = 283,                      /* LT  */
    LTE = 284,                     /* LTE  */
    GT = 285,                      /* GT  */
    GTE = 286,                     /* GTE  */
    CAT = 287,                     /* CAT  */
    GETLINE = 288,                 /* GETLINE  */
    PLUS = 289,                    /* PLUS  */
    MINUS = 290,                   /* MINUS  */
    MUL = 291,                     /* MUL  */
    DIV = 292,                     /* DIV  */
    MOD = 293,                     /* MOD  */
    NOT = 294,                     /* NOT  */
    UMINUS = 295,                  /* UMINUS  */
    IO_IN = 296,                   /* IO_IN  */
    PIPE = 297,                    /* PIPE  */
    COPROCESS = 298,               /* COPROCESS  */
    POW = 299,                     /* POW  */
    INC_or_DEC = 300,              /* INC_or_DEC  */
    DOLLAR = 301,                  /* DOLLAR  */
    LPAREN = 302,                  /* LPAREN  */
    RPAREN = 303,                  /* RPAREN  */
    DOUBLE = 304,                  /* DOUBLE  */
    STRING_ = 305,                 /* STRING_  */
    RE = 306,                      /* RE  */
    ID = 307,                      /* ID  */
    D_ID = 308,                    /* D_ID  */
    FUNCT_ID = 309,                /* FUNCT_ID  */
    BUILTIN = 310,                 /* BUILTIN  */
    LENGTH = 311,                  /* LENGTH  */
    FIELD = 312,                   /* FIELD  */
    PRINT = 313,                   /* PRINT  */
    PRINTF = 314,                  /* PRINTF  */
    SPLIT = 315,                   /* SPLIT  */
    MATCH_FUNC = 316,              /* MATCH_FUNC  */
    SUB = 317,                     /* SUB  */
    GSUB = 318,                    /* GSUB  */
    GENSUB = 319,                  /* GENSUB  */
    ALENGTH_FUNC = 320,            /* ALENGTH_FUNC  */
    ASORT_FUNC = 321,              /* ASORT_FUNC  */
    DO = 322,                      /* DO  */
    WHILE = 323,                   /* WHILE  */
    FOR = 324,                     /* FOR  */
    BREAK = 325,                   /* BREAK  */
    CONTINUE = 326,                /* CONTINUE  */
    IF = 327,                      /* IF  */
    ELSE = 328,                    /* ELSE  */
    IN = 329,                      /* IN  */
    DELETE = 330,                  /* DELETE  */
    a_BEGIN = 331,                 /* a_BEGIN  */
    a_END = 332,                   /* a_END  */
    EXIT = 333,                    /* EXIT  */
    ABORT = 334,                   /* ABORT  */
    NEXT = 335,                    /* NEXT  */
    NEXTFILE = 336,                /* NEXTFILE  */
    RETURN = 337,                  /* RETURN  */
    FUNCTION = 338                 /* FUNCTION  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define UNEXPECTED 258
#define BAD_DECIMAL 259
#define NL 260
#define SEMI_COLON 261
#define LBRACE 262
#define RBRACE 263
#define LBOX 264
#define RBOX 265
#define COMMA 266
#define IO_OUT 267
#define COPROCESS_OUT 268
#define ASSIGN 269
#define ADD_ASG 270
#define SUB_ASG 271
#define MUL_ASG 272
#define DIV_ASG 273
#define MOD_ASG 274
#define POW_ASG 275
#define QMARK 276
#define COLON 277
#define OR 278
#define AND 279
#define MATCH 280
#define EQ 281
#define NEQ 282
#define LT 283
#define LTE 284
#define GT 285
#define GTE 286
#define CAT 287
#define GETLINE 288
#define PLUS 289
#define MINUS 290
#define MUL 291
#define DIV 292
#define MOD 293
#define NOT 294
#define UMINUS 295
#define IO_IN 296
#define PIPE 297
#define COPROCESS 298
#define POW 299
#define INC_or_DEC 300
#define DOLLAR 301
#define LPAREN 302
#define RPAREN 303
#define DOUBLE 304
#define STRING_ 305
#define RE 306
#define ID 307
#define D_ID 308
#define FUNCT_ID 309
#define BUILTIN 310
#define LENGTH 311
#define FIELD 312
#define PRINT 313
#define PRINTF 314
#define SPLIT 315
#define MATCH_FUNC 316
#define SUB 317
#define GSUB 318
#define GENSUB 319
#define ALENGTH_FUNC 320
#define ASORT_FUNC 321
#define DO 322
#define WHILE 323
#define FOR 324
#define BREAK 325
#define CONTINUE 326
#define IF 327
#define ELSE 328
#define IN 329
#define DELETE 330
#define a_BEGIN 331
#define a_END 332
#define EXIT 333
#define ABORT 334
#define NEXT 335
#define NEXTFILE 336
#define RETURN 337
#define FUNCTION 338

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 75 "parse.y"

CELL *cp ;
SYMTAB *stp ;
int  start ; /* code starting address as offset from code_base */
PF_CP  fp ;  /* ptr to a (print/printf) or (sub/gsub) function */
BI_REC *bip ; /* ptr to info about a builtin */
FBLOCK  *fbp  ; /* ptr to a function block */
ARG2_REC *arg2p ;
CA_REC   *ca_p  ;
int   ival ;
PTR   ptr ;

#line 246 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
