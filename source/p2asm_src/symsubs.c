/*
 *
 * Copyright (c) 2018 by Dave Hein
 *
 * MIT License
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include "strsubs.h"
#include "symsubs.h"
#include "p2asmsym2.h"
#include "p2link.h"

extern int debugflag;
extern int listingflag;
extern int hubmode;
extern int hub_addr;
extern int cog_addr;
extern int numsym;
extern int case_sensative;
extern int undefined;
extern int allow_undefined;
extern FILE *lstfile;
extern int objflag;
extern int addifmissing;
extern int datamode;
static int numsym1 = 0;
static unsigned long minsequence = 0;
extern int v33mode;

extern SymbolT *SymbolTable;
//extern SymbolT SymbolTable[MAX_SYMBOLS];

void PrintError(char *str, ...);
int StrToDec1(char *str, int *is_float);
int CheckExpected(char *str, int i, char **tokens, int num);
int CheckForEOL(int i, int num);
void WriteObjectEntry(int type, int addr, char *str);

int dummy_printf(char *str, ...) {
   return 0;
}

// note - the hash function can only be used once numsysm1
// has been finalized - the PASM keywords are excluded from
// the hash mechanism.
//
// this hash function is a version of murmer_32
unsigned long hash_function_1(char * key, int case_sensitive) {
  unsigned long h  = 0xC613FC15; // 3323198485ul
  if (case_sensitive) {
     for (;*key;++key) {
       h ^= *key;
       h *= 0x5bd1e995;
       h ^= h >> 15;
     }
  }
  else {
     for (;*key;++key) {
       h ^= toupper(*key);
       h *= 0x5bd1e995;
       h ^= h >> 15;
     }
  }
  // return only numsym1 + 1 .. MAX_SYMBOLS - 2
  return (h % (MAX_SYMBOLS - 3 - numsym1)) + numsym1 + 1;
}

// this hash function is a version of jenkins_one_at_a_time
unsigned long hash_function_2(char* key, int case_sensitive) {
  unsigned long h = 0;
  if (case_sensitive) {
     for (;*key;++key) {
       h += *key;
       h += h << 10;
       h ^= h >> 6;
     }
     h += h << 3;
     h ^= h >> 11;
     h += h << 15;
  }
  else {
     for (;*key;++key) {
       h += toupper(*key);
       h += h << 10;
       h ^= h >> 6;
     }
     h += h << 3;
     h ^= h >> 11;
     h += h << 15;
  }
  return (h % (MAX_SYMBOLS - 3 - numsym1)) + numsym1 + 1;
}

#define hash_function hash_function_2

void ReadSymbolTable(void)
{
    int i;
    SymbolT *s;
    char temp_name[MAX_SYMBOL_LEN+1];

    for (i = 0; i < MAX_SYMBOLS; i++) {
       SymbolTable[i].ci_hash = 0;
       SymbolTable[i].cs_hash = 0;
       SymbolTable[i].next = 0;
       //SymbolTable[i].deleted = 0;
       SymbolTable[i].name[0] = 0;
    }
    s = &SymbolTable[0];
    s->name[0] = 0;
    s->value = 0;
    s->type = TYPE_CON;
    numsym = 1;
    //s = &SymbolTable[1];
    numsym1 = 2;

    for (i = 0; i < (sizeof(p2asmsym)/sizeof(p2asmsym[0])); i++)
    {
        char *nameptr;
        unsigned int type;
        int value,value2;
        if (!objflag && p2asmsym[i].name[0] == '.') break;
        value = p2asmsym[i].value;
        value2 = p2asmsym[i].value2;
        type = p2asmsym[i].type;
        nameptr = p2asmsym[i].name;

        if (v33mode)
        {
            if (!strcmp(nameptr, "rdlut")) // Check for rdlut, and change type if found
                type = TYPE_OP2PX;
            else if (!strcmp(nameptr, "wrlut")) // Check for wrlut, and change type if found
                type = TYPE_OP2CX;
        }
        else if (!strcmp(nameptr, "setscp") || !strcmp(nameptr, "getscp"))
            continue;
        // Prefix MODCZP symbols with "modczp" if generating an object file
        if (objflag && type == TYPE_MODCZP)
        {
            strcpy(temp_name, "modczp");
            strcat(temp_name, nameptr);
            nameptr = temp_name;
        }
        AddSymbol2(nameptr,0,value,value2,type,0);
    }
}

int isPurgedLocal(int i) {
   return ((SymbolTable[i].sequence < minsequence) 
        && (SymbolTable[i].name[0] == '.'));
}

int FindSymbolSlot(char *symbol, int *found, int *last)
{

    unsigned long ci_hash;
    unsigned long cs_hash;
    int current;
    int finished;
    int match;
    int i;

    // Search program symbols based on case_insensative flag
    ci_hash = hash_function(symbol, 0);
    current   = 0;
    finished  = 0;
    match     = 0;
    *found    = 0;
    *last     = 0;


    if (case_sensative) {
       cs_hash = hash_function(symbol, 1);
       current = ci_hash;
       while (!finished && !match) {
          if (SymbolTable[current].ci_hash == 0) {
             finished = 1;
          }
          else if (SymbolTable[current].cs_hash == cs_hash) {
             match = 1;
          }
          else {
             current = current++ % ((MAX_SYMBOLS - 3 - numsym1)) + numsym1 + 1;
          }
       }
       while (!finished) {
          if (SymbolTable[current].ci_hash != ci_hash) {
             printf("ERROR: Symbol Table corrupted\n");
             exit(1);
          }
          if (strcmp(symbol, SymbolTable[current].name)
               //&& !SymbolTable[current].deleted
               && !isPurgedLocal(current)) {
             *found = 1;
             finished = 1;
          }
          else {
             *last = current;
             if (SymbolTable[current].next == 0) {
                // just return any free entry
                for (i = MAX_SYMBOLS-2; i > numsym1+1; i--) {
                   if (SymbolTable[i].ci_hash == 0) {
                      current = i;
                      break;
                   }
                }
                finished = 1;
             }
             else {
                current = SymbolTable[current].next;
             }
          }
       }
       return current;
    }
    else {
       current = ci_hash;
       while (!finished && !match) {
          if (SymbolTable[current].ci_hash == 0) {
             finished = 1;
          }
          else if (SymbolTable[current].ci_hash == ci_hash) {
             match = 1;
          }
          else {
             current = current++ % ((MAX_SYMBOLS - 3 - numsym1)) + numsym1 + 1;
          }
       }
       while (!finished) {
          if (SymbolTable[current].ci_hash != ci_hash) {
             printf("ERROR: Symbol Table corrupted\n");
             exit(1);
          }
          if ((SymbolTable[current].ci_hash == ci_hash)
               &&  (StrCompNoCase(symbol, SymbolTable[current].name))
               //&& !SymbolTable[current].deleted
               && !isPurgedLocal(current)) {
             *found = 1;
             finished = 1;
          }
          else {
             *last = current;
             if (SymbolTable[current].next == 0) {
                // just return any free entry
                for (i = MAX_SYMBOLS-2; i > numsym1+1; i--) {
                   if (SymbolTable[i].ci_hash == 0) {
                      current = i;
                      break;
                   }
                }
                finished = 1;
             }
             else {
                current = SymbolTable[current].next;
             }
          }
       }
    }
    return current;
}

int FindNextEmptySlot(char *symbol, int *last,unsigned long ci_hash,unsigned long cs_hash)
{

    int current;
    int finished;
    int match;
    int i;

    // Search program symbols based on case_insensative flag
    ci_hash = hash_function(symbol, 0);
    cs_hash = hash_function(symbol, 1);
    current   = 0;
    finished  = 0;
    match     = 0;
    *last     = 0;


    if (case_sensative) {
       current = ci_hash;
       while (!finished && !match) {
          if (SymbolTable[current].ci_hash == 0) {
             finished = 1;
          }
          else if (SymbolTable[current].cs_hash == cs_hash) {
             match = 1;
          }
          else {
             current = current++ % ((MAX_SYMBOLS - 3 - numsym1)) + numsym1 + 1;
          }
       }
       while (!finished) {
          if (SymbolTable[current].ci_hash != ci_hash) {
             finished = 1;
          }
          *last = current;
          if (SymbolTable[current].next == 0) {
             // just return any free entry
             for (i = MAX_SYMBOLS-2; i > numsym1+1; i--) {
                if (SymbolTable[i].ci_hash == 0) {
                   current = i;
                   break;
                }
             }
             finished = 1;
          }
          else {
             current = SymbolTable[current].next;
          }
       }
       return current;
    }
    else {
       current = ci_hash;
       while (!finished && !match) {
          if (SymbolTable[current].ci_hash == 0) {
             finished = 1;
          }
          else if (SymbolTable[current].ci_hash == ci_hash) {
             match = 1;
          }
          else {
             current = current++ % ((MAX_SYMBOLS - 3 - numsym1)) + numsym1 + 1;
          }
       }
       while (!finished) {
          if (SymbolTable[current].ci_hash != ci_hash) {
             printf("ERROR: Symbol Table corrupted\n");
             exit(1);
          }
          *last = current;
          if (SymbolTable[current].next == 0) {
             // just return any free entry
             for (i = MAX_SYMBOLS-2; i > numsym1+1; i--) {
                if (SymbolTable[i].ci_hash == 0) {
                   current = i;
                   break;
                }
             }
             finished = 1;
          }
          else {
             current = SymbolTable[current].next;
          }
       }
    }
    return current;
}

int FindSymbol(char *symbol)
{
    int i;
    int last;
    int found;

    if (*symbol == '$')
    {
        if (symbol[1] == 0)
        {
            if (hubmode)
                SymbolTable[0].value = hub_addr;
            else
                SymbolTable[0].value = cog_addr >> 2;
        }
        else
            SymbolTable[0].value = StrToHex(symbol+1);
        SymbolTable[0].type = TYPE_CON;
        return 0;
    }
    else if (*symbol == '%')
    {
        if (symbol[1] == '%')
            SymbolTable[0].value = StrToQuad(symbol+2);
        else
            SymbolTable[0].value = StrToBin(symbol+1);
        SymbolTable[0].type = TYPE_CON;
        return 0;
    }
    else if (*symbol == '"')
    {
        SymbolTable[0].value = symbol[1];
        SymbolTable[0].type = TYPE_CON;
        return 0;
    }
    else if ((*symbol == '-' && symbol[1] != '-') || (*symbol >= '0' && *symbol <= '9'))
    {
        int is_float;
        SymbolTable[0].value = StrToDec1(symbol, &is_float);
        SymbolTable[0].type = (is_float ? TYPE_FLOAT : TYPE_CON);
        return 0;
    }

    /*
    // Do case insensative search for PASM symbols
    for (i = 0; i < numsym1; i++)
    {
        if (StrCompNoCase(symbol, SymbolTable[i].name)) {
          return i;
        }
    }
    */

    i = FindSymbolSlot(symbol, &found, &last);
    if (found) {
       return i;
    }

    if (objflag && addifmissing && strcmp(symbol, "_p2start"))
    {
        if (debugflag) printf("Need to add symbol %s\n", symbol);
        AddSymbol2(symbol, SECTION_NULL, 0, 0x400, TYPE_HUB_ADDR, datamode);
        SymbolTable[MAX_SYMBOLS-1].scope = SCOPE_UNDECLARED;
        return MAX_SYMBOLS - 1;
    } 

    return -1;
}

