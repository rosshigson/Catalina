/*
 * Parallelizer functions to process propeller pragmas
 *
 * Compiled with AWKA 0.7.5
 *
 * Copyright (c) 2020 Ross Higson
 *
 * +----------------------------------------------------------------------------------------------------------------------+
 * |                                             TERMS OF USE: MIT License                                                |
 * +----------------------------------------------------------------------------------------------------------------------+
 * |Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated          |
 * |documentation files (the "Software"), to deal in the Software without restriction, including without limitation the   |
 * |rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit|
 * |persons to whom the Software is furnished to do so, subject to the following conditions:                              |
 * |                                                                                                                      |
 * |The above copyright notice and this permission notice shall be included in all copies or substantial portions of the  |
 * |Software.                                                                                                             |
 * |                                                                                                                      |
 * |THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE  |
 * |WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR |
 * |COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR      |
 * |OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.      |
 * +----------------------------------------------------------------------------------------------------------------------+
 */
#include "libawka.h"
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "parallelize_functions.h"

#define NO_BANNER

#define DEBUG 0

#define MAX_INST 20000

#define MAX_LINE 256

#define MAX_WORKERS 100

#define MAX_FACTORIES 16

#define MAX_EXCLUSIONS 16

#define MAX_VAR_NAME 256

struct worker_line {
   int    line_no;
   char   file[MAX_LINE];
   char   text[MAX_LINE];
   int    worker;
   struct worker_line *next;
};


struct known_worker {
   char   *name;
   char   *factory;
   char   *input;
   char   *local;
   char   *output;
   char   *when;
   char   *stack;
   char   *threads;
   char   *ticks;
   int    emitted;
   struct worker_line *line;
};

struct known_factory {
   char *name;
   char *foreman;
   char *lock;
   char *stack;
   char *cogs;
   int  emitted;
   int  started;
};

struct known_exclusion {
   char *name;
   int  emitted;
   int  lock;
   int  ext;
};

static int factory_count = 0;
static int worker_count = 0;
static int exclusion_count = 0;

static int dynamic_management = 0;

static int defines_emitted = 0;
static int prologue_emitted = 0;

static struct known_worker worker[MAX_WORKERS] = {
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL
};
static struct known_factory factory[MAX_FACTORIES] = { 
    NULL, NULL, NULL, NULL, NULL, 0, 0
};

static struct known_exclusion exclusion[MAX_EXCLUSIONS] = { 
    NULL, 0
};



void initialize_pragma_fn( a_VARARG *va ) {
   FILE *f;
   char line[MAX_LINE];
   char name[MAX_LINE];
   int  s;
   int  i, j;

   if (va->used > 0) {
     awka_error("function initialize_pragma expected no arguments, got %d.\n", 
       va->used);
   }

   #ifndef NO_BANNER
   fprintf(stderr, "Catalina Parallelizer 4.9\n");
   #endif

   worker[0].name    = "__main";
   worker[0].factory = "";
   worker[0].input   = "";
   worker[0].local   = "";
   worker[0].output  = "";
   worker[0].when    = "";
   worker[0].stack   = "";
   worker[0].threads = "";
   worker[0].ticks   = "";
   worker[0].emitted = 0;
   worker_count++;
}

void add_line_to_worker_fn( a_VARARG *va ) {
   char *name;
   char *text;
   char *file;
   char *line_no;
   struct worker_line *newtext;
   struct worker_line *last;
   struct worker_line *line;
   int i;

   if (va->used < 2) {
      awka_error("function add_line_to_worker - not enough arguments\n");
   }

   name    = awka_gets(va->var[0]);
   text    = awka_gets(va->var[1]);
   file    = awka_gets(va->var[2]);
   line_no = awka_gets(va->var[3]);
#if DEBUG      
   printf("adding line to %s: %s\n", name, text);
#endif      
   for (i = 0; i < worker_count; i++) {
      if (worker[i].name == NULL) {
         break; 
      }
      if (strcmp(worker[i].name, name) == 0) {
         break;
      }
   }
   if (i < worker_count) {
      malloc(&newtext, sizeof(struct worker_line));
      if (newtext == NULL) {
         printf("out of memory\n");
         return;
      }
      strncpy(newtext->file, file, MAX_LINE);
      sscanf(line_no, "%d", &newtext->line_no);
      newtext->worker = -1;
      newtext->next = NULL;
      strncpy(newtext->text, text, MAX_LINE);
      last = NULL;
      line = worker[i].line;
      while (line != NULL) {
         last = line;
         line = line->next;
      }
      if (last == NULL) {
         worker[i].line = newtext;
      }
      else {
         last->next = newtext;
      }
   }
   else {
#if DEBUG      
      printf("cannot find worker %s\n", name);
#endif      
   }
}

// point to the next variable name in the list 'vars', starting at the specified
// index, and return a pointer to it. Indicate its length by updating 'len'.
// Return NULL if there are no more variable names. Start by calling this function
// with index 0, and keep calling it until it returns NULL
char *enumerate_vars(char *vars, int *index, int *len) {
   int original_index;
   int i;
   int j;
   int k;

#if DEBUG
   printf("enumerating from '%s', starting at index %d\n", vars, *index);
#endif

   original_index = *index;
   if ((vars == NULL) || (vars[*index] == '\0')) {
      return NULL;
   }
   i = *index;
   while ((vars[*index] != ';') && (vars[*index] != '\0')) {
      (*index)++;
   }
   i = *index;
   j = i;
   while ((j > original_index) && (vars[j-1] != ' ')) {
      j--;
   }
   *len = i-j;
#if DEBUG
   printf("j=%d\n", j);
   printf("len=%d\n", *len);
#endif
#if DEBUG
   for (k = j; k < j + *len; k++) {
      printf("%c", vars[k]);
   }
   printf("\n");
#endif
   if (vars[*index] == ';') {
      (*index)++;
   }
   return &vars[j];
}

