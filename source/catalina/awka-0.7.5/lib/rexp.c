/*------------------------------------------------------------*
 | rexp.c                                                     |
 | copyright 1999,  Andrew Sumner (andrewsumner@yahoo.com)    |
 |                                                            |
 | This is a source file for the awka package, a translator   |
 | of the AWK programming language to ANSI C.                 |
 |                                                            |
 | This library is free software; you can redistribute it     |
 | and/or modify it under the terms of the GNU General        |
 | Public License (GPL).                                      |
 |                                                            |
 | This library is distributed in the hope that it will be    |
 | useful, but WITHOUT ANY WARRANTY; without even the implied |
 | warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR    |
 | PURPOSE.                                                   |
 *------------------------------------------------------------*/

/*
 * The functions in this module act as a wrapper for calling
 * awka_regcomp(), and as a static storage for all compiled
 * regular expressions, preventing the same expression from
 * having to be compiled more than once.  The regexps are stored
 * in a fixed-size hash table.
 */

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>

#include "libawka.h"

typedef struct regexp_list_struct regexp_list;

extern unsigned int
_awka_hashstr( char *str, register int len );

struct regexp_list_struct {
  regexp_list *next;
  awka_regexp *re_nofs;
  awka_regexp *re_fs;
  awka_regexp *re_gsub;
  char *str;
  unsigned int hval;
};

regexp_list **re_list = NULL;
#define RE_LIST_SIZE 17

static char *
_awka_fixescapes(char *str, unsigned int len)
{
  static char *dest = NULL;
  static unsigned int alloc = 0;
  register char *p, *r;


  if (!dest)
    alloc = malloc(&dest, len+1);
  else if (alloc <= len)
    alloc = realloc(&dest, len+1);

  p = str; r = dest;
   
  do {
    *(r++) = *p;
    /*
    if (*p == '\\' && *(p+1) == '\\')
      p++;
      */
  } while (*(++p));
  *r = '\0';

  return dest;
}

awka_regexp *
awka_re_isexactstr(char *str, int len, unsigned can_be_null)
{
  register int i;
  static char meta[] = ".*+(){}[]|?\\";
  int found_meta = 0;
  int bol = 0, eol = 0;
  int advance = 0, end_adv = 0;
  awka_regexp *re = NULL;

  for (i=0; i<len; i++)
    if (strchr(meta, str[i]) != NULL)
      return NULL;

  if (str[0] == '/' && str[len-1] == '/')
  {
    advance = 1;
    end_adv = 2;
    if (len == 2)
      return NULL;
  }

  if (str[advance] == '^' && len - end_adv > 1)
    bol = REG_ISBOL;
  else if (strchr(str, '^') != NULL)
    return NULL;

  if (str[len-(1+advance)] == '$' && len - end_adv > 1)
    eol = REG_ISEOL;
  else if (strchr(str, '$') != NULL)
    return NULL;

  /* its an exact string, so we can handle as such */
  malloc( &re, sizeof(awka_regexp) );
  memset( re, 0, sizeof(awka_regexp) );
  
  re->strlen = len;
  re->isexact = 1;
  re->reganch |= bol | eol;
  re->can_be_null = can_be_null;
  malloc( &re->origstr, len+1 );
  strcpy( re->origstr, str );

  malloc( &re->buffer, len+1 );
  memset( re->buffer, 0, len+1 );
  
  switch (re->reganch)
  {
    case 0:
      strncpy( (char *) re->buffer, str+advance, len-end_adv ); break;
    case REG_ISBOL:
      strncpy( (char *) re->buffer, str+1+advance, len-(end_adv+1) ); break;
    case REG_ISEOL:
      strncpy( (char *) re->buffer, str+advance, len-(end_adv+1) ); break;
    case (REG_ISBOL | REG_ISEOL):
      strncpy( (char *) re->buffer, str+1+advance, len-(end_adv+2) ); break;
  }

  return re;
}

#define _return_re_SPLIT \
  if (list != re_list[idx]) \
  { \
    list->next = re_list[idx]; \
    re_list[idx] = list; \
  } \
  if (!(list->re_fs = awka_re_isexactstr(list->str, len, FALSE))) \
    list->re_fs = awka_regcomp(list->str, FALSE); \
  if (!list->re_fs) \
    awka_error("fail to compile regular expression '%s'\n",list->str); \
  list->re_fs->dfa = (void *) dfacomp(list->str, strlen(list->str), TRUE); \
  list->re_fs->cant_be_null = 1; \
  return list->re_fs; 

#define _return_re_MATCH \
  if (list != toplist) \
  { \
    list->next = toplist; \
    re_list[idx] = list; \
  } \
  if (!(list->re_nofs = awka_re_isexactstr(list->str, len, FALSE))) \
    list->re_nofs = awka_regcomp(list->str, FALSE); \
  if (!list->re_nofs) \
    awka_error("fail to compile regular expression '%s'\n",list->str); \
  list->re_nofs->dfa = (void *) dfacomp(list->str, strlen(list->str), TRUE); \
  return list->re_nofs; 