void PrintSymbolTable(int mode)
{
    int i;
    SymbolT *s;

    for (i = 0; i < MAX_SYMBOLS; i++)
    {
        s = &SymbolTable[i];
        if (s->ci_hash != 0) {
           if (mode || s->type == 20 || s->type == 39)
               printf("%d: %s %d %8.8x %8.8x %d %d\n",
                   i, s->name, s->type, s->value, s->value2, s->section, s->scope);
        }
    }
}

void AddSymbol2(char *symbol, int objsect, int value, int value2, int type, int section)
{
    int i;
    int last;
    unsigned long ci_hash;
    unsigned long cs_hash;

    if (numsym >= MAX_SYMBOLS)
    {
        printf("ERROR: Symbol table is full\n");
        exit(1);
    }
    if (strlen(symbol) > MAX_SYMBOL_LEN)
    {
        if (listingflag) {
            fprintf(lstfile, "Truncating %s to %d characters\n", symbol, MAX_SYMBOL_LEN);
        }
        symbol[MAX_SYMBOL_LEN] = 0;
    }
    ci_hash = hash_function(symbol, 0);
    cs_hash = hash_function(symbol, 1);

    // note that this allows duplicate symbols - this is necessary
    // for locals, which rely on being found in the sequence they
    // were added and being "purged" at the appropriate time when 
    // they are no longger current. Tricky.
    i = FindNextEmptySlot(symbol, &last,ci_hash,cs_hash);
    if (last == i) {
       printf("SYMBOL TABLE ERROR - TRY INCREASING SYMBOL TABLE SIZE!!\n");
    }
    SymbolTable[i].ci_hash = ci_hash;
    SymbolTable[i].cs_hash = cs_hash;
    if (last != 0) {
       SymbolTable[last].next = i;
    }
    strcpy(SymbolTable[i].name, symbol);
    SymbolTable[i].value = value;
    SymbolTable[i].value2 = value2;
    SymbolTable[i].type = type;
    SymbolTable[i].objsect = objsect;
    SymbolTable[i].section = section;
    SymbolTable[i].scope = 0;
    SymbolTable[i].sequence = numsym;
    numsym++;
}