void emit_defines(void) {
   int j;

   if (defines_emitted == 0) {

      printf("#ifndef ANY_COG\n");
      printf("#ifdef __CATALINA_P2\n");
      printf("#define ANY_COG 16\n");
      printf("#else\n");
      printf("#define ANY_COG 8\n");
      printf("#endif\n");
      printf("#endif\n\n");
      printf("#ifndef __PARALLELIZED\n");
      printf("#define __PARALLELIZED\n");
      printf("#endif\n\n");
      if (dynamic_management) {
         printf("#ifndef __PARALLELIZE_DYNAMIC\n");
         printf("#define __PARALLELIZE_DYNAMIC\n");
         printf("#endif\n\n");
      }

      printf("#if defined(__CATALINA__) && !defined(CUSTOM_THREADS)\n");
      printf("#include <threads.h>\n");
      printf("#elif defined(LOCAL_THREADS)\n");
      printf("#include \"custom_threads.h\"\n");
      printf("#else\n");
      printf("#include <custom_threads.h>\n");
      printf("#endif\n\n");
      printf("#ifndef _THREAD\n");
      printf("#define _THREAD _thread\n");
      printf("#endif\n\n");
      printf("#ifndef _THREAD_YIELD\n");
      printf("#define _THREAD_YIELD() _thread_yield()\n");
      printf("#endif\n\n");
      printf("#ifndef _THREAD_FUNCTION\n");
      printf("#define _THREAD_FUNCTION(f) static int f(int argc, char *argv[])\n");
      printf("#endif\n\n");
      printf("#ifndef _THREADED_COG\n");
      printf("#define _THREADED_COG(thread, stack, stack_size) _thread_cog(thread, stack+stack_size, 0, NULL)\n");
      printf("#endif\n\n");
      printf("#ifndef _THREAD_ON_COG\n");
      printf("#define _THREAD_ON_COG(thread, stack, size, cog, argc, ticks)  _thread_on_cog(thread, stack, size, cog, argc, ticks) \n");
      printf("#endif\n\n");
      printf("#ifndef _THREAD_SET_LOCK\n");
      printf("#define _THREAD_SET_LOCK _thread_set_lock\n");
      printf("#endif\n\n");
      printf("#ifndef _THREAD_GET_LOCK\n");
      printf("#define _THREAD_GET_LOCK _thread_get_lock\n");
      printf("#endif\n\n");
      printf("#ifndef _LOCKSET\n");
      printf("#define _LOCKSET _lockset\n");
      printf("#endif\n\n");
      printf("#ifndef _LOCKCLR\n");
      printf("#define _LOCKCLR _lockclr\n");
      printf("#endif\n\n");
      printf("#ifndef _LOCKNEW\n");
      printf("#define _LOCKNEW _locknew\n");
      printf("#endif\n\n");
      printf("#ifndef _COGSTOP\n");
      printf("#define _COGSTOP _cogstop\n");
      printf("#endif\n\n");
      printf("#ifndef _UNREGISTER\n");
      printf("#define _UNREGISTER _unregister_plugin\n");
      printf("#endif\n\n");

      defines_emitted = 1;
   }
}

void emit_prologue(void) {
   int j;

   if (prologue_emitted == 0) {

      emit_defines();

      printf("// structure to hold worker data\n");
      printf("struct _worker_struct {\n");
      printf("   long    *stack;\n");
      printf("   void    *worker;\n");
      printf("   struct _worker_struct *next;\n");
      printf("};\n\n");
      printf("typedef struct _worker_struct WORKER;\n\n");
      printf("// structure to hold factory data\n");
      printf("struct _factory_struct {\n");
      printf("   int     cogs[ANY_COG];\n");
      printf("   int     cog_count;\n");
      printf("   int     last_used;\n");
      printf("   long   *stack[ANY_COG];\n");
      printf("   WORKER *workers;\n");
      printf("};\n\n");
      printf("typedef struct _factory_struct FACTORY;\n\n");
      printf("static void _create_factory(FACTORY *factory, long *fs, _THREAD foreman, int num_cogs, int stack_size, int lock) {\n");
      printf("   int i;\n\n");
      printf("   for (i = 0; i < ANY_COG; i++) {\n");
      printf("      factory->cogs[i] = -1;\n");
      printf("      factory->stack[i] = NULL;\n");
      printf("   }\n");
      printf("   factory->last_used = 0;\n");
      printf("   factory->cog_count = 0;\n");
      printf("   factory->workers   = NULL;\n");
      printf("   // start the multi-threading kernels\n");
      printf("   for (i = 0; i < num_cogs; i++) {\n");
      printf("      factory->stack[i] = &fs[stack_size*i];\n");
      printf("      factory->cogs[i] = _THREADED_COG(foreman, &fs[stack_size*(i)], stack_size);\n");
      printf("      if (factory->cogs[i] >= 0) {\n");
      printf("         factory->cog_count++;\n");
      printf("         factory->last_used = i;\n");
      printf("      }\n");
      printf("   }\n");
      printf("}\n\n");
      printf("static void _create_worker(FACTORY *factory, _THREAD worker, WORKER *fw, long *ws, int stack_size, int ticks, int argc) {\n");
      printf("   void   *w = NULL;\n\n");
      printf("   if (factory != NULL) {\n");
      printf("      if (factory->cog_count > 0) {\n");
      printf("         fw->stack = ws;\n");
      printf("         fw->next = factory->workers;\n");
      printf("         factory->workers = fw;\n");
      printf("         while (factory->cogs[factory->last_used] < 0) {\n");
      printf("            factory->last_used = (factory->last_used + 1)%%ANY_COG;\n");
      printf("         }\n");
      printf("#if defined (__CATALINA__) && !defined(CUSTOM_THREADS)\n");
      printf("         w = _thread_start(worker, ws + stack_size, argc, NULL);\n");
      printf("         fw->worker = w;\n");
      printf("         if (w != NULL) {\n");
      printf("            if (ticks > 0) {\n");
      printf("               _thread_ticks(w, ticks);\n");
      printf("            }\n");
      printf("            _thread_affinity_change(w, factory->cogs[factory->last_used]);\n");
      printf("         }\n");
      printf("#else\n");
      printf("         fw->worker = _THREAD_ON_COG(worker,\n");
      printf("                                     ws,\n");
      printf("                                     stack_size,\n");
      printf("                                     factory->cogs[factory->last_used],\n");
      printf("                                     argc,\n");
      printf("                                     ticks);\n");
      printf("#endif\n");
      printf("         factory->last_used = (factory->last_used + 1)%%ANY_COG;\n");
      printf("         // give the affinity change an opportunity to be processed ...\n");
      printf("         _THREAD_YIELD();\n");
      printf("      }\n");
      printf("   }\n");
      printf("}\n\n");
      for (j = 0; j < exclusion_count; j++) {
         if (exclusion[j].name != NULL) {
            if (exclusion[j].lock) {
               printf("int _exclusion_%s = -1;\n\n", exclusion[j].name);
            }
            else if (exclusion[j].ext) {
               printf("extern int _exclusion_%s;\n\n", exclusion[j].name);
            }
            else {
               printf("static int _exclusion_%s = -1;\n\n", exclusion[j].name);
            }
            printf("static void _exclusive_%s(void) {\n", exclusion[j].name);
            printf("   if (_exclusion_%s < 0) {\n", exclusion[j].name);
            printf("      _exclusion_%s = _LOCKNEW();\n", exclusion[j].name);
            printf("   }\n");
            printf("   if (_exclusion_%s >= 0) {\n", exclusion[j].name);
            printf("      do { _THREAD_YIELD(); } while (!_LOCKSET(_exclusion_%s));\n", exclusion[j].name);
            printf("   }\n");
            printf("}\n\n");
            printf("static void _shared_%s(void) {\n", exclusion[j].name);
            printf("   if (_exclusion_%s >= 0) {\n", exclusion[j].name);
            printf("      _LOCKCLR(_exclusion_%s);\n", exclusion[j].name);
            printf("   }\n");
            printf("}\n\n");
         }
      }

      prologue_emitted = 1;
   }
}

