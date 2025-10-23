/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 30 "parse.y"

#include <stdio.h>
#include "awka.h"
#include "symtype.h"
#include "code.h"
#include "memory.h"
#include "bi_funct.h"
#include "bi_vars.h"
#include "jmp.h"
#include "field.h"
#include "files.h"


#define  YYMAXDEPTH        200


extern void  PROTO( eat_nl, (void) ) ;
static void  PROTO( resize_fblock, (FBLOCK *) ) ;
static void  PROTO( switch_code_to_main, (void)) ;
static void  PROTO( code_array, (SYMTAB *) ) ;
static void  PROTO( code_call_id, (CA_REC *, SYMTAB *) ) ;
static void  PROTO( field_A2I, (void)) ;
static void  PROTO( check_var, (SYMTAB *) ) ;
static void  PROTO( check_array, (SYMTAB *) ) ;
static void  PROTO( RE_as_arg, (void)) ;

static int scope ;
static FBLOCK *active_funct ;
      /* when scope is SCOPE_FUNCT  */

#define  code_address(x)  if( is_local(x) ) \
                             code2op(L_PUSHA, (x)->offset) ;\
                          else  code2(_PUSHA, (x)->stval.cp) 

#define  CDP(x)  (code_base+(x))
/* WARNING: These CDP() calculations become invalid after calls
   that might change code_base.  Which are:  code2(), code2op(),
   code_jmp() and code_pop().
*/

/* this nonsense caters to MSDOS large model */
#define  CODE_FE_PUSHA()  code_ptr->ptr = (PTR) 0 ; code1(FE_PUSHA)


#line 116 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 348 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_UNEXPECTED = 3,                 /* UNEXPECTED  */
  YYSYMBOL_BAD_DECIMAL = 4,                /* BAD_DECIMAL  */
  YYSYMBOL_NL = 5,                         /* NL  */
  YYSYMBOL_SEMI_COLON = 6,                 /* SEMI_COLON  */
  YYSYMBOL_LBRACE = 7,                     /* LBRACE  */
  YYSYMBOL_RBRACE = 8,                     /* RBRACE  */
  YYSYMBOL_LBOX = 9,                       /* LBOX  */
  YYSYMBOL_RBOX = 10,                      /* RBOX  */
  YYSYMBOL_COMMA = 11,                     /* COMMA  */
  YYSYMBOL_IO_OUT = 12,                    /* IO_OUT  */
  YYSYMBOL_COPROCESS_OUT = 13,             /* COPROCESS_OUT  */
  YYSYMBOL_ASSIGN = 14,                    /* ASSIGN  */
  YYSYMBOL_ADD_ASG = 15,                   /* ADD_ASG  */
  YYSYMBOL_SUB_ASG = 16,                   /* SUB_ASG  */
  YYSYMBOL_MUL_ASG = 17,                   /* MUL_ASG  */
  YYSYMBOL_DIV_ASG = 18,                   /* DIV_ASG  */
  YYSYMBOL_MOD_ASG = 19,                   /* MOD_ASG  */
  YYSYMBOL_POW_ASG = 20,                   /* POW_ASG  */
  YYSYMBOL_QMARK = 21,                     /* QMARK  */
  YYSYMBOL_COLON = 22,                     /* COLON  */
  YYSYMBOL_OR = 23,                        /* OR  */
  YYSYMBOL_AND = 24,                       /* AND  */
  YYSYMBOL_MATCH = 25,                     /* MATCH  */
  YYSYMBOL_EQ = 26,                        /* EQ  */
  YYSYMBOL_NEQ = 27,                       /* NEQ  */
  YYSYMBOL_LT = 28,                        /* LT  */
  YYSYMBOL_LTE = 29,                       /* LTE  */
  YYSYMBOL_GT = 30,                        /* GT  */
  YYSYMBOL_GTE = 31,                       /* GTE  */
  YYSYMBOL_CAT = 32,                       /* CAT  */
  YYSYMBOL_GETLINE = 33,                   /* GETLINE  */
  YYSYMBOL_PLUS = 34,                      /* PLUS  */
  YYSYMBOL_MINUS = 35,                     /* MINUS  */
  YYSYMBOL_MUL = 36,                       /* MUL  */
  YYSYMBOL_DIV = 37,                       /* DIV  */
  YYSYMBOL_MOD = 38,                       /* MOD  */
  YYSYMBOL_NOT = 39,                       /* NOT  */
  YYSYMBOL_UMINUS = 40,                    /* UMINUS  */
  YYSYMBOL_IO_IN = 41,                     /* IO_IN  */
  YYSYMBOL_PIPE = 42,                      /* PIPE  */
  YYSYMBOL_COPROCESS = 43,                 /* COPROCESS  */
  YYSYMBOL_POW = 44,                       /* POW  */
  YYSYMBOL_INC_or_DEC = 45,                /* INC_or_DEC  */
  YYSYMBOL_DOLLAR = 46,                    /* DOLLAR  */
  YYSYMBOL_LPAREN = 47,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 48,                    /* RPAREN  */
  YYSYMBOL_DOUBLE = 49,                    /* DOUBLE  */
  YYSYMBOL_STRING_ = 50,                   /* STRING_  */
  YYSYMBOL_RE = 51,                        /* RE  */
  YYSYMBOL_ID = 52,                        /* ID  */
  YYSYMBOL_D_ID = 53,                      /* D_ID  */
  YYSYMBOL_FUNCT_ID = 54,                  /* FUNCT_ID  */
  YYSYMBOL_BUILTIN = 55,                   /* BUILTIN  */
  YYSYMBOL_LENGTH = 56,                    /* LENGTH  */
  YYSYMBOL_FIELD = 57,                     /* FIELD  */
  YYSYMBOL_PRINT = 58,                     /* PRINT  */
  YYSYMBOL_PRINTF = 59,                    /* PRINTF  */
  YYSYMBOL_SPLIT = 60,                     /* SPLIT  */
  YYSYMBOL_MATCH_FUNC = 61,                /* MATCH_FUNC  */
  YYSYMBOL_SUB = 62,                       /* SUB  */
  YYSYMBOL_GSUB = 63,                      /* GSUB  */
  YYSYMBOL_GENSUB = 64,                    /* GENSUB  */
  YYSYMBOL_ALENGTH_FUNC = 65,              /* ALENGTH_FUNC  */
  YYSYMBOL_ASORT_FUNC = 66,                /* ASORT_FUNC  */
  YYSYMBOL_DO = 67,                        /* DO  */
  YYSYMBOL_WHILE = 68,                     /* WHILE  */
  YYSYMBOL_FOR = 69,                       /* FOR  */
  YYSYMBOL_BREAK = 70,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 71,                  /* CONTINUE  */
  YYSYMBOL_IF = 72,                        /* IF  */
  YYSYMBOL_ELSE = 73,                      /* ELSE  */
  YYSYMBOL_IN = 74,                        /* IN  */
  YYSYMBOL_DELETE = 75,                    /* DELETE  */
  YYSYMBOL_a_BEGIN = 76,                   /* a_BEGIN  */
  YYSYMBOL_a_END = 77,                     /* a_END  */
  YYSYMBOL_EXIT = 78,                      /* EXIT  */
  YYSYMBOL_ABORT = 79,                     /* ABORT  */
  YYSYMBOL_NEXT = 80,                      /* NEXT  */
  YYSYMBOL_NEXTFILE = 81,                  /* NEXTFILE  */
  YYSYMBOL_RETURN = 82,                    /* RETURN  */
  YYSYMBOL_FUNCTION = 83,                  /* FUNCTION  */
  YYSYMBOL_YYACCEPT = 84,                  /* $accept  */
  YYSYMBOL_program = 85,                   /* program  */
  YYSYMBOL_program_block = 86,             /* program_block  */
  YYSYMBOL_PA_block = 87,                  /* PA_block  */
  YYSYMBOL_88_1 = 88,                      /* $@1  */
  YYSYMBOL_89_2 = 89,                      /* $@2  */
  YYSYMBOL_90_3 = 90,                      /* $@3  */
  YYSYMBOL_91_4 = 91,                      /* $@4  */
  YYSYMBOL_92_5 = 92,                      /* $@5  */
  YYSYMBOL_block = 93,                     /* block  */
  YYSYMBOL_block_or_separator = 94,        /* block_or_separator  */
  YYSYMBOL_statement_list = 95,            /* statement_list  */
  YYSYMBOL_statement = 96,                 /* statement  */
  YYSYMBOL_separator = 97,                 /* separator  */
  YYSYMBOL_expr = 98,                      /* expr  */
  YYSYMBOL_99_6 = 99,                      /* $@6  */
  YYSYMBOL_100_7 = 100,                    /* $@7  */
  YYSYMBOL_101_8 = 101,                    /* $@8  */
  YYSYMBOL_102_9 = 102,                    /* $@9  */
  YYSYMBOL_cat_expr = 103,                 /* cat_expr  */
  YYSYMBOL_p_expr = 104,                   /* p_expr  */
  YYSYMBOL_lvalue = 105,                   /* lvalue  */
  YYSYMBOL_arglist = 106,                  /* arglist  */
  YYSYMBOL_args = 107,                     /* args  */
  YYSYMBOL_builtin = 108,                  /* builtin  */
  YYSYMBOL_mark = 109,                     /* mark  */
  YYSYMBOL_print = 110,                    /* print  */
  YYSYMBOL_pr_args = 111,                  /* pr_args  */
  YYSYMBOL_arg2 = 112,                     /* arg2  */
  YYSYMBOL_pr_direction = 113,             /* pr_direction  */
  YYSYMBOL_if_front = 114,                 /* if_front  */
  YYSYMBOL_else = 115,                     /* else  */
  YYSYMBOL_do = 116,                       /* do  */
  YYSYMBOL_while_front = 117,              /* while_front  */
  YYSYMBOL_for1 = 118,                     /* for1  */
  YYSYMBOL_for2 = 119,                     /* for2  */
  YYSYMBOL_for3 = 120,                     /* for3  */
  YYSYMBOL_array_loop_front = 121,         /* array_loop_front  */
  YYSYMBOL_field = 122,                    /* field  */
  YYSYMBOL_split_front = 123,              /* split_front  */
  YYSYMBOL_split_back = 124,               /* split_back  */
  YYSYMBOL_re_arg = 125,                   /* re_arg  */
  YYSYMBOL_return_statement = 126,         /* return_statement  */
  YYSYMBOL_getline = 127,                  /* getline  */
  YYSYMBOL_fvalue = 128,                   /* fvalue  */
  YYSYMBOL_getline_file = 129,             /* getline_file  */
  YYSYMBOL_gensub = 130,                   /* gensub  */
  YYSYMBOL_sub_or_gsub = 131,              /* sub_or_gsub  */
  YYSYMBOL_sub_back = 132,                 /* sub_back  */
  YYSYMBOL_gensub_back = 133,              /* gensub_back  */
  YYSYMBOL_function_def = 134,             /* function_def  */
  YYSYMBOL_funct_start = 135,              /* funct_start  */
  YYSYMBOL_funct_head = 136,               /* funct_head  */
  YYSYMBOL_f_arglist = 137,                /* f_arglist  */
  YYSYMBOL_f_args = 138,                   /* f_args  */
  YYSYMBOL_outside_error = 139,            /* outside_error  */
  YYSYMBOL_call_args = 140,                /* call_args  */
  YYSYMBOL_ca_front = 141,                 /* ca_front  */
  YYSYMBOL_ca_back = 142                   /* ca_back  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int16 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  105
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1350

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  84
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  59
/* YYNRULES -- Number of rules.  */
#define YYNRULES  187
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  380

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   338


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   151,   151,   152,   155,   156,   157,   160,   166,   165,
     172,   171,   178,   177,   185,   201,   184,   214,   216,   222,
     223,   229,   230,   234,   235,   237,   239,   245,   248,   251,
     255,   261,   269,   269,   272,   273,   274,   275,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   287,   315,
     314,   322,   321,   328,   329,   328,   334,   335,   339,   341,
     343,   351,   355,   359,   360,   361,   362,   363,   364,   365,
     367,   369,   371,   374,   382,   389,   393,   400,   405,   424,
     425,   428,   430,   435,   447,   457,   460,   469,   470,   473,
     474,   478,   482,   487,   491,   492,   494,   501,   506,   510,
     514,   522,   527,   533,   553,   579,   603,   604,   608,   609,
     626,   630,   643,   648,   659,   672,   684,   701,   709,   720,
     734,   751,   753,   763,   777,   781,   785,   789,   790,   791,
     792,   793,   794,   795,   801,   805,   812,   814,   838,   848,
     856,   870,   877,   892,   915,   918,   920,   923,   926,   929,
     935,   942,   948,   953,   958,   963,   968,   975,   977,   977,
     979,   983,   991,  1010,  1013,  1032,  1033,  1037,  1042,  1046,
    1050,  1058,  1067,  1087,  1110,  1118,  1119,  1122,  1129,  1143,
    1156,  1168,  1170,  1185,  1187,  1194,  1203,  1209
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "UNEXPECTED",
  "BAD_DECIMAL", "NL", "SEMI_COLON", "LBRACE", "RBRACE", "LBOX", "RBOX",
  "COMMA", "IO_OUT", "COPROCESS_OUT", "ASSIGN", "ADD_ASG", "SUB_ASG",
  "MUL_ASG", "DIV_ASG", "MOD_ASG", "POW_ASG", "QMARK", "COLON", "OR",
  "AND", "MATCH", "EQ", "NEQ", "LT", "LTE", "GT", "GTE", "CAT", "GETLINE",
  "PLUS", "MINUS", "MUL", "DIV", "MOD", "NOT", "UMINUS", "IO_IN", "PIPE",
  "COPROCESS", "POW", "INC_or_DEC", "DOLLAR", "LPAREN", "RPAREN", "DOUBLE",
  "STRING_", "RE", "ID", "D_ID", "FUNCT_ID", "BUILTIN", "LENGTH", "FIELD",
  "PRINT", "PRINTF", "SPLIT", "MATCH_FUNC", "SUB", "GSUB", "GENSUB",
  "ALENGTH_FUNC", "ASORT_FUNC", "DO", "WHILE", "FOR", "BREAK", "CONTINUE",
  "IF", "ELSE", "IN", "DELETE", "a_BEGIN", "a_END", "EXIT", "ABORT",
  "NEXT", "NEXTFILE", "RETURN", "FUNCTION", "$accept", "program",
  "program_block", "PA_block", "$@1", "$@2", "$@3", "$@4", "$@5", "block",
  "block_or_separator", "statement_list", "statement", "separator", "expr",
  "$@6", "$@7", "$@8", "$@9", "cat_expr", "p_expr", "lvalue", "arglist",
  "args", "builtin", "mark", "print", "pr_args", "arg2", "pr_direction",
  "if_front", "else", "do", "while_front", "for1", "for2", "for3",
  "array_loop_front", "field", "split_front", "split_back", "re_arg",
  "return_statement", "getline", "fvalue", "getline_file", "gensub",
  "sub_or_gsub", "sub_back", "gensub_back", "function_def", "funct_start",
  "funct_head", "f_arglist", "f_args", "outside_error", "call_args",
  "ca_front", "ca_back", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-215)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-115)