void AddSymbol(char *symbol, int objsect, int value, int type, int section)
{
    AddSymbol2(symbol,objsect,value,0,type,section);
}

void PurgeLocalLabels(int index)
{
    int i;

    // instead of purging, which we only do for local variables,
    // we can just mark the minimum acceptable sequence number 
    // for valid locals - any locals with a sequence number
    // below this number are no longer considered valid
    minsequence = SymbolTable[index].sequence;
}

SymbolT *GetSymbolPointer(char *str)
{
    int index = FindSymbol(str);
    if (index < 0)
    {
        PrintError("ERROR: %s is undefined\n", str);
        return 0;
    }
    return &SymbolTable[index];
}

int CheckFloat(int *is_float, int is_float1)
{
    if (*is_float == -1)
    {
        *is_float = is_float1;
        return 0;
    }
    if (*is_float != is_float1)
    {
        PrintError("ERROR: Cannot mix float and fix\n");
        return 1;
    }
    return 0;
}

int EvaluateParenExpression(int *pindex, char **tokens, int num, int *pval, int *is_float)
{
    int errnum;
    int i = *pindex;

    if (CheckExpected("(", ++i, tokens, num)) { *pindex = i; return 1; }
    i++;
    if ((errnum = EvaluateExpression(12, &i, tokens, num, pval, is_float))) { *pindex = i; return errnum; }
    if (CheckExpected(")", ++i, tokens, num)) { *pindex = i; return 1; }

    *pindex = i;
    return 0;
}