void emit_factory_code(char *name, int line_no, char *file) {
   int i, j, k;

   for (i = 0; i < factory_count; i++) {
      if (factory[i].name == NULL) {
         break; 
      }
      if (strcmp(factory[i].name, name) == 0) {
         break;
      }
   }
   if ((factory[i].name != NULL) && (factory[i].emitted == 0)) {

      emit_prologue();

      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("_THREAD_FUNCTION(%s);\n\n", factory[i].foreman);
      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("static FACTORY *_factory_%s;\n\n", factory[i].name);
      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("static long    *_f_stack_%s;\n\n", factory[i].name);

      if (strcmp(factory[i].lock, "_kernel_lock") == 0) {
         printf("#ifndef __CUSTOM_LOCK\n");
         printf("#ifndef _KERNEL_LOCK_DEFINED\n");
         printf("#define _KERNEL_LOCK_DEFINED\n");
         printf("static int _kernel_lock = -1;\n");
         printf("#endif\n");
         printf("#endif\n\n");
      }

      if (strcmp(factory[i].foreman, "_foreman") == 0) {
         printf("#ifndef _FOREMAN_DEFINED\n");
         printf("#define _FOREMAN_DEFINED\n");
         printf("// the foreman runs when no other threads are running\n");
         printf("_THREAD_FUNCTION(_foreman) {\n");
         // set line number in case of error in the following line
         printf("   #line %d \"%s\"\n", line_no, file);
         printf("   _THREAD_SET_LOCK(%s);\n", factory[i].lock);
         printf("   while (1) {\n");
         printf("      _THREAD_YIELD();\n");
         printf("   }\n");
         printf("   return 0;\n");
         printf("}\n");
         printf("#endif\n\n");
      }

      for (j = 0; j < worker_count; j++) {
         if (strcmp(worker[j].factory, name) == 0) {
            printf("void _start_worker_%s();\n\n", worker[j].name);
         }
      }

      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("void _start_factory_%s() {\n", name);
      printf("#ifndef __PARALLELIZE_DYNAMIC\n");
      printf("   static FACTORY my_factory;\n");
      // set line number in case of error in the following line
      printf("   #line %d \"%s\"\n", line_no, file);
      printf("   static long    my_f_stack[(%s)*(%s)];\n",
             factory[i].cogs, factory[i].stack);
      printf("#endif\n\n");
      if (strcmp(factory[i].lock, "_kernel_lock") == 0) {
         // set line number in case of error in the following line
         printf("   #line %d \"%s\"\n", line_no, file);
         printf("   if (%s <= 0) {\n", factory[i].lock);
         printf("      // assign a lock to avoid context switch contention \n");
         // set line number in case of error in the following line
         printf("   #line %d \"%s\"\n", line_no, file);
         printf("      %s = _LOCKNEW();\n", factory[i].lock);
         printf("      _THREAD_SET_LOCK(%s);\n", factory[i].lock);
         printf("   }\n");
      }
      for (j = 0; j < exclusion_count; j++) {
         if (exclusion[j].name != NULL) {
            printf("   if (_exclusion_%s < 0) {\n", exclusion[j].name);
            printf("      _exclusion_%s = _LOCKNEW();\n", exclusion[j].name);
            printf("   }\n");
         }
      }

      printf("#ifdef __PARALLELIZE_DYNAMIC\n");
      printf("   _factory_%s = (void *)malloc(sizeof(FACTORY));\n",
             factory[i].name);
      // set line number in case of error in the following line
      printf("   #line %d \"%s\"\n", line_no, file);
      printf("   _f_stack_%s = (void *)malloc((%s)*(%s)*4);\n", 
             factory[i].name, factory[i].cogs, factory[i].stack);
      printf("   if (_factory_%s == NULL) {\n", factory[i].name);
      printf("       exit(1);\n");
      printf("   }\n");
      printf("   if (_f_stack_%s == NULL) {\n", factory[i].name);
      printf("       exit(1);\n");
      printf("   }\n");
      printf("#else\n");
      printf("   _factory_%s = &my_factory;\n", factory[i].name);
      printf("   _f_stack_%s = my_f_stack;\n", factory[i].name); 
      printf("#endif\n");
      // set line number in case of error in the following line
      printf("   #line %d \"%s\"\n", line_no, file);
      printf("   _create_factory(_factory_%s, _f_stack_%s, %s, %s, %s, %s);\n", 
             factory[i].name,factory[i].name, factory[i].foreman, 
             factory[i].cogs, factory[i].stack, factory[i].lock);

      for (k = 0; k < worker_count; k++) {
         if (strcmp(worker[k].factory, name) == 0) {
            printf("   _start_worker_%s();\n", worker[k].name);
         }
      }

      printf("}\n\n");

      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("void _stop_factory_%s() {\n", name);
      printf("   int i;\n");
      printf("   int cog;\n");
      printf("   int lock;\n");
      printf("   long *fs;\n");
      printf("   void *w;\n");
      printf("   WORKER *fw;\n\n");
      printf("   lock = _THREAD_GET_LOCK();\n");
      printf("   if (lock >= 0) {\n");
      printf("      // loop till we get the global thread lock\n");
      printf("      do { _THREAD_YIELD(); } while (!_LOCKSET(lock));\n\n");
      printf("   }\n");
      printf("   // stop the multi-threading kernels\n");
      printf("   for (i = 0; i < ANY_COG; i++) {\n");
      printf("      if ((cog = _factory_%s->cogs[i]) >= 0) {\n", name);
      printf("          _COGSTOP(cog);\n");
      printf("          _UNREGISTER(cog);\n");
      printf("      }\n");
      printf("   }\n");
      printf("#ifdef __PARALLELIZE_DYNAMIC\n");
      printf("   // free the factory workers structure and stacks\n");
      printf("   while (_factory_%s->workers != NULL) {\n", name);
      printf("      fw = _factory_%s->workers;\n", name);
      printf("      fs = fw->stack;\n");
      printf("      _factory_%s->workers = fw->next;\n", name);
      printf("      free(fw);\n");
      printf("      free(fs);\n");
      printf("   }\n");
      printf("   if (_factory_%s != NULL) {\n", name);
      printf("      free(_factory_%s);\n", name);
      printf("   }\n");
      printf("   if (_f_stack_%s != NULL) {\n", name);
      printf("      free(_f_stack_%s);\n", name);
      printf("   }\n");
      printf("#endif\n");
      printf("   _factory_%s = NULL;\n", name);
      printf("   _f_stack_%s = NULL;\n", name);
      printf("   _LOCKCLR(lock);\n\n");
      printf("}\n");

      factory[i].emitted = 1;
   }
}