#define _return_re_GSUB \
  if (list != toplist) \
  { \
    list->next = toplist; \
    re_list[idx] = list; \
  } \
  if (!(list->re_gsub = awka_re_isexactstr(list->str, len, TRUE))) \
    list->re_gsub = awka_regcomp(list->str, TRUE); \
  if (!list->re_gsub) \
    awka_error("fail to compile regular expression '%s'\n",list->str); \
  list->re_gsub->dfa = (void *) dfacomp(list->str, strlen(list->str), TRUE); \
  return list->re_gsub; 


awka_regexp *
_awka_compile_regexp_SPLIT(char *str, unsigned int len)
{
  register unsigned int idx, hval;
  regexp_list *list = NULL, *prevlist = NULL;

  if (!str)
    return NULL;

  if (!re_list)
  {
    malloc(&re_list, RE_LIST_SIZE * sizeof(regexp_list *));
    memset(re_list, 0, RE_LIST_SIZE * sizeof(regexp_list *));
  }

  idx = (hval = _awka_hashstr(str, len)) % RE_LIST_SIZE;
  list = re_list[idx];

  while (list)
  {
    if (list->hval == hval)
    {
      if (!strncmp(str, list->str, len))
      {
        /* we have a match */
        if (list->re_fs)
        {
          if (list != re_list[idx])
          {
            prevlist->next = list->next;
            list->next = re_list[idx];
            re_list[idx] = list;
          }
          return list->re_fs;
        }
        if (prevlist)
          prevlist->next = list->next;

        _return_re_SPLIT;
      }
    }
    prevlist = list;
    list  = list->next;
  }

  /* this expression not yet created */
  malloc( &list, sizeof(regexp_list) );
  malloc( &list->str, len+1 );
  strcpy(list->str, str);
  list->re_fs = list->re_nofs = list->re_gsub = NULL;
  list->hval = hval;
  re_list[idx] = list;

  _return_re_SPLIT;
}


awka_regexp *
_awka_compile_regexp_MATCH(char *str, unsigned int len)
{
  register unsigned int idx, hval;
  regexp_list *list = NULL, *prevlist = NULL, *toplist;

  if (!str)
    return NULL;

  if (!re_list)
  {
    malloc(&re_list, RE_LIST_SIZE * sizeof(regexp_list *));
    memset(re_list, 0, RE_LIST_SIZE * sizeof(regexp_list *));
  }

  idx = (hval = _awka_hashstr(str, len)) % RE_LIST_SIZE;
  list = toplist = re_list[idx];

  while (list)
  {
    if (list->hval == hval)
    {
      if (!strncmp(str, list->str, len))
      {
        /* we have a match */
        if (list->re_nofs)
        {
          if (list != toplist)
          {
            prevlist->next = list->next;
            list->next = toplist;
            re_list[idx] = list;
          }
          return list->re_nofs;
        }
        if (prevlist)
          prevlist->next = list->next;

        _return_re_MATCH;
      }
    }
    prevlist = list;
    list  = list->next;
  }

  /* this expression not yet created */
  malloc( &list, sizeof(regexp_list) );
  malloc( &list->str, len+1 );
  strcpy(list->str, str);
  list->re_fs = list->re_nofs = list->re_gsub = NULL;
  list->hval = hval;
  re_list[idx] = list;

  _return_re_MATCH;
}


awka_regexp *
_awka_compile_regexp_GSUB(char *str, unsigned int len)
{
  register unsigned int idx, hval;
  regexp_list *list = NULL, *prevlist = NULL, *toplist;

  if (!str)
    return NULL;

  if (!re_list)
  {
    malloc(&re_list, RE_LIST_SIZE * sizeof(regexp_list *));
    memset(re_list, 0, RE_LIST_SIZE * sizeof(regexp_list *));
  }

  idx = (hval = _awka_hashstr(str, len)) % RE_LIST_SIZE;
  list = toplist = re_list[idx];

  while (list)
  {
    if (list->hval == hval)
    {
      if (!strncmp(str, list->str, len))
      {
        /* we have a match */
        if (list->re_gsub)
        {
          if (list != toplist)
          {
            prevlist->next = list->next;
            list->next = toplist;
            re_list[idx] = list;
          }
          return list->re_gsub;
        }
        if (prevlist)
          prevlist->next = list->next;

        _return_re_GSUB;
      }
    }
    prevlist = list;
    list  = list->next;
  }

  /* this expression not yet created */
  malloc( &list, sizeof(regexp_list) );
  malloc( &list->str, len+1 );
  strcpy(list->str, str);
  list->re_fs = list->re_nofs = list->re_gsub = NULL;
  list->hval = hval;
  re_list[idx] = list;

  _return_re_GSUB;
}