static int bitrev(unsigned int val, int num)
{
    int i;
    int retval = 0;

    for (i = 0; i < num; i++)
    {
        retval = (retval << 1) | (val & 1);
        val >>= 1;
    }

    return retval;
}

int EvaluateExpression(int prevprec, int *pindex, char **tokens, int num, int *pval, int *is_float)
{
    int index;
    SymbolT *s;
    int i = *pindex;
    static char *oplist[] = {"+", "-", "*", "/", "&", "|", "<<", ">>", "^", "><", 0};
    static int precedence[] = {6, 6, 5, 5, 3, 4, 2, 2, 4, 2};
    int value = 0;
    int currprec;
    int value2;
    int errnum;
    int is_float1;

    if (CheckForEOL(i, num)) return 1;

    if (!strcmp(tokens[i], "("))
    {
        i--;
        if ((errnum = EvaluateParenExpression(&i, tokens, num, &value, is_float))) return errnum;
    }
    else
    {
        //int negate = 0;
        int getvalue = 1;
        int hub_addr_flag = 0;
        if (!strcmp(tokens[i], "@@@") || !strcmp(tokens[i], "@"))
        {
            if (CheckForEOL(++i, num))
            {
                *pindex = i;
                return 1;
            }
            hub_addr_flag = 1;
        }
        else if (!strcmp(tokens[i], "-"))
        {
#if 0
            negate = 1;
            if (CheckForEOL(++i, num))
            {
                *pindex = i;
                return 1;
            }
#else
            i++;
            if ((errnum = EvaluateExpression(1, &i, tokens, num, &value, is_float))) return errnum;
            if (*is_float)
                value ^= 0x80000000;
            else
                value = -value;
            getvalue = 0;
#endif
        }
        else if (!strcmp(tokens[i], "+"))
        {
            if (++i >= num)
            {
                printf("Encountered EOL\n");
                *pindex = i;
                return 1;
            }
        }
        else if (!strcmp(tokens[i], "float"))
        {
            float fvalue;
            int is_float1 = 0;

            if (CheckFloat(is_float, 1)) { *pindex = i; return 1; }
            if ((errnum = EvaluateParenExpression(&i, tokens, num, &value, &is_float1))) return errnum;
            fvalue = (float)value;
            memcpy(&value, &fvalue, 4);
            getvalue = 0;
        }
        else if (!strcmp(tokens[i], "trunc") || !strcmp(tokens[i], "round"))
        {
            float fvalue, fvalue1 = 0.0;
            int is_float1 = 1;

            if (tokens[i][0] == 'r') fvalue1 = 0.5;
            if (CheckFloat(is_float, 0)) { *pindex = i; return 1; }
            if ((errnum = EvaluateParenExpression(&i, tokens, num, &value, &is_float1))) return errnum;
            memcpy(&fvalue, &value, 4);
            value = (int)floor((double)(fvalue + fvalue1));
            getvalue = 0;
        }
        else if (!strcmp(tokens[i], "encod"))
        {
            int temp;
            int is_float1 = 0;
            i++;
            if ((errnum = EvaluateExpression(1, &i, tokens, num, &value, &is_float1))) return errnum;
            for (temp = 31; !(value & 0x80000000) && temp > 0; value <<= 1) temp--;
            value = temp;
            getvalue = 0;
            *is_float = 0;
        }
        else if (!strcmp(tokens[i], "|<"))
        {
            int is_float1 = 0;
            i++;
            if ((errnum = EvaluateExpression(1, &i, tokens, num, &value, &is_float1))) return errnum;
            value = 1 << value;
            getvalue = 0;
            *is_float = 0;
        }
        else if (!strcmp(tokens[i], ">|"))
        {
            int value1;
            int is_float1 = 0;
            i++;
            if ((errnum = EvaluateExpression(1, &i, tokens, num, &value1, &is_float1))) return errnum;
            for (value = 32; value > 0; value--)
            {
                if (value1 & 0x80000000) break;
                value1 <<= 1;
            }
            getvalue = 0;
            *is_float = 0;
        }
        else if (!strcmp(tokens[i], "!"))
        {
            i++;
            if ((errnum = EvaluateExpression(1, &i, tokens, num, &value, is_float))) return errnum;
               value = ~value;
            getvalue = 0;
        }
        if (getvalue)
        {
            index = FindSymbol(tokens[i]);
            if (index >= 0 && SymbolTable[index].type == TYPE_UCON) index = -1;
            if (index < 0)
            {
                undefined++;
                if (allow_undefined)
                    value = 0;
                else
                {
                    PrintError("ERROR: Symbol %s is undefined when evaluating an expression\n", tokens[i]);
#if 0
                    if (objflag)
                    {
                        printf("Need to add symbol\n");
                        AddSymbol2(tokens[i], 0, 0, 0, TYPE_HUB_ADDR, 0);
                        WriteObjectEntry('d', 0, tokens[i]);
                        value = 0;
                    }
                    else
#endif
                        return 3;
                }
            }
            else
            {
                s = &SymbolTable[index];
                is_float1 = (s->type == TYPE_FLOAT);
                if (CheckFloat(is_float, is_float1)) { *pindex = i; return 1; }
                if (hub_addr_flag || s->type == TYPE_HUB_ADDR)
                    value = s->value2;
#if 0
                else if (negate)
                {
                    if (is_float1)
                        value ^= 0x80000000;
                    else
                        value = -s->value;
                }
#endif
                else
                    value = s->value;
            }
        }
    }

    while (i < num - 2)
    {
        index = SearchList(oplist, tokens[i+1]);
        if (index < 0) break;
        currprec = precedence[index];
        if (currprec >= prevprec) break;
        i += 2;
        if ((errnum = EvaluateExpression(currprec, &i, tokens, num, &value2, is_float)))
            return errnum;
        if (*is_float)
        {
            float fvalue, fvalue2;
            memcpy(&fvalue, &value, 4);
            memcpy(&fvalue2, &value2, 4);
            if (index == 0)      fvalue += fvalue2;
            else if (index == 1) fvalue -= fvalue2;
            else if (index == 2) fvalue *= fvalue2;
            else if (index == 3) {
              if (fvalue2 == 0.0) {
                 PrintError("ERROR: Division by zero at Symbol %s\n", tokens[i]);
                 fvalue = 0.0;
              }
              else {
                 fvalue /= fvalue2;
              }
            }
            else
            {
                PrintError("ERROR: Operator '%s' is invalid for floating point\n", oplist[index]);
                break;
            }
            memcpy(&value, &fvalue, 4);
        }
        else
        {
            if (index == 0)      value += value2;
            else if (index == 1) value -= value2;
            else if (index == 2) value *= value2;
            else if (index == 3) {
              if (value2 == 0) {
                 PrintError("ERROR: Division by zero at Symbol %s\n", tokens[i]);
                 value = 0;
              }
              else {
                 value /= value2;
              }
            }
            else if (index == 4) value &= value2;
            else if (index == 5) value |= value2;
            else if (index == 6) value <<= value2;
            else if (index == 7) value >>= value2;
            else if (index == 8) value ^= value2;
            else if (index == 9) value = bitrev(value, value2);
            else break;
        }
    }

    *pval = value;
    *pindex = i;
    return 0;
}