void emit_exclusive_code(char *name, int line_no, char *file);
void emit_shared_code(char *name, int line_no, char *file);

void emit_worker_code(char *name, int line_no, char *file) {
   struct worker_line *line;
   int i, j, k;
   int index, len;
   char *var;
   char var_name[MAX_VAR_NAME+1];
   char *indent="";

   for (i = 0; i < worker_count; i++) {
      if (worker[i].name == NULL) {
         break; 
      }
      if (strcmp(worker[i].name, name) == 0) {
         break;
      }
   }
   if ((worker[i].name != NULL) 
   &&  (worker[i].emitted == 0) 
   &&  (worker[i].line != NULL)) {

      emit_prologue();

      for (j = 0; i < factory_count; j++) {
         if (factory[j].name == NULL) {
            break; 
         }
         if (strcmp(factory[j].name, worker[i].factory) == 0) {
            break;
         }
      }
      if (factory[j].name != NULL) {
          emit_factory_code(factory[j].name, line_no, file);
      }

      printf("// structure to hold input and output variables for %s\n", name);
      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("struct _%s_parameters {\n", name);
      if ((strlen(worker[i].input) > 0) 
      &&  (strcmp(worker[i].input, "void") != 0)) {
         // set line number in case of error in the following line
         printf("   #line %d \"%s\"\n", line_no, file);
         printf("   %s;\n", worker[i].input);
      }
      if (strlen(worker[i].output) > 0) {
         // set line number in case of error in the following line
         printf("   #line %d \"%s\"\n", line_no, file);
         printf("   %s;\n", worker[i].output);
      }
      printf("   int _status;\n");
      printf("};\n\n");

      printf("// parameters for %s\n", name);
      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("static struct _%s_parameters _%s_param[%s];\n\n", 
             name, name, worker[i].threads);

      printf("// code for %s thread\n", name);
      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("_THREAD_FUNCTION(_%s) {\n", name);
      printf("#ifdef _GET_ID_FUNCTION\n");
      printf("   int id = _GET_ID_FUNCTION(\"%s\");\n", name);
      printf("#else\n");
      printf("   int id = (int)argc;\n");
      printf("#endif\n");
      if ((strlen(worker[i].input) > 0) 
      &&  (strcmp(worker[i].input, "void") != 0)) {
         printf("   %s;\n", worker[i].input);
      }
      if ((strlen(worker[i].local) > 0) 
      &&  (strcmp(worker[i].local, "void") != 0)) {
         printf("   ");
         for (k = 0; k < strlen(worker[i].local); k++) {
            if (worker[i].local[k] == ';') {
               printf(" = 0; ");
            }
            else {
               printf("%c", worker[i].local[k]);
            }
         }
         printf(" = 0;\n\n");
      }
      printf("   while (1) {\n");
      printf("      while ((_%s_param[id]._status) == 0) {\n", name);
      printf("         _THREAD_YIELD();\n");
      printf("      }\n");

      index = 0;
      len = 0;
      var = NULL;
      do {
         var = enumerate_vars(worker[i].input, &index, &len);
         if ((var != NULL) && (strcmp(var, "void") != 0)) {
            for (j = 0; j < len; j++) {
               if (var[j] == '*') {
                  var_name[j] = ' ';
               }
               else {
                  var_name[j] = var[j];
               }
            }
            var_name[j]='\0';
            // set line number in case of error in the following line
            printf("      #line %d \"%s\"\n", line_no, file);
            printf("      %s = _%s_param[id].%s;\n", var_name, name, var_name);
#if DEBUG      
            printf("var name = %s\n", var_name);
#endif
         }
      } while (var != NULL);

      printf("      // begin thread code segment\n");

      line = worker[i].line;
      // set line number in case of error in the following lines
      printf("      #line %d \"%s\"\n", line->line_no, line->file);
      while (line != NULL) {
         if (strcmp(line->text, "##exclusive##") == 0) {
             line = line->next;
             emit_exclusive_code(line->text, line->line_no, line->file);
             if (line->next != NULL) {
                printf("      #line %d \"%s\"\n", line->next->line_no, line->next->file);
             }
         }
         else if (strcmp(line->text, "##shared##") == 0) {
             line = line->next;
             emit_shared_code(line->text, line->line_no, line->file);
             if (line->next != NULL) {
                printf("      #line %d \"%s\"\n", line->next->line_no, line->next->file);
             }
         }
	 else {
            printf("      %s\n", line->text);
	 }
         line = line->next;
      }

      printf("      // end thread code segment\n");

      index = 0;
      len = 0;
      var = NULL;
      if (strcmp(worker[i].when, "") != 0) {
         // set line number in case of error in the following line
         printf("      #line %d \"%s\"\n", line_no, file);
         printf("      if (%s) {\n", worker[i].when);
         indent = "     ";
      } 
      do {
         var = enumerate_vars(worker[i].output, &index, &len);
         if ((var != NULL) && (strcmp(var, "void") != 0)) {
            for (j = k = 0; j < len; j++) {
               if (var[j] != '*') {
                  var_name[k] = var[j];
                  k++;
               }
            }
            var_name[k]='\0';
            // set line number in case of error in the following line
            printf("%s      #line %d \"%s\"\n", indent, line_no, file);
            printf("%s      *(_%s_param[id].%s) = %s;\n", 
                   indent, name, var_name, var_name);
#if DEBUG      
            printf("var name = %s\n", var_name);
#endif
         }
      } while (var != NULL);
      if (strcmp(worker[i].when, "") != 0) {
         printf("      }\n");
      } 

      printf("      _%s_param[id]._status = 0;\n", name);
      printf("   }\n");
      printf("   return 0;\n");
      printf("}\n\n");

      printf("// _next_%s - move to the next worker\n", name);
      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("#if ((%s) > 1) \n", worker[i].threads);
      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("#define _next_%s(j) (j = (j + 1)\%%(%s))\n", 
             name, worker[i].threads);
      printf("#else\n");
      printf("#define _next_%s(j) \n", name);
      printf("#endif\n\n");

      printf("// _await_all_%s - wait for all worker threads to complete\n",
             name);
      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("void _await_all_%s(void) {\n", name);
      printf("   int i = 0;\n");
      printf("   while (1) {\n");
      printf("      if (_%s_param[i]._status != 0) {\n", name);
      printf("         _THREAD_YIELD();\n");
      printf("      }\n");
      printf("      else {\n");
      printf("         _next_%s(i);\n", name);
      printf("         if (i == 0) {\n");
      printf("            break;\n");
      printf("         }\n");
      printf("      }\n");
      printf("   }\n");
      printf("}\n\n");

      // set line number in case of error in the following line
      printf("#line %d \"%s\"\n", line_no, file);
      printf("void _start_worker_%s(void) {\n", name);
      printf("#ifdef __PARALLELIZE_DYNAMIC\n");
      printf("   WORKER *my_worker;\n");
      printf("   long   *my_w_stack;\n");
      printf("#else\n");
      // set line number in case of error in the following line
      printf("   #line %d \"%s\"\n", line_no, file);
      printf("   static WORKER my_worker[%s];\n", worker[i].threads);
      // set line number in case of error in the following line
      printf("   #line %d \"%s\"\n", line_no, file);
      printf("   static long   my_w_stack[(%s)*(%s)];\n",
             worker[i].threads, worker[i].stack);
      printf("#endif\n");
      printf("   int i;\n");
      printf("   if (_factory_%s == NULL) {\n", worker[i].factory);
      printf("       exit(1);\n");
      printf("   }\n\n");
      printf("   // create worker threads in the factory\n");
      // set line number in case of error in the following line
      printf("   #line %d \"%s\"\n", line_no, file);
      printf("   for (i = 0; i < (%s); i++) {\n", worker[i].threads);
      printf("#ifdef __PARALLELIZE_DYNAMIC\n");
      printf("      my_worker  = (void *)malloc(sizeof(WORKER));\n");
      printf("      if (my_worker == NULL) {\n");
      printf("          exit(1);\n");
      printf("      }\n");
      // set line number in case of error in the following line
      printf("      #line %d \"%s\"\n", line_no, file);
      printf("      my_w_stack = (void *)malloc((%s)*4);\n", worker[i].stack);
      printf("      if (my_w_stack == NULL) {\n");
      printf("          exit(1);\n");
      printf("      }\n");
      // set line number in case of error in the following line
      printf("      #line %d \"%s\"\n", line_no, file);
      printf("      _create_worker(_factory_%s, &_%s, my_worker, my_w_stack, %s, %s, i);\n", 
             worker[i].factory, worker[i].name, worker[i].stack, worker[i].ticks);
      printf("#else\n");
      // set line number in case of error in the following line
      printf("      #line %d \"%s\"\n", line_no, file);
      printf("      _create_worker(_factory_%s, &_%s, &my_worker[i], &my_w_stack[i*(%s)], %s, %s, i);\n", 
             worker[i].factory, worker[i].name, worker[i].stack,
             worker[i].stack, worker[i].ticks);
      printf("#endif\n");
      printf("   }\n");
      printf("}\n\n");

      worker[i].emitted = 1;
   }
}