#define yytable_value_is_error(Yyn) \
  ((Yyn) == YYTABLE_NINF)

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     438,  -215,   594,  -215,  1182,  1182,  1182,   217,  1080,  1216,
    -215,  -215,  -215,   435,  -215,  -215,  -215,  -215,   -30,   -26,
    -215,  -215,  -215,   -15,  -215,  -215,  -215,   -27,   365,  -215,
    -215,  -215,   306,  1182,   658,   169,  -215,   328,    -5,    37,
    1182,    20,    30,  -215,    35,    43,    35,    18,  -215,  -215,
    -215,  -215,  -215,    53,    55,    68,    68,    58,    28,   849,
     849,    68,    68,   849,  -215,   512,  -215,  -215,    25,  -215,
     676,   676,   676,   883,   676,  -215,  1216,    59,  -215,    95,
      61,    95,    95,    29,    79,  -215,  -215,  -215,    79,  -215,
     738,    17,   671,  -215,   104,    97,    98,  1216,  1216,   110,
     100,    35,    35,  -215,  -215,  -215,  -215,  -215,  -215,  -215,
    -215,  1216,  1216,  1216,  1216,  1216,  1216,  1216,   129,   151,
     658,  1182,  1182,  1182,  1182,  1182,   160,   162,  1182,  1216,
    1216,  1216,  1216,  1216,  1216,  1216,  1216,  1216,  1216,  1216,
    1216,  1216,  1216,  -215,  1216,  -215,  -215,  -215,  -215,  -215,
     155,   122,  1216,  1216,  -215,   148,  -215,  -215,  -215,  1216,
     917,  -215,  -215,  1216,    68,  -215,    25,  -215,    25,  -215,
    -215,  -215,    25,    68,  -215,  -215,  -215,  1250,   126,   136,
    -215,  -215,   267,  1114,  -215,   845,   196,   164,   168,   203,
     171,   210,  1216,  -215,  1216,   146,  -215,  1216,   178,  -215,
    1284,  1216,   511,   593,   179,   181,  -215,  -215,  1216,  1216,
    1216,  1216,   295,  -215,  -215,  -215,  -215,  -215,  -215,  -215,
    -215,  -215,  -215,   266,   266,    95,    95,    95,   217,   217,
     187,  1054,  1054,  1054,  1054,  1054,  1054,  1054,  1054,  1054,
    1054,  1054,  1054,  1054,  1054,   963,  -215,  1054,   224,   239,
    -215,   188,   247,   974,  -215,   225,   358,  1002,  -215,   228,
    -215,  -215,  -215,  1148,  1054,  -215,   249,    83,  -215,   676,
     214,  -215,  -215,  1015,   676,  1216,  1216,  1216,  1216,  1216,
    1054,  1054,   213,   105,  -215,   776,   749,  -215,   219,   223,
    1216,  -215,    22,  1054,  1030,    33,   226,  -215,  -215,  -215,
    1216,  1216,  -215,   227,  -215,   229,  -215,  -215,  1216,  -215,
      23,  1216,  1216,  1216,    68,  -215,  1216,  -215,  -215,   112,
     230,   120,   232,   123,  -215,   509,  -215,  -215,  -215,  -215,
     591,  -215,    34,   233,  -215,   151,  -215,   816,   777,  -215,
     234,   130,   146,  1054,  1054,  1054,  -215,  1043,   241,  -215,
    -215,  -215,  -215,  -215,   237,  -215,   257,  -215,  1216,  1216,
     217,  -215,  -215,  -215,    68,    68,   258,  -215,  1054,   805,
     268,  -215,  -215,  -215,  1182,  -215,  -215,  -215,   422,  -215
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,   179,     0,   157,     0,     0,     0,     0,     0,     0,
      58,    59,    62,    60,    85,    85,    84,   121,     0,     0,
     165,   166,   163,     0,    85,     8,    10,     0,     0,     2,
       4,     7,    12,    34,    56,     0,    72,   126,     0,   150,
       0,     0,     0,     5,     0,     0,     0,     0,    32,    33,
      87,    88,   101,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    23,     0,    21,    25,     0,    85,
       0,     0,     0,     0,     0,    29,     0,    60,    85,    70,
     126,    71,    69,     0,    77,    85,    74,    76,   122,   124,
       0,     0,   126,    73,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   173,   174,     1,     3,    14,    53,    49,
      51,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      57,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    75,     0,   136,   134,   160,   158,   159,
     151,   152,     0,     0,   171,   175,     6,    18,    26,     0,
       0,    27,    28,     0,    85,   144,     0,   146,     0,    30,
      31,   148,     0,     0,    17,    22,    24,    79,    98,     0,
     104,   108,     0,     0,   120,     0,     0,     0,     0,     0,
       0,     0,     0,    61,     0,     0,   125,     0,   183,   180,
       0,    79,     0,     0,     0,     0,     9,    11,     0,     0,
       0,     0,    48,    42,    43,    44,    45,    46,    47,   112,
      19,    13,    20,    63,    64,    65,    66,    67,   155,   153,
      68,    35,    36,    37,    38,    39,    40,    41,   127,   128,
     129,   130,   131,   132,   133,     0,   161,   143,     0,     0,
     177,     0,   176,     0,   106,    60,     0,     0,   118,     0,
     145,   147,   149,     0,    81,    89,    80,    94,    99,     0,
       0,   109,   110,     0,     0,     0,    79,     0,    79,     0,
      92,    93,     0,     0,   181,    60,     0,   182,     0,     0,
       0,   138,     0,    15,     0,    50,    52,   156,   154,   137,
       0,     0,   172,     0,   103,     0,   107,    97,     0,    91,
       0,     0,     0,     0,     0,   100,     0,   111,   105,     0,
       0,     0,     0,     0,   113,   115,   185,   187,   184,   186,
      83,   135,     0,     0,   139,     0,    54,     0,     0,   178,
       0,     0,    90,    82,    95,    96,    86,     0,   115,    83,
     114,    78,   123,   116,     0,   142,     0,    16,     0,     0,
       0,   167,   164,   119,     0,     0,     0,   140,    55,     0,
       0,   117,   102,   141,     0,   169,   162,   168,     0,   170
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -215,  -215,   243,  -215,  -215,  -215,  -215,  -215,  -215,    41,
     -73,  -215,   -52,   147,    38,  -215,  -215,  -215,  -215,  -215,
       4,     0,  -185,  -116,  -215,   199,  -215,  -215,    51,  -215,
    -215,  -215,  -215,  -215,  -215,  -215,  -215,  -215,    -4,  -215,
    -215,  -142,  -215,  -215,  -214,  -215,  -215,  -215,  -215,  -215,
    -215,  -215,  -215,  -215,  -215,  -215,  -215,  -215,  -215
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,    28,    29,    30,   101,   102,   119,   208,   335,    64,
     221,    65,    66,    67,   264,   210,   211,   209,   358,    33,
      34,    35,   265,   266,    36,    94,    69,   267,    91,   314,
      70,   269,    71,    72,    73,   183,   274,    74,    37,    38,
     146,   248,    75,    39,   150,    40,    41,    42,   362,   376,
      43,    44,    45,   251,   252,    46,   199,   200,   287
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      80,    80,    80,    87,    80,    92,   144,    86,    79,    81,
      82,   249,    89,   175,   297,   298,   288,    97,   178,   179,
     180,    98,   184,    48,    49,   103,   157,   104,   194,    80,
      48,    49,    99,   333,   194,   149,    80,   120,    32,   148,
      68,    31,     2,   145,   151,   354,   108,    90,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   110,   111,   112,
     113,   114,   115,   116,   117,   195,    32,   152,   -85,    31,
     334,   342,    92,    48,    49,     8,    83,   153,   147,   188,
     164,   283,   355,     8,    83,   154,    17,   156,   -85,    84,
     155,   320,    85,   322,    17,   312,   313,   166,   168,   118,
     159,   172,   160,    68,    93,   163,   143,   118,    68,    68,
      68,   182,    68,   197,   185,   325,   311,    80,    80,    80,
      80,    80,   348,   311,    80,   223,   224,   225,   226,   227,
     350,   311,   230,   352,   311,   202,   203,   126,   127,   128,
     364,   311,   206,   207,   198,   201,   370,   205,   332,   212,
     213,   214,   215,   216,   217,   218,    48,    49,     2,   319,
     220,   321,   204,   323,  -115,  -115,   128,   231,   232,   233,
     234,   235,   236,   237,   238,   239,   240,   241,   242,   243,
     244,   219,   245,   129,   130,   131,   132,   133,   134,   135,
     247,   247,   341,   228,   158,   229,   246,   253,   256,   268,
     250,   257,   161,   162,   270,   275,   165,   167,   169,   170,
     171,   276,   277,    95,    96,   176,   196,   315,   278,   279,
     282,   273,   318,   100,   149,   149,   284,   291,   148,   148,
     280,   128,   281,   292,   -85,   300,   302,   308,   286,   -77,
     -77,   -77,   -77,   -77,   -77,   -77,   293,   294,   295,   296,
     301,   111,   112,   113,   114,   115,   116,   117,   303,    92,
     311,   316,   357,     8,    83,   324,   222,   330,   177,    84,
      93,   106,    85,   271,    17,   331,   186,   187,   349,   339,
     351,   340,   363,   189,   190,   356,   353,   191,   108,   366,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   305,
     118,    90,   123,   124,   125,   367,   373,    68,   126,   127,
     128,   258,    68,   260,   310,   261,   377,   107,     0,   262,
     158,   112,   113,   114,   115,   116,   117,   108,   247,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   337,   338,
       0,   118,   136,   137,   138,   139,   140,   141,   142,   343,
     344,   345,     0,     0,   347,     0,   149,     0,     0,     0,
     148,     0,     0,   259,   306,   105,     1,     0,     0,     0,
      80,     0,     2,   143,     0,     0,   220,     0,   378,   108,
     118,   109,   110,   111,   112,   113,   114,   115,   116,   117,
       0,     0,     0,     0,     0,     0,   368,   369,     3,     4,
       5,     0,     0,     0,     6,     0,     0,     0,     0,     0,
       7,     8,     9,     0,    10,    11,    12,    13,     0,    14,
      15,    16,    17,     0,     0,    18,    19,    20,    21,    22,
      23,    24,   118,     0,     0,     0,     0,     0,     0,     1,
       0,    25,    26,     0,   -85,     2,     0,     0,    27,   -77,
     -77,   -77,   -77,   -77,   -77,   -77,   121,   122,   123,   124,
     125,   346,     0,     0,   126,   127,   128,     0,     0,     0,
     379,     3,     4,     5,     0,     0,     0,     6,     0,     0,
      93,     0,   222,     7,     8,     9,     0,    10,    11,    12,
      13,     0,    14,    15,    16,    17,     0,     0,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,   371,   372,   173,    25,    26,     0,    48,    49,     2,
     174,    27,   289,  -114,  -114,  -114,  -114,  -114,  -114,  -114,
       0,     0,   108,     0,   109,   110,   111,   112,   113,   114,
     115,   116,   117,     0,     0,     3,     4,     5,     0,     0,
       0,     6,     0,     0,   353,     0,     0,     7,     8,     9,
       0,    10,    11,    12,    13,     0,    14,    15,    16,    17,
      50,    51,    18,    19,    20,    21,    22,    23,    24,    52,
      53,    54,    55,    56,    57,   118,     0,    58,     0,     0,
      59,    60,    61,    62,    63,    47,     0,     0,     0,    48,
      49,     2,     0,     0,   290,   -78,   -78,   -78,   -78,   -78,
     -78,   -78,     0,     0,   108,     0,   109,   110,   111,   112,
     113,   114,   115,   116,   117,     0,     0,     3,     4,     5,
       0,     0,     0,     6,     0,     0,     0,     0,     0,     7,
       8,     9,     0,    10,    11,    12,    13,     0,    14,    15,
      16,    17,    50,    51,    18,    19,    20,    21,    22,    23,
      24,    52,    53,    54,    55,    56,    57,   118,     0,    58,
       0,     0,    59,    60,    61,    62,    63,   173,     0,     0,
       0,    48,    49,     2,     0,   136,   137,   138,   139,   140,
     141,   142,   121,   122,   123,   124,   125,     0,     0,     0,
     126,   127,   128,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     0,     0,     0,     6,   143,     0,     0,   196,
       0,     7,     8,     9,     0,    10,    11,    12,    13,     0,
      14,    15,    16,    17,    50,    51,    18,    19,    20,    21,
      22,    23,    24,    52,    53,    54,    55,    56,    57,   192,
       0,    58,     0,     0,    59,    60,    61,    62,    63,   108,
     328,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     108,     0,   109,   110,   111,   112,   113,   114,   115,   116,
     117,     0,     0,     0,     0,   -85,   193,   326,   360,     0,
     -77,   -77,   -77,   -77,   -77,   -77,   -77,   329,   108,     0,
     109,   110,   111,   112,   113,   114,   115,   116,   117,     0,
       0,     0,   118,     0,     0,     0,   374,     0,     0,     0,
       0,    93,     0,   118,   327,   361,   108,   359,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   108,     0,   109,
     110,   111,   112,   113,   114,   115,   116,   117,     0,     0,
       0,   118,     0,   375,    48,    49,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   108,     0,   109,   110,
     111,   112,   113,   114,   115,   116,   117,     0,     0,   118,
       0,     0,     3,     4,     5,     0,     0,     0,     6,   181,
     118,     0,     0,   193,     7,     8,     9,     0,    10,    11,
      12,    13,     0,    14,    15,    16,    17,     0,     0,    18,
      19,    20,    21,    22,    23,    24,     3,     4,     5,   118,
       0,     0,     6,   254,     0,     0,     0,     0,     7,     8,
       9,     0,    10,    11,    12,    13,     0,    14,    15,    16,
      17,     0,     0,    18,    19,    20,    21,    22,    23,    24,
       3,     4,     5,     0,     0,     0,     6,     0,     0,     0,
       0,     0,     7,     8,     9,     0,    10,    11,    12,   255,
       0,    14,    15,    16,    17,     0,     0,    18,    19,    20,
      21,    22,    23,    24,   108,     0,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   108,     0,   109,   110,   111,
     112,   113,   114,   115,   116,   117,     0,     0,     0,     0,
       0,   299,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   304,   108,     0,   109,   110,   111,   112,   113,
     114,   115,   116,   117,     0,     0,   108,   118,   109,   110,
     111,   112,   113,   114,   115,   116,   117,     0,   118,     0,
     307,   108,   336,   109,   110,   111,   112,   113,   114,   115,
     116,   117,     0,   317,   108,     0,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   108,   118,   109,   110,   111,
     112,   113,   114,   115,   116,   117,     0,     0,     0,   118,
       0,   365,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   118,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     0,   118,     0,     6,
       0,     0,     0,     0,     0,     7,     8,    76,   118,    10,
      11,    12,    77,    88,    14,    78,    16,    17,     0,     0,
      18,    19,    20,    21,    22,    23,    24,     3,     4,     5,
       0,     0,     0,     6,     0,     0,     0,     0,     0,     7,
       8,     9,   272,    10,    11,    12,    13,     0,    14,    15,
      16,    17,     0,     0,    18,    19,    20,    21,    22,    23,
      24,     3,     4,     5,     0,     0,     0,     6,     0,     0,
       0,     0,     0,     7,     8,     9,   309,    10,    11,    12,
      13,     0,    14,    15,    16,    17,     0,     0,    18,    19,
      20,    21,    22,    23,    24,     3,     4,     5,     0,     0,
       0,     6,     0,     0,     0,     0,     0,     7,     8,    76,
       0,    10,    11,    12,    77,     0,    14,    78,    16,    17,
       0,     0,    18,    19,    20,    21,    22,    23,    24,     3,
       4,     5,     0,     0,     0,     6,     0,     0,     0,     0,
       0,     7,     8,     9,     0,    10,    11,    12,    13,     0,
      14,    15,    16,    17,     0,     0,    18,    19,    20,    21,
      22,    23,    24,     3,     4,     5,     0,     0,     0,     6,
       0,     0,     0,     0,     0,     7,     8,   263,     0,    10,
      11,    12,    13,     0,    14,    15,    16,    17,     0,     0,
      18,    19,    20,    21,    22,    23,    24,     3,     4,     5,
       0,     0,     0,     6,     0,     0,     0,     0,     0,     7,
       8,     9,     0,    10,    11,    12,   285,     0,    14,    15,
      16,    17,     0,     0,    18,    19,    20,    21,    22,    23,
      24
};