void emit_begin_code(char *name, int line_no, char *file) {
   struct worker_line *line;
   int i, j, k;

   int index;
   int len;
   char *var;
   char var_name[MAX_VAR_NAME+1];

   for (i = 0; i < worker_count; i++) {
      if (worker[i].name == NULL) {
         break; 
      }
      if (strcmp(worker[i].name, name) == 0) {
         break;
      }
   }
   if (worker[i].name != NULL) {
      if (!worker[i].emitted) {
         fprintf(stderr, "%s:%d: warning: worker '%s' has not been defined\n",
                 file, line_no, name);
      }
      for (j = 0; j < factory_count; j++) {
         if (factory[j].name == NULL) {
            break; 
         }
         if (strcmp(factory[j].name, worker[i].factory) == 0) {
            break;
         }
      }
      printf("   {\n");
      printf("      int _%s_id = 0;\n", name);
      if (factory[j].started == 0) {
         printf("      // factory is not explicitly started\n");
         printf("      if (_factory_%s == NULL) {\n", worker[i].factory);
         printf("         _start_factory_%s();\n", worker[i].factory);
         printf("      }\n");
      }
      printf("      // find a free worker, waiting as necessary\n");
      printf("      while (_%s_param[_%s_id]._status != 0) {\n", name, name);
      printf("         _next_%s(_%s_id);\n", name, name);
      printf("         if (_%s_id == 0) {\n", name);
      printf("            _THREAD_YIELD();\n");
      printf("         }\n");
      printf("      }\n");
      printf("      // found a free thread, so give it some work\n");

      index = 0;
      len = 0;
      var = NULL;
      do {
         var = enumerate_vars(worker[i].input, &index, &len);
         if ((var != NULL) && (strcmp(var, "void") != 0)) {
            for (j = 0; j < len; j++) {
               if (var[j] == '*') {
                  var_name[j] = ' ';
               }
               else {
                  var_name[j] = var[j];
               }
            }
            var_name[j]='\0';
            // set line number in case of error in the following line
            printf("      #line %d \"%s\"\n", line_no, file);
            printf("      _%s_param[_%s_id].%s = %s;\n", 
                   name, name, var_name, var_name);
#if DEBUG      
            printf("var name = %s\n", var_name);
#endif
         }
      } while (var != NULL);

      index = 0;
      len = 0;
      var = NULL;
      do {
         var = enumerate_vars(worker[i].output, &index, &len);
         if ((var != NULL) && (strcmp(var, "void") != 0)) {
            for (j = k = 0; j < len; j++) {
               if (var[j] != '*') {
                  var_name[k] = var[j];
                  k++;
               }
            }
            var_name[k]='\0';
            // set line number in case of error in the following line
            printf("      #line %d \"%s\"\n", line_no, file);
            printf("      _%s_param[_%s_id].%s = &%s;\n", 
                   name, name, var_name, var_name);
#if DEBUG      
            printf("var name = %s\n", var_name);
#endif
         }
      } while (var != NULL);

      printf("      _%s_param[_%s_id]._status = 1;\n", name, name);
      printf("      _next_%s(_%s_id);\n", name, name);
      printf("   }\n\n");
   }
}

void emit_end_code(char *name, int line_no, char *file) {
   // currently no code required for 'end' pragma
}

void emit_wait_code(char *name, int line_no, char *file) {
   int i;
   char *condition = strchr(name, ' ');

   if (condition != NULL) {
      *condition = '\0';
      condition++;
   }
   for (i = 0; i < worker_count; i++) {
      if (worker[i].name == NULL) {
         break; 
      }
      if (strcmp(worker[i].name, name) == 0) {
         break;
      }
   }
   if (worker[i].name != NULL) {
      if (!worker[i].emitted) {
         fprintf(stderr, "%s:%d: warning: no code has been defined for worker '%s'\n",
                 file, line_no, name);
      }
      if (condition != NULL) { 
         printf("   // wait for active threads to complete, or condition\n");
         printf("   {\n");
         printf("      int i = 0;\n");
         printf("      while (1) {\n");
         // set line number in case of error in the following line
         printf("         #line %d \"%s\"\n", line_no, file);
         printf("         if (%s) {\n", condition);
         printf("            break;\n");
         printf("         }\n");
         printf("         if (_%s_param[i]._status != 0) {\n", name);
         printf("            _THREAD_YIELD();\n");
         printf("         }\n");
         printf("         else {\n");
         printf("            _next_%s(i);\n", name);
         printf("            if (i == 0) {\n");
         printf("               break;\n");
         printf("            }\n");
         printf("         }\n");
         printf("      }\n");
         printf("   }\n");
   
      }
      else {
         printf("   // wait for active threads to complete\n");
         printf("   _await_all_%s();\n", name);
      }
   }
}

void emit_start_code(char *name, int line_no, char *file) {
   int i;
   for (i = 0; i < factory_count; i++) {
      if (factory[i].name == NULL) {
         break; 
      }
      if (strcmp(factory[i].name, name) == 0) {
         break;
      }
   }
   if (factory[i].name != NULL) {
      printf("   // start the factory and workers\n");
      printf("   _start_factory_%s();\n", name);
      factory[i].started = 1;
   }
}

void emit_stop_code(char *name, int line_no, char *file) {
   int i;
   for (i = 0; i < factory_count; i++) {
      if (factory[i].name == NULL) {
         break; 
      }
      if (strcmp(factory[i].name, name) == 0) {
         break;
      }
   }
   if (factory[i].name != NULL) {
      printf("   // stop the factory and workers\n");
      printf("   _stop_factory_%s();\n", name);
   }
}

void emit_extern_code(char *name, int line_no, char *file) {
   printf("// lock is extern custom\n");
   // set line number in case of error in the following line
   printf("#line %d \"%s\"\n", line_no, file);
   printf("extern %s;\n\n", name);
}