static const yytype_int16 yycheck[] =
{
       4,     5,     6,     7,     8,     9,    11,     7,     4,     5,
       6,   153,     8,    65,   228,   229,   201,    47,    70,    71,
      72,    47,    74,     5,     6,    52,     8,    54,    11,    33,
       5,     6,    47,    11,    11,    39,    40,    33,     0,    39,
       2,     0,     7,    48,    40,    11,    21,     9,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    24,    25,    26,
      27,    28,    29,    30,    31,    48,    28,    47,     9,    28,
      48,    48,    76,     5,     6,    46,    47,    47,    41,    83,
      52,   197,    48,    46,    47,    44,    57,    46,     9,    52,
      47,   276,    55,   278,    57,    12,    13,    59,    60,    74,
      47,    63,    47,    65,    45,    47,    45,    74,    70,    71,
      72,    73,    74,     9,    76,    10,    11,   121,   122,   123,
     124,   125,    10,    11,   128,   121,   122,   123,   124,   125,
      10,    11,   128,    10,    11,    97,    98,    42,    43,    44,
      10,    11,   101,   102,    47,    47,   360,    47,   290,   111,
     112,   113,   114,   115,   116,   117,     5,     6,     7,   275,
     119,   277,    52,   279,    42,    43,    44,   129,   130,   131,
     132,   133,   134,   135,   136,   137,   138,   139,   140,   141,
     142,    52,   144,    14,    15,    16,    17,    18,    19,    20,
     152,   153,   308,    33,    47,    33,    41,   159,   160,    73,
      52,   163,    55,    56,    68,     9,    59,    60,    61,    62,
      63,    47,     9,    14,    15,    68,    48,   269,    47,     9,
      74,   183,   274,    24,   228,   229,    48,    48,   228,   229,
     192,    44,   194,    52,     9,    11,    48,     9,   200,    14,
      15,    16,    17,    18,    19,    20,   208,   209,   210,   211,
      11,    25,    26,    27,    28,    29,    30,    31,    11,   263,
      11,    47,   335,    46,    47,    52,   119,    48,    69,    52,
      45,    28,    55,     6,    57,    52,    77,    78,    48,    52,
      48,    52,    48,    84,    85,    52,    45,    88,    21,    52,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    74,
      74,   263,    36,    37,    38,    48,    48,   269,    42,    43,
      44,   164,   274,   166,   263,   168,    48,    11,    -1,   172,
     173,    26,    27,    28,    29,    30,    31,    21,   290,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   300,   301,
      -1,    74,    14,    15,    16,    17,    18,    19,    20,   311,
     312,   313,    -1,    -1,   316,    -1,   360,    -1,    -1,    -1,
     360,    -1,    -1,   164,     6,     0,     1,    -1,    -1,    -1,
     374,    -1,     7,    45,    -1,    -1,   335,    -1,   374,    21,
      74,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      -1,    -1,    -1,    -1,    -1,    -1,   358,   359,    33,    34,
      35,    -1,    -1,    -1,    39,    -1,    -1,    -1,    -1,    -1,
      45,    46,    47,    -1,    49,    50,    51,    52,    -1,    54,
      55,    56,    57,    -1,    -1,    60,    61,    62,    63,    64,
      65,    66,    74,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,    76,    77,    -1,     9,     7,    -1,    -1,    83,    14,
      15,    16,    17,    18,    19,    20,    34,    35,    36,    37,
      38,   314,    -1,    -1,    42,    43,    44,    -1,    -1,    -1,
      48,    33,    34,    35,    -1,    -1,    -1,    39,    -1,    -1,
      45,    -1,   335,    45,    46,    47,    -1,    49,    50,    51,
      52,    -1,    54,    55,    56,    57,    -1,    -1,    60,    61,
      62,    63,    64,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,   364,   365,     1,    76,    77,    -1,     5,     6,     7,
       8,    83,    11,    14,    15,    16,    17,    18,    19,    20,
      -1,    -1,    21,    -1,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    -1,    33,    34,    35,    -1,    -1,
      -1,    39,    -1,    -1,    45,    -1,    -1,    45,    46,    47,
      -1,    49,    50,    51,    52,    -1,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    74,    -1,    75,    -1,    -1,
      78,    79,    80,    81,    82,     1,    -1,    -1,    -1,     5,
       6,     7,    -1,    -1,    11,    14,    15,    16,    17,    18,
      19,    20,    -1,    -1,    21,    -1,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    -1,    -1,    33,    34,    35,
      -1,    -1,    -1,    39,    -1,    -1,    -1,    -1,    -1,    45,
      46,    47,    -1,    49,    50,    51,    52,    -1,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    74,    -1,    75,
      -1,    -1,    78,    79,    80,    81,    82,     1,    -1,    -1,
      -1,     5,     6,     7,    -1,    14,    15,    16,    17,    18,
      19,    20,    34,    35,    36,    37,    38,    -1,    -1,    -1,
      42,    43,    44,    -1,    -1,    -1,    -1,    -1,    -1,    33,
      34,    35,    -1,    -1,    -1,    39,    45,    -1,    -1,    48,
      -1,    45,    46,    47,    -1,    49,    50,    51,    52,    -1,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    11,
      -1,    75,    -1,    -1,    78,    79,    80,    81,    82,    21,
      11,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      21,    -1,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    -1,    -1,    -1,    -1,     9,    48,    11,    11,    -1,
      14,    15,    16,    17,    18,    19,    20,    48,    21,    -1,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      -1,    -1,    74,    -1,    -1,    -1,    11,    -1,    -1,    -1,
      -1,    45,    -1,    74,    48,    48,    21,    11,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    21,    -1,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    -1,    -1,
      -1,    74,    -1,    48,     5,     6,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    21,    -1,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    -1,    -1,    74,
      -1,    -1,    33,    34,    35,    -1,    -1,    -1,    39,     6,
      74,    -1,    -1,    48,    45,    46,    47,    -1,    49,    50,
      51,    52,    -1,    54,    55,    56,    57,    -1,    -1,    60,
      61,    62,    63,    64,    65,    66,    33,    34,    35,    74,
      -1,    -1,    39,     6,    -1,    -1,    -1,    -1,    45,    46,
      47,    -1,    49,    50,    51,    52,    -1,    54,    55,    56,
      57,    -1,    -1,    60,    61,    62,    63,    64,    65,    66,
      33,    34,    35,    -1,    -1,    -1,    39,    -1,    -1,    -1,
      -1,    -1,    45,    46,    47,    -1,    49,    50,    51,    52,
      -1,    54,    55,    56,    57,    -1,    -1,    60,    61,    62,
      63,    64,    65,    66,    21,    -1,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    21,    -1,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    -1,    -1,    -1,    -1,
      -1,    48,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    48,    21,    -1,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    -1,    -1,    21,    74,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    -1,    74,    -1,
      48,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    -1,    48,    21,    -1,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    21,    74,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    -1,    -1,    -1,    74,
      -1,    48,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    33,    34,    35,    -1,    74,    -1,    39,
      -1,    -1,    -1,    -1,    -1,    45,    46,    47,    74,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    -1,    -1,
      60,    61,    62,    63,    64,    65,    66,    33,    34,    35,
      -1,    -1,    -1,    39,    -1,    -1,    -1,    -1,    -1,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    54,    55,
      56,    57,    -1,    -1,    60,    61,    62,    63,    64,    65,
      66,    33,    34,    35,    -1,    -1,    -1,    39,    -1,    -1,
      -1,    -1,    -1,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    54,    55,    56,    57,    -1,    -1,    60,    61,
      62,    63,    64,    65,    66,    33,    34,    35,    -1,    -1,
      -1,    39,    -1,    -1,    -1,    -1,    -1,    45,    46,    47,
      -1,    49,    50,    51,    52,    -1,    54,    55,    56,    57,
      -1,    -1,    60,    61,    62,    63,    64,    65,    66,    33,
      34,    35,    -1,    -1,    -1,    39,    -1,    -1,    -1,    -1,
      -1,    45,    46,    47,    -1,    49,    50,    51,    52,    -1,
      54,    55,    56,    57,    -1,    -1,    60,    61,    62,    63,
      64,    65,    66,    33,    34,    35,    -1,    -1,    -1,    39,
      -1,    -1,    -1,    -1,    -1,    45,    46,    47,    -1,    49,
      50,    51,    52,    -1,    54,    55,    56,    57,    -1,    -1,
      60,    61,    62,    63,    64,    65,    66,    33,    34,    35,
      -1,    -1,    -1,    39,    -1,    -1,    -1,    -1,    -1,    45,
      46,    47,    -1,    49,    50,    51,    52,    -1,    54,    55,
      56,    57,    -1,    -1,    60,    61,    62,    63,    64,    65,
      66
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     7,    33,    34,    35,    39,    45,    46,    47,
      49,    50,    51,    52,    54,    55,    56,    57,    60,    61,
      62,    63,    64,    65,    66,    76,    77,    83,    85,    86,
      87,    93,    98,   103,   104,   105,   108,   122,   123,   127,
     129,   130,   131,   134,   135,   136,   139,     1,     5,     6,
      58,    59,    67,    68,    69,    70,    71,    72,    75,    78,
      79,    80,    81,    82,    93,    95,    96,    97,    98,   110,
     114,   116,   117,   118,   121,   126,    47,    52,    55,   104,
     122,   104,   104,    47,    52,    55,   105,   122,    53,   104,
      98,   112,   122,    45,   109,   109,   109,    47,    47,    47,
     109,    88,    89,    52,    54,     0,    86,    11,    21,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    74,    90,
     104,    34,    35,    36,    37,    38,    42,    43,    44,    14,
      15,    16,    17,    18,    19,    20,    14,    15,    16,    17,
      18,    19,    20,    45,    11,    48,   124,    41,   105,   122,
     128,   104,    47,    47,    93,    47,    93,     8,    97,    47,
      47,    97,    97,    47,    52,    97,    98,    97,    98,    97,
      97,    97,    98,     1,     8,    96,    97,   109,    96,    96,
      96,     6,    98,   119,    96,    98,   109,   109,   122,   109,
     109,   109,    11,    48,    11,    48,    48,     9,    47,   140,
     141,    47,    98,    98,    52,    47,    93,    93,    91,   101,
      99,   100,    98,    98,    98,    98,    98,    98,    98,    52,
      93,    94,    97,   104,   104,   104,   104,   104,    33,    33,
     104,    98,    98,    98,    98,    98,    98,    98,    98,    98,
      98,    98,    98,    98,    98,    98,    41,    98,   125,   125,
      52,   137,   138,    98,     6,    52,    98,    98,    97,   109,
      97,    97,    97,    47,    98,   106,   107,   111,    73,   115,
      68,     6,    48,    98,   120,     9,    47,     9,    47,     9,
      98,    98,    74,   107,    48,    52,    98,   142,   106,    11,
      11,    48,    52,    98,    98,    98,    98,   128,   128,    48,
      11,    11,    48,    11,    48,    74,     6,    48,     9,    48,
     112,    11,    12,    13,   113,    96,    47,    48,    96,   107,
     106,   107,   106,   107,    52,    10,    11,    48,    11,    48,
      48,    52,   125,    11,    48,    92,    22,    98,    98,    52,
      52,   107,    48,    98,    98,    98,    97,    98,    10,    48,
      10,    48,    10,    45,    11,    48,    52,    94,   102,    11,
      11,    48,   132,    48,    10,    48,    52,    48,    98,    98,
     128,    97,    97,    48,    11,    48,   133,    48,   104,    48
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_uint8 yyr1[] =
{
       0,    84,    85,    85,    86,    86,    86,    87,    88,    87,
      89,    87,    90,    87,    91,    92,    87,    93,    93,    94,
      94,    95,    95,    96,    96,    96,    96,    96,    96,    96,
      96,    96,    97,    97,    98,    98,    98,    98,    98,    98,
      98,    98,    98,    98,    98,    98,    98,    98,    98,    99,
      98,   100,    98,   101,   102,    98,   103,   103,   104,   104,
     104,   104,   104,   104,   104,   104,   104,   104,   104,   104,
     104,   104,   104,   104,   104,   104,   104,   105,   105,   106,
     106,   107,   107,   108,   108,   109,    96,   110,   110,   111,
     111,   111,   112,   112,   113,   113,   113,   114,    96,   115,
      96,   116,    96,   117,    96,    96,   118,   118,   119,   119,
     120,   120,    98,    98,   105,   104,   104,    96,    96,   121,
      96,   122,   122,   122,   122,   122,   104,    98,    98,    98,
      98,    98,    98,    98,   104,   123,   124,   124,   104,   104,
     104,   104,   104,   125,    96,    96,    96,    96,   126,   126,
     104,   104,   104,   104,   104,   104,   104,   127,   128,   128,
     129,   129,   104,   130,   104,   131,   131,   132,   132,   133,
     133,   134,   135,   136,   136,   137,   137,   138,   138,   139,
     104,   140,   140,   141,   141,   141,   142,   142
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     2,     1,     0,     3,
       0,     3,     0,     3,     0,     0,     6,     3,     3,     1,
       1,     1,     2,     1,     2,     1,     2,     2,     2,     1,
       2,     2,     1,     1,     1,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     0,
       4,     0,     4,     0,     0,     7,     1,     2,     1,     1,
       1,     3,     1,     3,     3,     3,     3,     3,     3,     2,
       2,     2,     1,     2,     2,     2,     2,     1,     5,     0,
       1,     1,     3,     5,     1,     0,     5,     1,     1,     1,
       3,     2,     3,     3,     0,     2,     2,     4,     2,     1,
       4,     1,     7,     4,     2,     4,     3,     4,     1,     2,
       1,     2,     3,     5,     5,     5,     6,     7,     3,     6,
       2,     1,     2,     6,     2,     3,     1,     3,     3,     3,
       3,     3,     3,     3,     2,     5,     1,     3,     4,     5,
       7,     8,     6,     1,     2,     3,     2,     3,     2,     3,
       1,     2,     2,     3,     4,     3,     4,     1,     1,     1,
       2,     3,     8,     1,     6,     1,     1,     1,     3,     1,
       3,     2,     4,     2,     2,     0,     1,     1,     3,     1,
       3,     2,     2,     1,     3,     3,     2,     2
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 7: /* PA_block: block  */
#line 161 "parse.y"
             { /* this do nothing action removes a vacuous warning
                  from Bison */
             }
#line 1930 "y.tab.c"
    break;

  case 8: /* $@1: %empty  */
#line 166 "parse.y"
                { be_setup(scope = SCOPE_BEGIN) ; }
#line 1936 "y.tab.c"
    break;

  case 9: /* PA_block: a_BEGIN $@1 block  */
#line 169 "parse.y"
                { switch_code_to_main() ; }
#line 1942 "y.tab.c"
    break;

  case 10: /* $@2: %empty  */
#line 172 "parse.y"
                { be_setup(scope = SCOPE_END) ; }
#line 1948 "y.tab.c"
    break;

  case 11: /* PA_block: a_END $@2 block  */
#line 175 "parse.y"
                { switch_code_to_main() ; }
#line 1954 "y.tab.c"
    break;

  case 12: /* $@3: %empty  */
#line 178 "parse.y"
             { code_jmp(_JZ, (INST*)0) ; }
#line 1960 "y.tab.c"
    break;

  case 13: /* PA_block: expr $@3 block_or_separator  */
#line 181 "parse.y"
             { patch_jmp( code_ptr ) ; }
#line 1966 "y.tab.c"
    break;

  case 14: /* $@4: %empty  */
#line 185 "parse.y"
             { 
               INST *p1 = CDP((yyvsp[-1].start)) ;
             int len ;

               code_push(p1, code_ptr - p1, scope, active_funct) ;
               code_ptr = p1 ;

               code2op(_RANGE, 1) ;
               code_ptr += 3 ;
               len = code_pop(code_ptr) ;
             code_ptr += len ;
               code1(_STOP) ;
             p1 = CDP((yyvsp[-1].start)) ;
               p1[2].op = code_ptr - (p1+1) ;
             }
#line 1986 "y.tab.c"
    break;

  case 15: /* $@5: %empty  */
#line 201 "parse.y"
             { code1(_STOP) ; }
#line 1992 "y.tab.c"
    break;

  case 16: /* PA_block: expr COMMA $@4 expr $@5 block_or_separator  */
#line 204 "parse.y"
             { 
               INST *p1 = CDP((yyvsp[-5].start)) ;
               
               p1[3].op = CDP((yyvsp[0].start)) - (p1+1) ;
               p1[4].op = code_ptr - (p1+1) ;
             }
#line 2003 "y.tab.c"
    break;

  case 17: /* block: LBRACE statement_list RBRACE  */
#line 215 "parse.y"
            { (yyval.start) = (yyvsp[-1].start) ; }
#line 2009 "y.tab.c"
    break;

  case 18: /* block: LBRACE error RBRACE  */
#line 217 "parse.y"
            { (yyval.start) = code_offset ; /* does nothing won't be executed */
              print_flag = getline_flag = paren_cnt = 0 ;
              yyerrok ; }
#line 2017 "y.tab.c"
    break;

  case 20: /* block_or_separator: separator  */
#line 224 "parse.y"
                     { (yyval.start) = code_offset ;
                       code1(_PUSHINT) ; code1(0) ;
                       code2(_PRINT, bi_print) ;
                     }
#line 2026 "y.tab.c"
    break;

  case 24: /* statement: expr separator  */
#line 236 "parse.y"
             { code1(_POP) ; }
#line 2032 "y.tab.c"
    break;

  case 25: /* statement: separator  */
#line 238 "parse.y"
             { (yyval.start) = code_offset ; }
#line 2038 "y.tab.c"
    break;

  case 26: /* statement: error separator  */
#line 240 "parse.y"
              { (yyval.start) = code_offset ;
                print_flag = getline_flag = 0 ;
                paren_cnt = 0 ;
                yyerrok ;
              }
#line 2048 "y.tab.c"
    break;

  case 27: /* statement: BREAK separator  */
#line 246 "parse.y"
             { (yyval.start) = code_offset ; BC_insert('B', code_ptr+1) ;
               code2(_BREAK, 0) /* don't use code_jmp ! */ ; }
#line 2055 "y.tab.c"
    break;

  case 28: /* statement: CONTINUE separator  */
#line 249 "parse.y"
             { (yyval.start) = code_offset ; BC_insert('C', code_ptr+1) ;
               code2(_GOTO, 0) ; }
#line 2062 "y.tab.c"
    break;

  case 29: /* statement: return_statement  */
#line 252 "parse.y"
             { if ( scope != SCOPE_FUNCT )
                     compile_error("return outside function body") ;
             }
#line 2070 "y.tab.c"
    break;

  case 30: /* statement: NEXT separator  */
#line 256 "parse.y"
              { if ( scope != SCOPE_MAIN && scope != SCOPE_FUNCT )
                   compile_error( "improper use of next" ) ;
                (yyval.start) = code_offset ; 
                code1(_NEXT) ;
              }
#line 2080 "y.tab.c"
    break;

  case 31: /* statement: NEXTFILE separator  */
#line 262 "parse.y"
              { if ( scope != SCOPE_MAIN && scope != SCOPE_FUNCT )
                   compile_error( "improper use of nextfile" ) ;
                (yyval.start) = code_offset ; 
                code1(_NEXTFILE) ;
              }
#line 2090 "y.tab.c"
    break;

  case 35: /* expr: lvalue ASSIGN expr  */
#line 273 "parse.y"
                                 { code1(_ASSIGN) ; }
#line 2096 "y.tab.c"
    break;

  case 36: /* expr: lvalue ADD_ASG expr  */
#line 274 "parse.y"
                                 { code1(_ADD_ASG) ; }
#line 2102 "y.tab.c"
    break;

  case 37: /* expr: lvalue SUB_ASG expr  */
#line 275 "parse.y"
                                 { code1(_SUB_ASG) ; }
#line 2108 "y.tab.c"
    break;

  case 38: /* expr: lvalue MUL_ASG expr  */
#line 276 "parse.y"
                                 { code1(_MUL_ASG) ; }
#line 2114 "y.tab.c"
    break;

  case 39: /* expr: lvalue DIV_ASG expr  */
#line 277 "parse.y"
                                 { code1(_DIV_ASG) ; }
#line 2120 "y.tab.c"
    break;

  case 40: /* expr: lvalue MOD_ASG expr  */
#line 278 "parse.y"
                                 { code1(_MOD_ASG) ; }
#line 2126 "y.tab.c"
    break;

  case 41: /* expr: lvalue POW_ASG expr  */
#line 279 "parse.y"
                                 { code1(_POW_ASG) ; }
#line 2132 "y.tab.c"
    break;

  case 42: /* expr: expr EQ expr  */
#line 280 "parse.y"
                        { code1(_EQ) ; }
#line 2138 "y.tab.c"
    break;

  case 43: /* expr: expr NEQ expr  */
#line 281 "parse.y"
                        { code1(_NEQ) ; }
#line 2144 "y.tab.c"
    break;

  case 44: /* expr: expr LT expr  */
#line 282 "parse.y"
                       { code1(_LT) ; }
#line 2150 "y.tab.c"
    break;

  case 45: /* expr: expr LTE expr  */
#line 283 "parse.y"
                        { code1(_LTE) ; }
#line 2156 "y.tab.c"
    break;

  case 46: /* expr: expr GT expr  */
#line 284 "parse.y"
                       { code1(_GT) ; }
#line 2162 "y.tab.c"
    break;

  case 47: /* expr: expr GTE expr  */
#line 285 "parse.y"
                        { code1(_GTE) ; }
#line 2168 "y.tab.c"
    break;

  case 48: /* expr: expr MATCH expr  */
#line 288 "parse.y"
          {
            INST *p3 = CDP((yyvsp[0].start)) ;

            if ( p3 == code_ptr - 2 )
            {
               if ( p3->op == _MATCH0 )  p3->op = _MATCH1 ;

               else /* check for string */
               if ( p3->op == _PUSHS )
               { CELL *cp = ZMALLOC(CELL) ;

                 cp->type = C_STRING ; 
                 cp->ptr = p3[1].ptr ;
                 cast_to_RE(cp) ;
                 code_ptr -= 2 ;
                 code2(_MATCH1, cp->ptr) ;
                 ZFREE(cp) ;
               }
               else  code1(_MATCH2) ;
            }
            else code1(_MATCH2) ;

            if ( !(yyvsp[-1].ival) ) code1(_NOT) ;
          }
#line 2197 "y.tab.c"
    break;

  case 49: /* $@6: %empty  */
#line 315 "parse.y"
              { code1(_TEST) ;
                code_jmp(_LJNZ, (INST*)0) ;
              }
#line 2205 "y.tab.c"
    break;

  case 50: /* expr: expr OR $@6 expr  */
#line 319 "parse.y"
          { code1(_TEST) ; patch_jmp(code_ptr) ; }
#line 2211 "y.tab.c"
    break;

  case 51: /* $@7: %empty  */
#line 322 "parse.y"
              { code1(_TEST) ; 
                code_jmp(_LJZ, (INST*)0) ;
              }
#line 2219 "y.tab.c"
    break;

  case 52: /* expr: expr AND $@7 expr  */
#line 326 "parse.y"
              { code1(_TEST) ; patch_jmp(code_ptr) ; }
#line 2225 "y.tab.c"
    break;

  case 53: /* $@8: %empty  */
#line 328 "parse.y"
                     { code_jmp(_QMARK, (INST*)0) ; }
#line 2231 "y.tab.c"
    break;

  case 54: /* $@9: %empty  */
#line 329 "parse.y"
                     { code_jmp(_COLON, (INST*)0) ; }
#line 2237 "y.tab.c"
    break;

  case 55: /* expr: expr QMARK $@8 expr COLON $@9 expr  */
#line 331 "parse.y"
         { patch_jmp(code_ptr) ; patch_jmp(CDP((yyvsp[0].start))) ; }
#line 2243 "y.tab.c"
    break;

  case 57: /* cat_expr: cat_expr p_expr  */
#line 336 "parse.y"
            { code1(_CAT) ; }
#line 2249 "y.tab.c"
    break;

  case 58: /* p_expr: DOUBLE  */
#line 340 "parse.y"
          {  (yyval.start) = code_offset ; code2(_PUSHD, (yyvsp[0].ptr)) ; }
#line 2255 "y.tab.c"
    break;

  case 59: /* p_expr: STRING_  */
#line 342 "parse.y"
          { (yyval.start) = code_offset ; code2(_PUSHS, (yyvsp[0].ptr)) ; }
#line 2261 "y.tab.c"
    break;

  case 60: /* p_expr: ID  */
#line 344 "parse.y"
          { check_var((yyvsp[0].stp)) ;
            (yyval.start) = code_offset ;
            if ( is_local((yyvsp[0].stp)) )
            { code2op(L_PUSHI, (yyvsp[0].stp)->offset) ; }
            else code2(_PUSHI, (yyvsp[0].stp)->stval.cp) ;
          }
#line 2272 "y.tab.c"
    break;

  case 61: /* p_expr: LPAREN expr RPAREN  */
#line 352 "parse.y"
          { (yyval.start) = (yyvsp[-1].start) ; }
#line 2278 "y.tab.c"
    break;

  case 62: /* p_expr: RE  */
#line 356 "parse.y"
            { (yyval.start) = code_offset ; code2(_MATCH0, (yyvsp[0].ptr)) ; }
#line 2284 "y.tab.c"
    break;

  case 63: /* p_expr: p_expr PLUS p_expr  */
#line 359 "parse.y"
                                  { code1(_ADD) ; }
#line 2290 "y.tab.c"
    break;

  case 64: /* p_expr: p_expr MINUS p_expr  */
#line 360 "parse.y"
                               { code1(_SUB) ; }
#line 2296 "y.tab.c"
    break;

  case 65: /* p_expr: p_expr MUL p_expr  */
#line 361 "parse.y"
                               { code1(_MUL) ; }
#line 2302 "y.tab.c"
    break;

  case 66: /* p_expr: p_expr DIV p_expr  */
#line 362 "parse.y"
                              { code1(_DIV) ; }
#line 2308 "y.tab.c"
    break;

  case 67: /* p_expr: p_expr MOD p_expr  */
#line 363 "parse.y"
                              { code1(_MOD) ; }
#line 2314 "y.tab.c"
    break;

  case 68: /* p_expr: p_expr POW p_expr  */
#line 364 "parse.y"
                              { code1(_POW) ; }
#line 2320 "y.tab.c"
    break;

  case 69: /* p_expr: NOT p_expr  */
#line 366 "parse.y"
                { (yyval.start) = (yyvsp[0].start) ; code1(_NOT) ; }
#line 2326 "y.tab.c"
    break;

  case 70: /* p_expr: PLUS p_expr  */
#line 368 "parse.y"
                { (yyval.start) = (yyvsp[0].start) ; code1(_UPLUS) ; }
#line 2332 "y.tab.c"
    break;

  case 71: /* p_expr: MINUS p_expr  */
#line 370 "parse.y"
                { (yyval.start) = (yyvsp[0].start) ; code1(_UMINUS) ; }
#line 2338 "y.tab.c"
    break;

  case 73: /* p_expr: ID INC_or_DEC  */
#line 375 "parse.y"
           { check_var((yyvsp[-1].stp)) ;
             (yyval.start) = code_offset ;
             code_address((yyvsp[-1].stp)) ;

             if ( (yyvsp[0].ival) == '+' )  code1(_POST_INC) ;
             else  code1(_POST_DEC) ;
           }
#line 2350 "y.tab.c"
    break;

  case 74: /* p_expr: INC_or_DEC lvalue  */
#line 383 "parse.y"
            { (yyval.start) = (yyvsp[0].start) ; 
              if ( (yyvsp[-1].ival) == '+' ) code1(_PRE_INC) ;
              else  code1(_PRE_DEC) ;
            }
#line 2359 "y.tab.c"
    break;

  case 75: /* p_expr: field INC_or_DEC  */
#line 390 "parse.y"
           { if ((yyvsp[0].ival) == '+' ) code1(F_POST_INC ) ; 
             else  code1(F_POST_DEC) ;
           }
#line 2367 "y.tab.c"
    break;

  case 76: /* p_expr: INC_or_DEC field  */
#line 394 "parse.y"
           { (yyval.start) = (yyvsp[0].start) ; 
             if ( (yyvsp[-1].ival) == '+' ) code1(F_PRE_INC) ;
             else  code1( F_PRE_DEC) ; 
           }
#line 2376 "y.tab.c"
    break;

  case 77: /* lvalue: ID  */
#line 401 "parse.y"
        { (yyval.start) = code_offset ; 
          check_var((yyvsp[0].stp)) ;
          code_address((yyvsp[0].stp)) ;
        }
#line 2385 "y.tab.c"
    break;

  case 78: /* lvalue: BUILTIN mark LPAREN arglist RPAREN  */
#line 406 "parse.y"
        {
          BI_REC *p = (yyvsp[-4].bip) ;
          (yyval.start) = (yyvsp[-3].start);
          if (strcmp(p->name, "argval"))
            compile_error("builtin function '%s' used as an lvalue", p->name);
          if ( (int)p->min_args > (yyvsp[-1].ival) || (int)p->max_args < (yyvsp[-1].ival) )
            compile_error(
            "wrong number of arguments in call to %s" ,
            p->name ) ;
          if ( p->min_args != p->max_args ) /* variable args */
              { code1(_PUSHINT) ;  code1((yyvsp[-1].ival)) ; }
          code2(_BUILTIN , p->fp) ;
        }
#line 2403 "y.tab.c"
    break;

  case 79: /* arglist: %empty  */
#line 424 "parse.y"
            { (yyval.ival) = 0 ; }
#line 2409 "y.tab.c"
    break;

  case 81: /* args: expr  */
#line 429 "parse.y"
            { (yyval.ival) = 1 ; }
#line 2415 "y.tab.c"
    break;

  case 82: /* args: args COMMA expr  */
#line 431 "parse.y"
            { (yyval.ival) = (yyvsp[-2].ival) + 1 ; }
#line 2421 "y.tab.c"
    break;

  case 83: /* builtin: BUILTIN mark LPAREN arglist RPAREN  */
#line 436 "parse.y"
        { 
	  BI_REC *p = (yyvsp[-4].bip) ;
          (yyval.start) = (yyvsp[-3].start) ;
          if ( (int)p->min_args > (yyvsp[-1].ival) || (int)p->max_args < (yyvsp[-1].ival) )
            compile_error(
            "wrong number of arguments in call to %s" ,
            p->name ) ;
          if ( p->min_args != p->max_args ) /* variable args */
              { code1(_PUSHINT) ;  code1((yyvsp[-1].ival)) ; }
          code2(_BUILTIN , p->fp) ;
        }
#line 2437 "y.tab.c"
    break;

  case 84: /* builtin: LENGTH  */
#line 448 "parse.y"
          {
            (yyval.start) = code_offset ;
            code1(_PUSHINT) ; code1(0) ;
            code2(_BUILTIN, (yyvsp[0].bip)->fp) ;
          }
#line 2447 "y.tab.c"
    break;

  case 85: /* mark: %empty  */
#line 457 "parse.y"
         { (yyval.start) = code_offset ; }
#line 2453 "y.tab.c"
    break;

  case 86: /* statement: print mark pr_args pr_direction separator  */
#line 461 "parse.y"
            { code2(_PRINT, (yyvsp[-4].fp)) ; 
              if ( (yyvsp[-4].fp) == bi_printf && (yyvsp[-2].ival) == 0 )
                    compile_error("no arguments in call to printf") ;
              print_flag = 0 ;
              (yyval.start) = (yyvsp[-3].start) ;
            }
#line 2464 "y.tab.c"
    break;

  case 87: /* print: PRINT  */
#line 469 "parse.y"
                  { (yyval.fp) = bi_print ; print_flag = 1 ;}
#line 2470 "y.tab.c"
    break;

  case 88: /* print: PRINTF  */
#line 470 "parse.y"
                  { (yyval.fp) = bi_printf ; print_flag = 1 ; }
#line 2476 "y.tab.c"
    break;

  case 89: /* pr_args: arglist  */
#line 473 "parse.y"
                   { code2op(_PUSHINT, (yyvsp[0].ival)) ; }
#line 2482 "y.tab.c"
    break;

  case 90: /* pr_args: LPAREN arg2 RPAREN  */
#line 475 "parse.y"
           { (yyval.ival) = (yyvsp[-1].arg2p)->cnt ; zfree((yyvsp[-1].arg2p),sizeof(ARG2_REC)) ; 
             code2op(_PUSHINT, (yyval.ival)) ; 
           }
#line 2490 "y.tab.c"
    break;

  case 91: /* pr_args: LPAREN RPAREN  */
#line 479 "parse.y"
           { (yyval.ival)=0 ; code2op(_PUSHINT, 0) ; }
#line 2496 "y.tab.c"
    break;

  case 92: /* arg2: expr COMMA expr  */
#line 483 "parse.y"
           { (yyval.arg2p) = (ARG2_REC*) zmalloc(sizeof(ARG2_REC)) ;
             (yyval.arg2p)->start = (yyvsp[-2].start) ;
             (yyval.arg2p)->cnt = 2 ;
           }
#line 2505 "y.tab.c"
    break;

  case 93: /* arg2: arg2 COMMA expr  */
#line 488 "parse.y"
            { (yyval.arg2p) = (yyvsp[-2].arg2p) ; (yyval.arg2p)->cnt++ ; }
#line 2511 "y.tab.c"
    break;

  case 95: /* pr_direction: IO_OUT expr  */
#line 493 "parse.y"
                { code2op(_PUSHINT, (yyvsp[-1].ival)) ; }
#line 2517 "y.tab.c"
    break;

  case 96: /* pr_direction: COPROCESS_OUT expr  */
#line 495 "parse.y"
                { code2op(_PUSHINT, (yyvsp[-1].ival)) ; }
#line 2523 "y.tab.c"
    break;

  case 97: /* if_front: IF LPAREN expr RPAREN  */
#line 502 "parse.y"
            {  (yyval.start) = (yyvsp[-1].start) ; eat_nl() ; code_jmp(_JZ, (INST*)0) ; }
#line 2529 "y.tab.c"
    break;

  case 98: /* statement: if_front statement  */
#line 507 "parse.y"
                { patch_jmp( code_ptr ) ;  }
#line 2535 "y.tab.c"
    break;

  case 99: /* else: ELSE  */
#line 510 "parse.y"
                { eat_nl() ; code_jmp(_ELSE, (INST*)0) ; }
#line 2541 "y.tab.c"
    break;

  case 100: /* statement: if_front statement else statement  */
#line 515 "parse.y"
                { patch_jmp(code_ptr) ; 
                  patch_jmp(CDP((yyvsp[0].start))) ; 
                }
#line 2549 "y.tab.c"
    break;

  case 101: /* do: DO  */
#line 523 "parse.y"
        { eat_nl() ; BC_new() ; }
#line 2555 "y.tab.c"
    break;

  case 102: /* statement: do statement WHILE LPAREN expr RPAREN separator  */
#line 528 "parse.y"
        { (yyval.start) = (yyvsp[-5].start) ;
          code_jmp(_JNZ, CDP((yyvsp[-5].start))) ; 
          BC_clear(code_ptr, CDP((yyvsp[-2].start))) ; }
#line 2563 "y.tab.c"
    break;

  case 103: /* while_front: WHILE LPAREN expr RPAREN  */
#line 534 "parse.y"
                { eat_nl() ; BC_new() ;
                  (yyval.start) = (yyvsp[-1].start) ;

                  /* check if const expression */
                  if ( code_ptr - 2 == CDP((yyvsp[-1].start)) &&
                       code_ptr[-2].op == _PUSHD &&
                       *(double*)code_ptr[-1].ptr != 0.0 
                     )
                     code_ptr -= 2 ;
                  else
                  { INST *p3 = CDP((yyvsp[-1].start)) ;
                    code_push(p3, code_ptr-p3, scope, active_funct) ;
                    code_ptr = p3 ;
                    code2(_JMP, (INST*)0) ; /* code2() not code_jmp() */
                  }
                }
#line 2584 "y.tab.c"
    break;

  case 104: /* statement: while_front statement  */
#line 554 "parse.y"
                { 
                  int  saved_offset ;
                  int len ;
                  INST *p1 = CDP((yyvsp[-1].start)) ;
                  INST *p2 = CDP((yyvsp[0].start)) ;

                  if ( p1 != p2 )  /* real test in loop */
                  {
                    p1[1].op = code_ptr-(p1+1) ;
                    saved_offset = code_offset ;
                    len = code_pop(code_ptr) ;
                    code_ptr += len ;
                    code_jmp(_JNZ, CDP((yyvsp[0].start))) ;
                    BC_clear(code_ptr, CDP(saved_offset)) ;
                  }
                  else /* while(1) */
                  {
                    code_jmp(_JMP, p1) ;
                    BC_clear(code_ptr, CDP((yyvsp[0].start))) ;
                  }
                }
#line 2610 "y.tab.c"
    break;

  case 105: /* statement: for1 for2 for3 statement  */
#line 580 "parse.y"
                { 
                  int cont_offset = code_offset ;
                  unsigned len = code_pop(code_ptr) ;
                  INST *p2 = CDP((yyvsp[-2].start)) ;
                  INST *p4 = CDP((yyvsp[0].start)) ;

                  code_ptr += len ;

                  if ( p2 != p4 )  /* real test in for2 */
                  {
                    p4[-1].op = code_ptr - p4 + 1 ;
                    len = code_pop(code_ptr) ;
                    code_ptr += len ;
                    code_jmp(_JNZ, CDP((yyvsp[0].start))) ;
                  }
                  else /*  for(;;) */
                  code_jmp(_JMP, p4) ;

                  BC_clear(code_ptr, CDP(cont_offset)) ;

                }
#line 2636 "y.tab.c"
    break;

  case 106: /* for1: FOR LPAREN SEMI_COLON  */
#line 603 "parse.y"
                                    { (yyval.start) = code_offset ; }
#line 2642 "y.tab.c"
    break;

  case 107: /* for1: FOR LPAREN expr SEMI_COLON  */
#line 605 "parse.y"
           { (yyval.start) = (yyvsp[-1].start) ; code1(_POP) ; }
#line 2648 "y.tab.c"
    break;

  case 108: /* for2: SEMI_COLON  */
#line 608 "parse.y"
                        { (yyval.start) = code_offset ; }
#line 2654 "y.tab.c"
    break;

  case 109: /* for2: expr SEMI_COLON  */
#line 610 "parse.y"
           { 
             if ( code_ptr - 2 == CDP((yyvsp[-1].start)) &&
                  code_ptr[-2].op == _PUSHD &&
                  * (double*) code_ptr[-1].ptr != 0.0
                )
                    code_ptr -= 2 ;
             else   
             {
               INST *p1 = CDP((yyvsp[-1].start)) ;
               code_push(p1, code_ptr-p1, scope, active_funct) ;
               code_ptr = p1 ;
               code2(_JMP, (INST*)0) ;
             }
           }
#line 2673 "y.tab.c"
    break;

  case 110: /* for3: RPAREN  */
#line 627 "parse.y"
           { eat_nl() ; BC_new() ;
             code_push((INST*)0,0, scope, active_funct) ;
           }
#line 2681 "y.tab.c"
    break;

  case 111: /* for3: expr RPAREN  */
#line 631 "parse.y"
           { INST *p1 = CDP((yyvsp[-1].start)) ;
           
             eat_nl() ; BC_new() ; 
             code1(_POP) ;
             code_push(p1, code_ptr - p1, scope, active_funct) ;
             code_ptr -= code_ptr - p1 ;
           }
#line 2693 "y.tab.c"
    break;

  case 112: /* expr: expr IN ID  */
#line 644 "parse.y"
           { check_array((yyvsp[0].stp)) ;
             code_array((yyvsp[0].stp)) ; 
             code1(A_TEST) ; 
            }
#line 2702 "y.tab.c"
    break;

  case 113: /* expr: LPAREN arg2 RPAREN IN ID  */
#line 649 "parse.y"
           { (yyval.start) = (yyvsp[-3].arg2p)->start ;
             code2op(A_CAT, (yyvsp[-3].arg2p)->cnt) ;
             zfree((yyvsp[-3].arg2p), sizeof(ARG2_REC)) ;

             check_array((yyvsp[0].stp)) ;
             code_array((yyvsp[0].stp)) ;
             code1(A_TEST) ;
           }
#line 2715 "y.tab.c"
    break;

  case 114: /* lvalue: ID mark LBOX args RBOX  */
#line 660 "parse.y"
           { 
             if ( (yyvsp[-1].ival) > 1 )
             { code2op(A_CAT, (yyvsp[-1].ival)) ; }

             check_array((yyvsp[-4].stp)) ;
             if( is_local((yyvsp[-4].stp)) )
             { code2op(LAE_PUSHA, (yyvsp[-4].stp)->offset) ; }
             else code2(AE_PUSHA, (yyvsp[-4].stp)->stval.array) ;
             (yyval.start) = (yyvsp[-3].start) ;
           }
#line 2730 "y.tab.c"
    break;

  case 115: /* p_expr: ID mark LBOX args RBOX  */
#line 673 "parse.y"
           { 
             if ( (yyvsp[-1].ival) > 1 )
             { code2op(A_CAT, (yyvsp[-1].ival)) ; }

             check_array((yyvsp[-4].stp)) ;
             if( is_local((yyvsp[-4].stp)) )
             { code2op(LAE_PUSHI, (yyvsp[-4].stp)->offset) ; }
             else code2(AE_PUSHI, (yyvsp[-4].stp)->stval.array) ;
             (yyval.start) = (yyvsp[-3].start) ;
           }
#line 2745 "y.tab.c"
    break;

  case 116: /* p_expr: ID mark LBOX args RBOX INC_or_DEC  */
#line 685 "parse.y"
           { 
             if ( (yyvsp[-2].ival) > 1 )
             { code2op(A_CAT,(yyvsp[-2].ival)) ; }

             check_array((yyvsp[-5].stp)) ;
             if( is_local((yyvsp[-5].stp)) )
             { code2op(LAE_PUSHA, (yyvsp[-5].stp)->offset) ; }
             else code2(AE_PUSHA, (yyvsp[-5].stp)->stval.array) ;
             if ( (yyvsp[0].ival) == '+' )  code1(_POST_INC) ;
             else  code1(_POST_DEC) ;

             (yyval.start) = (yyvsp[-4].start) ;
           }
#line 2763 "y.tab.c"
    break;

  case 117: /* statement: DELETE ID mark LBOX args RBOX separator  */
#line 702 "parse.y"
             { 
               (yyval.start) = (yyvsp[-4].start) ;
               if ( (yyvsp[-2].ival) > 1 ) { code2op(A_CAT, (yyvsp[-2].ival)) ; }
               check_array((yyvsp[-5].stp)) ;
               code_array((yyvsp[-5].stp)) ;
               code1(A_DEL) ;
             }
#line 2775 "y.tab.c"
    break;

  case 118: /* statement: DELETE ID separator  */
#line 710 "parse.y"
             {
                (yyval.start) = code_offset ;
                check_array((yyvsp[-1].stp)) ;
                code_array((yyvsp[-1].stp)) ;
                code1(DEL_A) ;
             }
#line 2786 "y.tab.c"
    break;

  case 119: /* array_loop_front: FOR LPAREN ID IN ID RPAREN  */
#line 721 "parse.y"
                    { eat_nl() ; BC_new() ;
                      (yyval.start) = code_offset ;

                      check_var((yyvsp[-3].stp)) ;
                      code_address((yyvsp[-3].stp)) ;
                      check_array((yyvsp[-1].stp)) ;
                      code_array((yyvsp[-1].stp)) ;

                      code2(SET_ALOOP, (INST*)0) ;
                    }
#line 2801 "y.tab.c"
    break;

  case 120: /* statement: array_loop_front statement  */
#line 735 "parse.y"
              { 
                INST *p2 = CDP((yyvsp[0].start)) ;

                p2[-1].op = code_ptr - p2 + 1 ;
                BC_clear( code_ptr+2 , code_ptr) ;
                code_jmp(ALOOP, p2) ;
                code1(POP_AL) ;
              }
#line 2814 "y.tab.c"
    break;

  case 121: /* field: FIELD  */
#line 752 "parse.y"
           { (yyval.start) = code_offset ; code2(F_PUSHA, (yyvsp[0].cp)) ; }
#line 2820 "y.tab.c"
    break;

  case 122: /* field: DOLLAR D_ID  */
#line 754 "parse.y"
           { 
             check_var((yyvsp[0].stp)) ;
             (yyval.start) = code_offset ;
             if ( is_local((yyvsp[0].stp)) )
             { code2op(L_PUSHI, (yyvsp[0].stp)->offset) ; }
             else code2(_PUSHI, (yyvsp[0].stp)->stval.cp) ;

             CODE_FE_PUSHA() ;
           }
#line 2834 "y.tab.c"
    break;

  case 123: /* field: DOLLAR D_ID mark LBOX args RBOX  */
#line 764 "parse.y"
           { 
             if ( (yyvsp[-1].ival) > 1 )
             { code2op(A_CAT, (yyvsp[-1].ival)) ; }

             check_array((yyvsp[-4].stp)) ;
             if( is_local((yyvsp[-4].stp)) )
             { code2op(LAE_PUSHI, (yyvsp[-4].stp)->offset) ; }
             else code2(AE_PUSHI, (yyvsp[-4].stp)->stval.array) ;

             CODE_FE_PUSHA()  ;

             (yyval.start) = (yyvsp[-3].start) ;
           }
#line 2852 "y.tab.c"
    break;

  case 124: /* field: DOLLAR p_expr  */
#line 778 "parse.y"
           { 
             (yyval.start) = (yyvsp[0].start) ;  CODE_FE_PUSHA() ; 
           }
#line 2860 "y.tab.c"
    break;

  case 125: /* field: LPAREN field RPAREN  */
#line 782 "parse.y"
           { (yyval.start) = (yyvsp[-1].start) ; }
#line 2866 "y.tab.c"
    break;

  case 126: /* p_expr: field  */
#line 786 "parse.y"
            { field_A2I() ; }
#line 2872 "y.tab.c"
    break;

  case 127: /* expr: field ASSIGN expr  */
#line 789 "parse.y"
                                 { code1(F_ASSIGN) ; }
#line 2878 "y.tab.c"
    break;

  case 128: /* expr: field ADD_ASG expr  */
#line 790 "parse.y"
                                 { code1(F_ADD_ASG) ; }
#line 2884 "y.tab.c"
    break;

  case 129: /* expr: field SUB_ASG expr  */
#line 791 "parse.y"
                                 { code1(F_SUB_ASG) ; }
#line 2890 "y.tab.c"
    break;

  case 130: /* expr: field MUL_ASG expr  */
#line 792 "parse.y"
                                 { code1(F_MUL_ASG) ; }
#line 2896 "y.tab.c"
    break;

  case 131: /* expr: field DIV_ASG expr  */
#line 793 "parse.y"
                                 { code1(F_DIV_ASG) ; }
#line 2902 "y.tab.c"
    break;

  case 132: /* expr: field MOD_ASG expr  */
#line 794 "parse.y"
                                 { code1(F_MOD_ASG) ; }
#line 2908 "y.tab.c"
    break;

  case 133: /* expr: field POW_ASG expr  */
#line 795 "parse.y"
                                 { code1(F_POW_ASG) ; }
#line 2914 "y.tab.c"
    break;

  case 134: /* p_expr: split_front split_back  */
#line 802 "parse.y"
            { code2(_BUILTIN, bi_split) ; }
#line 2920 "y.tab.c"
    break;

  case 135: /* split_front: SPLIT LPAREN expr COMMA ID  */
#line 806 "parse.y"
            { (yyval.start) = (yyvsp[-2].start) ;
              check_array((yyvsp[0].stp)) ;
              code_array((yyvsp[0].stp))  ;
            }
#line 2929 "y.tab.c"
    break;

  case 136: /* split_back: RPAREN  */
#line 813 "parse.y"
                { code2(_PUSHI, &fs_shadow) ; }
#line 2935 "y.tab.c"
    break;

  case 137: /* split_back: COMMA expr RPAREN  */
#line 815 "parse.y"
                { 
                  if ( CDP((yyvsp[-1].start)) == code_ptr - 2 )
                  {
                    if ( code_ptr[-2].op == _MATCH0 )
                        RE_as_arg() ;
                    else
                    if ( code_ptr[-2].op == _PUSHS )
                    { CELL *cp = ZMALLOC(CELL) ;

                      cp->type = C_STRING ;
                      cp->ptr = code_ptr[-1].ptr ;
                      cast_for_split(cp) ;
                      code_ptr[-2].op = _PUSHC ;
                      code_ptr[-1].ptr = (PTR) cp ;
                    }
                  }
                }
#line 2957 "y.tab.c"
    break;

  case 138: /* p_expr: ALENGTH_FUNC LPAREN ID RPAREN  */
#line 839 "parse.y"
        { 
	  check_array((yyvsp[-1].stp)) ;
	  code_array((yyvsp[-1].stp)) ;
          code2(_BUILTIN, bi_alength) ;
        }
#line 2967 "y.tab.c"
    break;

  case 139: /* p_expr: ASORT_FUNC mark LPAREN ID RPAREN  */
#line 849 "parse.y"
         { 
           (yyval.start) = (yyvsp[-3].start) ;
       	   check_array((yyvsp[-1].stp)) ;
 	   code_array((yyvsp[-1].stp)) ;
           code1(_PUSHINT) ; code1(1) ;
           code2(_BUILTIN, bi_asort) ; 
         }
#line 2979 "y.tab.c"
    break;

  case 140: /* p_expr: ASORT_FUNC mark LPAREN ID COMMA ID RPAREN  */
#line 857 "parse.y"
         { 
           (yyval.start) = (yyvsp[-5].start) ;
       	   check_array((yyvsp[-1].stp)) ;
 	   code_array((yyvsp[-1].stp)) ;
       	   check_array((yyvsp[-3].stp)) ;
 	   code_array((yyvsp[-3].stp)) ;
           code1(_PUSHINT) ; code1(2) ;
           code2(_BUILTIN, bi_asort) ; 
         }
#line 2993 "y.tab.c"
    break;

  case 141: /* p_expr: MATCH_FUNC LPAREN expr COMMA re_arg COMMA ID RPAREN  */
#line 871 "parse.y"
        { (yyval.start) = (yyvsp[-5].start) ; 
          check_array((yyvsp[-1].stp));
          code_array((yyvsp[-1].stp));
          code1(_PUSHINT); code1(3);
          code2(_BUILTIN, bi_match) ;
        }
#line 3004 "y.tab.c"
    break;

  case 142: /* p_expr: MATCH_FUNC LPAREN expr COMMA re_arg RPAREN  */
#line 878 "parse.y"
        { (yyval.start) = (yyvsp[-3].start) ; 
          code1(_PUSHINT); code1(2);
          code2(_BUILTIN, bi_match) ;
        }
#line 3013 "y.tab.c"
    break;

  case 143: /* re_arg: expr  */
#line 893 "parse.y"
             {
               INST *p1 = CDP((yyvsp[0].start)) ;

               if ( p1 == code_ptr - 2 ) 
               {
                 if ( p1->op == _MATCH0 ) RE_as_arg() ;
                 else
                 if ( p1->op == _PUSHS )
                 { CELL *cp = ZMALLOC(CELL) ;

                   cp->type = C_STRING ;
                   cp->ptr = p1[1].ptr ;
                   cast_to_RE(cp) ;
                   p1->op = _PUSHC ;
                   p1[1].ptr = (PTR) cp ;
                 } 
               }
             }
#line 3036 "y.tab.c"
    break;

  case 144: /* statement: EXIT separator  */
#line 916 "parse.y"
                    { (yyval.start) = code_offset ;
                      code1(_EXIT0) ; }
#line 3043 "y.tab.c"
    break;

  case 145: /* statement: EXIT expr separator  */
#line 919 "parse.y"
                    { (yyval.start) = (yyvsp[-1].start) ; code1(_EXIT) ; }
#line 3049 "y.tab.c"
    break;

  case 146: /* statement: ABORT separator  */
#line 921 "parse.y"
                    { (yyval.start) = code_offset ;
                      code1(_ABORT0) ; }
#line 3056 "y.tab.c"
    break;

  case 147: /* statement: ABORT expr separator  */
#line 924 "parse.y"
                    { (yyval.start) = (yyvsp[-1].start) ; code1(_ABORT) ; }
#line 3062 "y.tab.c"
    break;

  case 148: /* return_statement: RETURN separator  */
#line 927 "parse.y"
                    { (yyval.start) = code_offset ;
                      code1(_RET0) ; }
#line 3069 "y.tab.c"
    break;

  case 149: /* return_statement: RETURN expr separator  */
#line 930 "parse.y"
                    { (yyval.start) = (yyvsp[-1].start) ; code1(_RET) ; }
#line 3075 "y.tab.c"
    break;

  case 150: /* p_expr: getline  */
#line 936 "parse.y"
          { (yyval.start) = code_offset ;
            code2(F_PUSHA, &field[0]) ;
            code1(_PUSHINT) ; code1(0) ; 
            code2(_BUILTIN, bi_getline) ;
            getline_flag = 0 ;
          }
#line 3086 "y.tab.c"
    break;

  case 151: /* p_expr: getline fvalue  */
#line 943 "parse.y"
          { (yyval.start) = (yyvsp[0].start) ;
            code1(_PUSHINT) ; code1(0) ;
            code2(_BUILTIN, bi_getline) ;
            getline_flag = 0 ;
          }
#line 3096 "y.tab.c"
    break;

  case 152: /* p_expr: getline_file p_expr  */
#line 949 "parse.y"
          { code1(_PUSHINT) ; code1(F_IN) ;
            code2(_BUILTIN, bi_getline) ;
            /* getline_flag already off in yylex() */
          }
#line 3105 "y.tab.c"
    break;

  case 153: /* p_expr: p_expr COPROCESS GETLINE  */
#line 954 "parse.y"
          { code2(F_PUSHA, &field[0]) ;
            code1(_PUSHINT) ; code1(COP_IN) ;
            code2(_BUILTIN, bi_getline) ;
          }
#line 3114 "y.tab.c"
    break;

  case 154: /* p_expr: p_expr COPROCESS GETLINE fvalue  */
#line 959 "parse.y"
          { 
            code1(_PUSHINT) ; code1(COP_IN) ;
            code2(_BUILTIN, bi_getline) ;
          }
#line 3123 "y.tab.c"
    break;

  case 155: /* p_expr: p_expr PIPE GETLINE  */
#line 964 "parse.y"
          { code2(F_PUSHA, &field[0]) ;
            code1(_PUSHINT) ; code1(PIPE_IN) ;
            code2(_BUILTIN, bi_getline) ;
          }
#line 3132 "y.tab.c"
    break;

  case 156: /* p_expr: p_expr PIPE GETLINE fvalue  */
#line 969 "parse.y"
          { 
            code1(_PUSHINT) ; code1(PIPE_IN) ;
            code2(_BUILTIN, bi_getline) ;
          }
#line 3141 "y.tab.c"
    break;

  case 157: /* getline: GETLINE  */
#line 975 "parse.y"
                     { getline_flag = 1 ; }
#line 3147 "y.tab.c"
    break;

  case 160: /* getline_file: getline IO_IN  */
#line 980 "parse.y"
                 { (yyval.start) = code_offset ;
                   code2(F_PUSHA, field+0) ;
                 }
#line 3155 "y.tab.c"
    break;

  case 161: /* getline_file: getline fvalue IO_IN  */
#line 984 "parse.y"
                 { (yyval.start) = (yyvsp[-1].start) ; }
#line 3161 "y.tab.c"
    break;

  case 162: /* p_expr: gensub LPAREN re_arg COMMA expr COMMA expr gensub_back  */
#line 992 "parse.y"
           {
             INST *p5 = CDP((yyvsp[-3].start)) ;
             INST *p8 = CDP((yyvsp[0].start)) ;

             if ( p8 - p5 == 2 && p5->op == _PUSHS  )
             { /* cast from STRING to REPL at compile time */
               CELL *cp = ZMALLOC(CELL) ;
               cp->type = C_STRING ;
               cp->ptr = p5[1].ptr ;
               cast_to_REPL(cp) ;
               p5->op = _PUSHC ;
               p5[1].ptr = (PTR) cp ;
             }
             code2(_BUILTIN, (yyvsp[-7].fp)) ;
             (yyval.start) = (yyvsp[-5].start) ;
           }
#line 3182 "y.tab.c"
    break;

  case 163: /* gensub: GENSUB  */
#line 1010 "parse.y"
                  { (yyval.fp) = bi_gensub ; }
#line 3188 "y.tab.c"
    break;

  case 164: /* p_expr: sub_or_gsub LPAREN re_arg COMMA expr sub_back  */
#line 1014 "parse.y"
           {
             INST *p5 = CDP((yyvsp[-1].start)) ;
             INST *p6 = CDP((yyvsp[0].start)) ;

             if ( p6 - p5 == 2 && p5->op == _PUSHS  )
             { /* cast from STRING to REPL at compile time */
               CELL *cp = ZMALLOC(CELL) ;
               cp->type = C_STRING ;
               cp->ptr = p5[1].ptr ;
               cast_to_REPL(cp) ;
               p5->op = _PUSHC ;
               p5[1].ptr = (PTR) cp ;
             }
             code2(_BUILTIN, (yyvsp[-5].fp)) ;
             (yyval.start) = (yyvsp[-3].start) ;
           }
#line 3209 "y.tab.c"
    break;

  case 165: /* sub_or_gsub: SUB  */
#line 1032 "parse.y"
                    { (yyval.fp) = bi_sub ; }
#line 3215 "y.tab.c"
    break;

  case 166: /* sub_or_gsub: GSUB  */
#line 1033 "parse.y"
                    { (yyval.fp) = bi_gsub ; }
#line 3221 "y.tab.c"
    break;

  case 167: /* sub_back: RPAREN  */
#line 1038 "parse.y"
                { (yyval.start) = code_offset ;
                  code2(F_PUSHA, &field[0]) ; 
                }
#line 3229 "y.tab.c"
    break;

  case 168: /* sub_back: COMMA fvalue RPAREN  */
#line 1043 "parse.y"
                { (yyval.start) = (yyvsp[-1].start) ; }
#line 3235 "y.tab.c"
    break;

  case 169: /* gensub_back: RPAREN  */
#line 1047 "parse.y"
                { (yyval.start) = code_offset ;
                  code2(F_PUSHA, &field[0]) ; 
                }
#line 3243 "y.tab.c"
    break;

  case 170: /* gensub_back: COMMA p_expr RPAREN  */
#line 1051 "parse.y"
                { (yyval.start) = (yyvsp[-1].start) ; }
#line 3249 "y.tab.c"
    break;

  case 171: /* function_def: funct_start block  */
#line 1059 "parse.y"
                 { 
                   resize_fblock((yyvsp[-1].fbp)) ;
                   restore_ids() ;
                   switch_code_to_main() ;
                 }
#line 3259 "y.tab.c"
    break;

  case 172: /* funct_start: funct_head LPAREN f_arglist RPAREN  */
#line 1068 "parse.y"
                 { 
		   eat_nl() ;
                   scope = SCOPE_FUNCT ;
                   active_funct = (yyvsp[-3].fbp) ;
                   *main_code_p = active_code ;

                   (yyvsp[-3].fbp)->nargs = (yyvsp[-1].ival) ;
                   if ( (yyvsp[-1].ival) )
                        (yyvsp[-3].fbp)->typev = (char *)
                        memset( zmalloc((yyvsp[-1].ival)), ST_LOCAL_NONE, (yyvsp[-1].ival)) ;
                   else (yyvsp[-3].fbp)->typev = (char *) 0 ;

                   code_ptr = code_base =
                       (INST *) zmalloc(INST_BYTES(PAGESZ));
                   code_limit = code_base + PAGESZ ;
                   code_warn = code_limit - CODEWARN ;
                 }
#line 3281 "y.tab.c"
    break;

  case 173: /* funct_head: FUNCTION ID  */
#line 1088 "parse.y"
                 { FBLOCK  *fbp ;

                   if ( (yyvsp[0].stp)->type == ST_NONE )
                   {
                         (yyvsp[0].stp)->type = ST_FUNCT ;
                         fbp = (yyvsp[0].stp)->stval.fbp = 
                             (FBLOCK *) zmalloc(sizeof(FBLOCK)) ;
                         fbp->name = (yyvsp[0].stp)->name ;
                         fbp->code = (INST*) 0 ;
                   }
                   else
                   {
                         type_error( (yyvsp[0].stp) ) ;

                         /* this FBLOCK will not be put in
                            the symbol table */
                         fbp = (FBLOCK*) zmalloc(sizeof(FBLOCK)) ;
                         fbp->name = "" ;
                   }
                   (yyval.fbp) = fbp ;
                 }
#line 3307 "y.tab.c"
    break;

  case 174: /* funct_head: FUNCTION FUNCT_ID  */
#line 1111 "parse.y"
                 { 
		   (yyval.fbp) = (yyvsp[0].fbp) ; 
                   if ( (yyvsp[0].fbp)->code ) 
                       compile_error("redefinition of %s" , (yyvsp[0].fbp)->name) ;
                 }
#line 3317 "y.tab.c"
    break;

  case 175: /* f_arglist: %empty  */
#line 1118 "parse.y"
                          { (yyval.ival) = 0 ; }
#line 3323 "y.tab.c"
    break;

  case 177: /* f_args: ID  */
#line 1123 "parse.y"
              { 
		(yyvsp[0].stp) = save_id((yyvsp[0].stp)->name) ;
                (yyvsp[0].stp)->type = ST_LOCAL_NONE ;
                (yyvsp[0].stp)->offset = 0 ;
                (yyval.ival) = 1 ;
              }
#line 3334 "y.tab.c"
    break;

  case 178: /* f_args: f_args COMMA ID  */
#line 1130 "parse.y"
              { 
		if ( is_local((yyvsp[0].stp)) ) 
                  compile_error("%s is duplicated in argument list",
                    (yyvsp[0].stp)->name) ;
                else
                { (yyvsp[0].stp) = save_id((yyvsp[0].stp)->name) ;
                  (yyvsp[0].stp)->type = ST_LOCAL_NONE ;
                  (yyvsp[0].stp)->offset = (yyvsp[-2].ival) ;
                  (yyval.ival) = (yyvsp[-2].ival) + 1 ;
                }
              }
#line 3350 "y.tab.c"
    break;

  case 179: /* outside_error: error  */
#line 1144 "parse.y"
                 {  /* we may have to recover from a bungled function
                       definition */
                   /* can have local ids, before code scope
                      changes  */
                    restore_ids() ;

                    switch_code_to_main() ;
                 }
#line 3363 "y.tab.c"
    break;

  case 180: /* p_expr: FUNCT_ID mark call_args  */
#line 1157 "parse.y"
           { (yyval.start) = (yyvsp[-1].start) ;
             code2(_CALL, (yyvsp[-2].fbp)) ;

             if ( (yyvsp[0].ca_p) )  code1((yyvsp[0].ca_p)->arg_num+1) ;
             else  code1(0) ;
               
             check_fcall((yyvsp[-2].fbp), scope, code_move_level, active_funct, 
                         (yyvsp[0].ca_p), token_lineno) ;
           }
#line 3377 "y.tab.c"
    break;

  case 181: /* call_args: LPAREN RPAREN  */
#line 1169 "parse.y"
               { (yyval.ca_p) = (CA_REC *) 0 ; }
#line 3383 "y.tab.c"
    break;

  case 182: /* call_args: ca_front ca_back  */
#line 1171 "parse.y"
               { (yyval.ca_p) = (yyvsp[0].ca_p) ;
                 (yyval.ca_p)->link = (yyvsp[-1].ca_p) ;
                 (yyval.ca_p)->arg_num = (yyvsp[-1].ca_p) ? (yyvsp[-1].ca_p)->arg_num+1 : 0 ;
               }
#line 3392 "y.tab.c"
    break;

  case 183: /* ca_front: LPAREN  */
#line 1186 "parse.y"
              { (yyval.ca_p) = (CA_REC *) 0 ; }
#line 3398 "y.tab.c"
    break;

  case 184: /* ca_front: ca_front expr COMMA  */
#line 1188 "parse.y"
              { (yyval.ca_p) = ZMALLOC(CA_REC) ;
                (yyval.ca_p)->link = (yyvsp[-2].ca_p) ;
                (yyval.ca_p)->type = CA_EXPR  ;
                (yyval.ca_p)->arg_num = (yyvsp[-2].ca_p) ? (yyvsp[-2].ca_p)->arg_num+1 : 0 ;
                (yyval.ca_p)->call_offset = code_offset ;
              }
#line 3409 "y.tab.c"
    break;

  case 185: /* ca_front: ca_front ID COMMA  */
#line 1195 "parse.y"
              { (yyval.ca_p) = ZMALLOC(CA_REC) ;
                (yyval.ca_p)->link = (yyvsp[-2].ca_p) ;
                (yyval.ca_p)->arg_num = (yyvsp[-2].ca_p) ? (yyvsp[-2].ca_p)->arg_num+1 : 0 ;

                code_call_id((yyval.ca_p), (yyvsp[-1].stp)) ;
              }
#line 3420 "y.tab.c"
    break;

  case 186: /* ca_back: expr RPAREN  */
#line 1204 "parse.y"
              { (yyval.ca_p) = ZMALLOC(CA_REC) ;
                (yyval.ca_p)->type = CA_EXPR ;
                (yyval.ca_p)->call_offset = code_offset ;
              }
#line 3429 "y.tab.c"
    break;

  case 187: /* ca_back: ID RPAREN  */
#line 1210 "parse.y"
              { (yyval.ca_p) = ZMALLOC(CA_REC) ;
                code_call_id((yyval.ca_p), (yyvsp[-1].stp)) ;
              }
#line 3437 "y.tab.c"
    break;


#line 3441 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 1218 "parse.y"


/* resize the code for a user function */

static void  resize_fblock( fbp )
  FBLOCK *fbp ;
{ 
  CODEBLOCK *p = ZMALLOC(CODEBLOCK) ;
  unsigned dummy ;

  code2op(_RET0, _HALT) ;
        /* make sure there is always a return */

  *p = active_code ;
  fbp->code = code_shrink(p, &dummy) ;
      /* code_shrink() zfrees p */

  add_to_fdump_list(fbp) ;
}


/* convert FE_PUSHA  to  FE_PUSHI
   or F_PUSH to F_PUSHI
*/

static void  field_A2I()
{ CELL *cp ;

  if ( code_ptr[-1].op == FE_PUSHA &&
       code_ptr[-1].ptr == (PTR) 0)
  /* On most architectures, the two tests are the same; a good
     compiler might eliminate one.  On LM_DOS, and possibly other
     segmented architectures, they are not */
  { code_ptr[-1].op = FE_PUSHI ; }
  else
  {
    cp = (CELL *) code_ptr[-1].ptr ;

    if ( cp == field  ||
       ( cp > NF && cp <= LAST_PFIELD ))
    {
         code_ptr[-2].op = _PUSHI  ;
    }
    else if ( cp == NF )
    { code_ptr[-2].op = NF_PUSHI ; 
      code_ptr-- ; }

    else
    { 
      code_ptr[-2].op = F_PUSHI ;
      code_ptr -> op = field_addr_to_index( code_ptr[-1].ptr ) ;
      code_ptr++ ;
    }
  }
}

/* we've seen an ID in a context where it should be a VAR,
   check that's consistent with previous usage */

static void check_var( p )
  register SYMTAB *p ;
{
      switch(p->type)
      {
        case ST_NONE : /* new id */
            st_none:
            p->type = ST_VAR ;
            p->stval.cp = ZMALLOC(CELL) ;
            p->stval.cp->type = C_NOINIT ;
            break ;

        case ST_LOCAL_NONE :
            p->type = ST_LOCAL_VAR ;
            active_funct->typev[p->offset] = ST_LOCAL_VAR ;
            break ;

        case ST_VAR :
        case ST_LOCAL_VAR :  break ;

        case ST_BUILTIN :
            if (is_ext_builtin(p->name))
              goto st_none;

        default :
            type_error(p) ;
            break ;
      }
}

/* we've seen an ID in a context where it should be an ARRAY,
   check that's consistent with previous usage */
static  void  check_array(p)
  register SYMTAB *p ;
{
      switch(p->type)
      {
        case ST_NONE :  /* a new array */
            st_none:
            p->type = ST_ARRAY ;
            p->stval.array = new_ARRAY() ;
            break ;

        case  ST_ARRAY :
        case  ST_LOCAL_ARRAY :
            break ;

        case  ST_LOCAL_NONE  :
            p->type = ST_LOCAL_ARRAY ;
            active_funct->typev[p->offset] = ST_LOCAL_ARRAY ;
            break ;

        case ST_BUILTIN :
            if (is_ext_builtin(p->name))
              goto st_none;

        default : type_error(p) ; break ;
      }
}

static void code_array(p)
  register SYMTAB *p ;
{ 
  if ( is_local(p) ) code2op(LA_PUSHA, p->offset) ; 
  else  code2(A_PUSHA, p->stval.array) ;
}


/* we've seen an ID as an argument to a user defined function */

static void  code_call_id( p, ip )
  register CA_REC *p ;
  register SYMTAB *ip ;
{ static CELL dummy ;

  p->call_offset = code_offset ;
     /* This always get set now.  So that fcall:relocate_arglist
        works. */

  switch( ip->type )
  {
    case  ST_VAR  :
            p->type = CA_EXPR ;
            code2(_PUSHI, ip->stval.cp) ;
            break ;

    case  ST_LOCAL_VAR  :
            p->type = CA_EXPR ;
            code2op(L_PUSHI, ip->offset) ;
            break ;

    case  ST_ARRAY  :
            p->type = CA_ARRAY ;
            code2(A_PUSHA, ip->stval.array) ;
            break ;

    case  ST_LOCAL_ARRAY :
            p->type = CA_ARRAY ;
            code2op(LA_PUSHA, ip->offset) ;
            break ;

    /* not enough info to code it now; it will have to
       be patched later */

    case  ST_NONE :
            p->type = ST_NONE ;
            p->sym_p = ip ;
            code2(_PUSHI, &dummy) ;
            break ;

    case  ST_LOCAL_NONE :
            p->type = ST_LOCAL_NONE ;
            p->type_p = & active_funct->typev[ip->offset] ;
            code2op(L_PUSHI, ip->offset) ;
            break ;

  
#ifdef   DEBUG
    default :
            bozo("code_call_id") ;
#endif

  }
}

/* an RE by itself was coded as _MATCH0 , change to
   push as an expression */

static void RE_as_arg()
{ CELL *cp = ZMALLOC(CELL) ;

  code_ptr -= 2 ;
  cp->type = C_RE ;
  cp->ptr = code_ptr[1].ptr ;
  code2(_PUSHC, cp) ;
}

/* reset the active_code back to the MAIN block */
static void
switch_code_to_main()
{
   switch(scope)
   {
     case SCOPE_BEGIN :
        *begin_code_p = active_code ;
        active_code = *main_code_p ;
        break ;

     case SCOPE_END :
        *end_code_p = active_code ;
        active_code = *main_code_p ;
        break ;

     case SCOPE_FUNCT :
        active_code = *main_code_p ;
        break ;

     case SCOPE_MAIN :
        break ;
   }
   active_funct = (FBLOCK*) 0 ;
   scope = SCOPE_MAIN ;
}


void
parse()
{ 
   if ( yyparse() || compile_error_count != 0 ) exit(2) ;
   scan_cleanup() ;
   set_code() ; 

   /* code must be set before call to resolve_fcalls() */
   if ( resolve_list )  resolve_fcalls() ; 

   if ( compile_error_count != 0 ) exit(2) ;
   dump_code() ; 
}