void emit_lock_code(char *name, int line_no, char *file) {
   printf("// lock is custom\n");
   printf("#ifndef __CUSTOM_LOCK\n");
   printf("#define __CUSTOM_LOCK\n");
   // set line number in case of error in the following line
   printf("#line %d \"%s\"\n", line_no, file);
   printf("int %s = -1;\n", name);
   printf("#endif\n\n");
}

void emit_kernel_code(char *name, int line_no, char *file) {
   emit_defines();
   printf("// kernel lock is custom\n");
   printf("#ifndef _KERNEL_LOCKED\n");
   printf("#define _KERNEL_LOCKED\n");
   // set line number in case of error in the following line
   printf("   #line %d \"%s\"\n", line_no, file);
   printf("   %s = _LOCKNEW();\n", name);
   printf("   _THREAD_SET_LOCK(%s);\n", name);
   printf("#endif\n\n");
}

void emit_exclusive_code(char *name, int line_no, char *file) {
   // set line number in case of error in the following line
   printf("   #line %d \"%s\"\n", line_no, file);
   printf("    _exclusive_%s();\n", name);
}

void emit_shared_code(char *name, int line_no, char *file) {
   // set line number in case of error in the following line
   printf("   #line %d \"%s\"\n", line_no, file);
   printf("   _shared_%s();\n", name);
}

void finalize_pragma_fn( a_VARARG *va ) {
   FILE *f;
   char name[MAX_LINE];
   struct worker_line *line;
   int  s;
   int  i, j;

   if (va->used > 0) {
     awka_error("function finalize_pragma expected no arguments, got %d.\n", 
       va->used);
   }
   line = worker[0].line;
   while (line != NULL) {
      if (strcmp(line->text, "##worker##") == 0) {
          line = line->next;
          emit_worker_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##factory##") == 0) {
          line = line->next;
          emit_factory_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##begin##") == 0) {
          line = line->next;
          emit_begin_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##end##") == 0) {
          line = line->next;
          emit_end_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##wait##") == 0) {
          line = line->next;
          emit_wait_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##start##") == 0) {
          line = line->next;
          emit_start_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##stop##") == 0) {
          line = line->next;
          emit_stop_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##extern##") == 0) {
          line = line->next;
          emit_extern_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##lock##") == 0) {
          line = line->next;
          emit_lock_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##kernel##") == 0) {
          line = line->next;
          emit_kernel_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##exclusive##") == 0) {
          line = line->next;
          emit_exclusive_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else if (strcmp(line->text, "##shared##") == 0) {
          line = line->next;
          emit_shared_code(line->text, line->line_no, line->file);
          if (line->next != NULL) {
             printf("#line %d \"%s\"\n", line->next->line_no, line->next->file);
          }
      }
      else {
         printf("%s\n", line->text);
      }
      line = line->next;
   }
}

a_VAR * str_to_dec_fn( a_VARARG *va ) { 
  a_VAR *ret = NULL;
  unsigned long dec = 0;

  if (va->used < 1) {
    awka_error("function str_to_dec - no arguments\n");
  }

  ret = awka_getdoublevar(FALSE);
  sscanf(awka_gets(va->var[0]), "%ld", &dec);
#if DEBUG  
  printf("hex value = %X\n", dec);
#endif  
  ret->dval = (float) dec;
  return ret;
}

a_VAR * str_to_hex_fn( a_VARARG *va ) { 
  a_VAR *ret = NULL;
  unsigned long hex = 0;

  if (va->used < 1) {
    awka_error("function str_to_hex - no arguments\n");
  }

  ret = awka_getdoublevar(FALSE);
  sscanf(awka_gets(va->var[0]), "%lX", &hex);
#if DEBUG  
  printf("hex value = %X\n", hex);
#endif  
  ret->dval = (float) hex;
  return ret;
}

a_VAR * bytes_to_hex_fn( a_VARARG *va ) { 
  a_VAR *ret = NULL;
  unsigned long hex = 0;
  unsigned long byte = 0;
  int i;

  if (va->used < 4) {
    awka_error("function bytes_to_hex expected 4 arguments, got %d.\n", 
      va->used);
  }

  ret = awka_getdoublevar(FALSE);
  for (i = 3; i >= 0; i--) {
     sscanf(awka_gets(va->var[i]), "%lX", &byte);
#if DEBUG  
     printf("bytes value = %X\n", byte);
#endif  
     hex = (hex<<8) + byte;
  }
#if DEBUG  
  printf("combined bytes value = %X\n", hex);
#endif  
  ret->dval = (float) hex;
  return ret;
}

a_VAR * known_worker_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   int i;

   name = awka_gets(va->var[0]);

#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < worker_count; i++) {
      if (worker[i].name == NULL) {
         break; 
      }
      if (strcmp(worker[i].name, name) == 0) {
         break;
      }
   }
   ret = awka_getdoublevar(FALSE);
   if (i < worker_count) {
#if DEBUG      
      printf("%s known\n", name);
#endif      
      ret->dval = (float)1;
   }
   else {
#if DEBUG      
      printf("%s unknown\n", name);
#endif      
      ret->dval = (float)0;
   }
   return ret;
}

a_VAR * set_memory_management_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *memory;

   memory = awka_gets(va->var[0]);
   if (strcmp(memory, "dynamic") == 0) {
      dynamic_management = 1;
   }
}

a_VAR * define_worker_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   char *input;
   char *local;
   char *output;
   char *when;
   char *stack;
   char *factory;
   char *threads;
   char *ticks;
   char *file;
   char *line_no;
   int i;

   name    = awka_gets(va->var[0]);
   input   = awka_gets(va->var[1]);
   local   = awka_gets(va->var[2]);
   output  = awka_gets(va->var[3]);
   when    = awka_gets(va->var[4]);
   stack   = awka_gets(va->var[5]);
   factory = awka_gets(va->var[6]);
   threads = awka_gets(va->var[7]);
   ticks   = awka_gets(va->var[8]);
   file    = awka_gets(va->var[9]);
   line_no = awka_gets(va->var[10]);

#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < worker_count; i++) {
      if (worker[i].name == NULL) {
         break; 
      }
      if (strcmp(worker[i].name, name) == 0) {
         break;
      }
   }
   ret = awka_getdoublevar(FALSE);
   if (i < worker_count) {
#if DEBUG      
      printf("%s known\n", name);
#endif      
      if ((strcmp(worker[i].input, input) != 0)
      ||  (strcmp(worker[i].local, local) != 0)
      ||  (strcmp(worker[i].output, output) != 0)
      ||  (strcmp(worker[i].when, when) != 0)
      ||  (strcmp(worker[i].stack, stack) != 0)
      ||  (strcmp(worker[i].factory, factory) != 0)
      ||  (strcmp(worker[i].threads, threads) != 0)
      ||  (strcmp(worker[i].ticks, ticks) != 0)) {
         fprintf(stderr, "%s:%s: propeller pragma mismatch for worker '%s'\n", 
                 file, line_no, name);
      }    
      ret->dval = (float)1;
   }
   else {
#if DEBUG      
      printf("%s unknown\n", name);
#endif
      worker[worker_count].name    = strdup(name);      
      worker[worker_count].input   = strdup(input);      
      worker[worker_count].local   = strdup(local);      
      worker[worker_count].output  = strdup(output);      
      worker[worker_count].when    = strdup(when);      
      worker[worker_count].stack   = strdup(stack);      
      worker[worker_count].factory = strdup(factory);      
      worker[worker_count].threads = strdup(threads);
      worker[worker_count].ticks   = strdup(ticks);
      worker[worker_count].emitted = 0;
      worker_count++;      
      ret->dval = (float)0;
   }
   return ret;
}

a_VAR * known_factory_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   int i;

   name = awka_gets(va->var[0]);

#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < factory_count; i++) {
      if (factory[i].name == NULL) {
         break; 
      }
      if (strcmp(factory[i].name, name) == 0) {
         break;
      }
   }
   ret = awka_getdoublevar(FALSE);
   if (i < factory_count) {
#if DEBUG      
      printf("%s known\n", name);
#endif      
      ret->dval = (float)1;
   }
   else {
#if DEBUG      
      printf("%s unknown\n", name);
#endif      
      ret->dval = (float)0;
   }
   return ret;
}

a_VAR * define_factory_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   char *foreman;
   char *stack;
   char *lock;
   char *cogs;
   char *file;
   char *line_no;
   int i;

   name    = awka_gets(va->var[0]);
   foreman = awka_gets(va->var[1]);
   stack   = awka_gets(va->var[2]);
   lock    = awka_gets(va->var[3]);
   cogs    = awka_gets(va->var[4]);
   file    = awka_gets(va->var[5]);
   line_no = awka_gets(va->var[6]);

#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < factory_count; i++) {
      if (factory[i].name == NULL) {
         break; 
      }
      if (strcmp(factory[i].name, name) == 0) {
         break;
      }
   }
   ret = awka_getdoublevar(FALSE);
   if (i < factory_count) {
#if DEBUG      
      printf("%s known\n", name);
#endif
      if ((strcmp(factory[i].lock, lock) != 0)
      ||  (strcmp(factory[i].foreman, foreman) != 0)
      ||  (strcmp(factory[i].stack, stack) != 0)
      ||  (strcmp(factory[i].cogs, cogs) != 0)) {
         fprintf(stderr, "%s:%s: propeller pragma mismatch for factory '%s'\n",
                 file, line_no, name);
      }    
      ret->dval = (float)1;
   }
   else {
#if DEBUG      
      printf("%s unknown\n", name);
#endif
      factory[factory_count].name    = strdup(name);
      factory[factory_count].foreman = strdup(foreman);
      factory[factory_count].stack   = strdup(stack);
      factory[factory_count].lock    = strdup(lock);
      factory[factory_count].cogs    = strdup(cogs);
      factory[factory_count].emitted = 0;
      factory[factory_count].started = 0;
      factory_count++;      
      ret->dval = (float)0;
   }
   return ret;
}


a_VAR * known_exclusion_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   int i;

   name = awka_gets(va->var[0]);

#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < exclusion_count; i++) {
      if (exclusion[i].name == NULL) {
         break; 
      }
      if (strcmp(exclusion[i].name, name) == 0) {
         break;
      }
   }
   ret = awka_getdoublevar(FALSE);
   if (i < exclusion_count) {
#if DEBUG      
      printf("%s known\n", name);
#endif      
      ret->dval = (float)1;
   }
   else {
#if DEBUG      
      printf("%s unknown\n", name);
#endif      
      ret->dval = (float)0;
   }
   return ret;
}

a_VAR * define_exclusion_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   char *foreman;
   char *stack;
   char *lock;
   char *cogs;
   char *file;
   char *line_no;
   char *opt;
   int i;

   name    = awka_gets(va->var[0]);
   file    = awka_gets(va->var[1]);
   line_no = awka_gets(va->var[2]);
   opt     = awka_gets(va->var[3]);

#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < exclusion_count; i++) {
      if (exclusion[i].name == NULL) {
         break; 
      }
      if (strcmp(exclusion[i].name, name) == 0) {
         break;
      }
   }
   ret = awka_getdoublevar(FALSE);
   if (i < exclusion_count) {
#if DEBUG      
      printf("%s known\n", name);
#endif
      ret->dval = (float)1;
   }
   else {
#if DEBUG      
      printf("%s unknown\n", name);
#endif
      exclusion[exclusion_count].name    = strdup(name);
      exclusion[exclusion_count].emitted = 0;
      exclusion[exclusion_count].lock    = (strcmp(opt,"lock")==0);
      exclusion[exclusion_count].ext     = (strcmp(opt,"extern")==0);
      exclusion_count++;      
      ret->dval = (float)0;
   }
   return ret;
}

