/*
 * Catapult functions to process catapult pragmas
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
#include <ctype.h>
#include "catapult_functions.h"

#define NO_BANNER

#define DEBUG 0

#define MAX_LINE       1024

#define MAX_SEGMENTS   16

#define DEFAULT_ADDR   "0x1000"

#define DEFAULT_STACK  "250"

#define DEFAULT_DEF_ENV "CATALINA_DEFINE"

struct segment_line {
   int    line_no;
   char   text[MAX_LINE+1];
   struct segment_line *next;
};


struct known_segment {
   char   *name;
   char   *address;
   char   *stack;
   char   *mode;
   char   *options;
   char   *type;
   char   *binary;
   char   *overlay;
   struct segment_line *line;
};

struct proxy_function {
   int segment;
   int  id;
   int  type;
   char *name;
   char *stype;
   struct proxy_function *next;
};

static struct proxy_function *proxy_list = NULL;

static int proxy_id = 1;

static int segment_count = 0;

static int propeller = 1;

static struct known_segment segment[MAX_SEGMENTS + 2] = {
    NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL
};

// safecpy will never write more than size characters, 
// and is guaranteed to null terminate its result, so
// make sure the buffer passed is at least size + 1
char * safecpy(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncpy(dst, src, size - strlen(dst));
   }
   return NULL;
}

void initialize_pragma_fn( a_VARARG *va ) {
   FILE *f;
   char line[MAX_LINE + 1];
   char name[MAX_LINE + 1];
   char temp_env[MAX_LINE + 1] = "";
   char *define;
   int  s;
   int  i, j;

   if (va->used > 0) {
     awka_error("function initialize_pragma expected no arguments, got %d.\n", 
       va->used);
   }

   #ifndef NO_BANNER
   fprintf(stderr, "Catalina Catapult 7.5\n");
   #endif

   // set common segment to defaults
   segment[0].name    = "common";
   segment[0].address = "";
   segment[0].stack   = "";
   segment[0].mode    = "";
   segment[0].options = "";
   segment[0].type    = "";
   segment[0].binary  = "";
   segment[0].overlay = "";
   segment_count++;

   // set primary segment to defaults
   segment[1].name    = "primary";
   segment[1].address = "";
   segment[1].stack   = "";
   segment[1].mode    = "";
   segment[1].options = "";
   segment[1].type    = "";
   segment[1].binary  = "";
   segment[1].overlay = "";
   segment_count++;

   // get any Catalina symbols defined by the environment variables
   safecpy(temp_env, getenv(DEFAULT_DEF_ENV), MAX_LINE);

   // check for "P2" defined
   define = strtok(temp_env, " :;,");
   while (define != NULL) {
      if (strcmp(define, "P2") == 0) {
         propeller = 2;
      }
      define = strtok(NULL, " :;,");
   }
}

void add_line_to_segment(int i, char *text, char *line_no) {
   struct segment_line *newtext;
   struct segment_line *last;
   struct segment_line *line;

   if (i < segment_count) {
      malloc(&newtext, sizeof(struct segment_line));
      if (newtext == NULL) {
         printf("out of memory\n");
         return;
      }
      sscanf(line_no, "%d", &newtext->line_no);
      newtext->next = NULL;
      strncpy(newtext->text, text, MAX_LINE);
      last = NULL;
      line = segment[i].line;
      while (line != NULL) {
         last = line;
         line = line->next;
      }
      if (last == NULL) {
         segment[i].line = newtext;
      }
      else {
         last->next = newtext;
      }
   }
   else {
#if DEBUG      
      printf("no segment %d\n", i);
#endif      
   }
}

void add_line_to_segment_fn( a_VARARG *va ) {
   int i;
   char *text;
   char *line_no;
   if (va->used < 2) {
      awka_error("function add_line_to_segment - not enough arguments\n");
   }

   i       = (int)awka_getd(va->var[0]);
   text    = awka_gets(va->var[1]);
   line_no = awka_gets(va->var[2]);
#if DEBUG      
   printf("adding line to segment %d: %s\n", i, text);
#endif
   add_line_to_segment(i, text, line_no);   
}

void emit_common_code(char *filename) {
   struct segment_line *line;
   char output_name[MAX_LINE + 3];
   FILE *output_file;
   int last_line;

   line = segment[0].line;
   if (line != NULL) {
      strcpy(output_name, segment[0].name);
      strcat(output_name, ".h");
      output_file = fopen(output_name,"w+");
      if (output_file == NULL) {
         fprintf(stderr, "Error: Cannot open output file %s\n", output_name);
         return;
      }
      fprintf(output_file, 
         "/*\n"
         " * common segment:\n"
         " *    name=\"%s\"\n"
         " *    options=\"%s\"\n"
         " */\n", 
         segment[0].name, 
         segment[0].options);
      // define the __CATAPULTED symbol, which is used in catapult.h
      fprintf(output_file, "\n#define __CATAPULTED\n\n");
      // include cog.h (in case not already included)
      fprintf(output_file, "\n#include <cog.h>\n\n");
      // include catapult.h (in case not already included)
      fprintf(output_file, "\n#include \"catapult.h\"\n\n");
      // define CATAPULT_FIRST_SVC (in case not already defined)
      fprintf(output_file, "\n#ifndef CATAPULT_SVC_ID\n#define CATAPULT_SVC_ID SVC_RESERVED\n#endif\n\n");
      last_line = -1;
      while (line != NULL) {
         if (line->line_no != last_line + 1) {
            if (filename == NULL) {
               fprintf(output_file, "#line %d\n", line->line_no);
            }
            else {
               fprintf(output_file, "#line %d \"%s\"\n", line->line_no, filename);
            }
         }
         last_line = line->line_no;
         fprintf(output_file, "%s\n", line->text);
         line = line->next;
      }
      fclose(output_file);
   }
}

void emit_primary_code(char *filename) {
   struct segment_line *line;
   char output_name[MAX_LINE + 3];
   FILE *output_file;
   int last_line;
   int i;

   if ((strstr(segment[0].options, "-p2") != NULL) 
   ||  (strstr(segment[1].options, "-p2") != NULL)) {
     propeller = 2;
   }
   line = segment[1].line;
   if (line != NULL) {
      strcpy(output_name, segment[1].name);
      strcat(output_name, ".c");
      output_file = fopen(output_name,"w+");
      if (output_file == NULL) {
         fprintf(stderr, "Error: Cannot open output file %s\n", output_name);
         return;
      }
      fprintf(
         output_file, 
         "/*\n"
         " * primary segment:\n"
         " *    name=\"%s\"\n"
         " *    mode=\"%s\"\n"
         " *    options=\"%s\"\n"
         " *    binary=\"%s\"\n"
         " */\n", 
         segment[1].name, 
         segment[1].mode, 
         segment[1].options, 
         segment[1].binary);
      if (segment[0].line != NULL) {
         // common segment exists - include as a header file
         fprintf(output_file, "\n#include \"%s.h\"\n", segment[0].name);
      }
      for (i = 2; i < segment_count; i++) {
         if (segment[i].line != NULL) {
            if ((strstr(segment[0].options, "-lthreads") != NULL) 
            ||  (strstr(segment[i].options, "-lthreads") != NULL)) {
               // ensure we start the secondary threaded
               fprintf(output_file, "\n#ifndef COGSTART_THREADED\n#define COGSTART_THREADED\n#endif\n#include \"%s.inc\"\n\n", segment[i].name);
            }
            else {
               // ensure we start the secondary non-threaded
               fprintf(output_file, "\n#undef COGSTART_THREADED\n#include \"%s.inc\"\n\n", segment[i].name);
            }
         }
      }
      for (i = 2; i < segment_count; i++) {
         if (segment[i].line != NULL) {
            fprintf(
               output_file,
               "#ifndef __OVERLAY_SIZE\n"
               "#define __OVERLAY_SIZE %s_RUNTIME_SIZE\n"
               "#else\n"
               "#if __OVERLAY_SIZE < %s_RUNTIME_SIZE\n"
               "#undef __OVERLAY_SIZE\n"
               "#define __OVERLAY_SIZE %s_RUNTIME_SIZE\n"
               "#endif\n" 
               "#endif\n\n", 
               segment[i].name,
               segment[i].name,
               segment[i].name);
         }
      }
      last_line = -1;
      while (line != NULL) {
         if (line->line_no != last_line + 1) {
            if (filename == NULL) {
               fprintf(output_file, "#line %d\n", line->line_no);
            }
            else {
               fprintf(output_file, "#line %d \"%s\"\n", line->line_no, filename);
            }
         }
         last_line = line->line_no;
         fprintf(output_file, "%s\n", line->text);
         line = line->next;
      }
      fclose(output_file);
   }
}

void generate_proxies(int i, FILE *output_file) {
   struct proxy_function *fn;
   struct proxy_function *last;

   fn = proxy_list;
   while (fn != NULL) {
      if (fn->type == SHORT_SVC) {
         fprintf(
            output_file,
            "\nint %s(long l) {\n"
            "    return _short_service(CATAPULT_SVC_ID+%d, l);\n"
            "}\n",
            fn->name,
            fn->id);
      }
      else if (fn->type == LONG_SVC) {
         fprintf(
            output_file,
            "\nint %s(long l) {\n"
            "    return _long_service(CATAPULT_SVC_ID+%d, l);\n"
            "}\n",
            fn->name,
            fn->id);
      }
      else if (fn->type == LONG_2_SVC) {
         fprintf(
            output_file,
            "\nint %s(long l1, long l2) {\n"
            "    return _long_service_2(CATAPULT_SVC_ID+%d, l1, l2);\n"
            "}\n",
            fn->name,
            fn->id);
      }
      else if (fn->type == FLOAT_SVC) {
         fprintf(
            output_file,
            "\nfloat %s(float f1, float f2) {\n"
            "    return _float_service(CATAPULT_SVC_ID+%d, f1, f2);\n"
            "}\n",
            fn->name,
            fn->id);
      }
      else if (fn->type == LONG_FLOAT_SVC) {
         fprintf(
            output_file,
            "\nlong %s(float f1, float f2) {\n"
            "    return _long_float_service(CATAPULT_SVC_ID+%d, f1, f2);\n"
            "}\n",
            fn->name,
            fn->id);
      }
      else if (fn->type == SHARED_SVC) {
         fprintf(
            output_file,
            "\nint %s(%s *shared) {\n"
            "    return _short_service(CATAPULT_SVC_ID+%d, (long)shared);\n"
            "}\n",
            fn->name,
            segment[i].type,
            fn->id);
      }
      else if (fn->type == SERIAL_SVC) {
         fprintf(stderr, "Error: serial service type not supported for \"%s\"\n", fn->name);
      }
      else if (fn->type == REMOTE_SVC) {
         fprintf(stderr, "Error: remote service type not supported for \"%s\"\n", fn->name);
      }
      else if (fn->type == RPC_SVC) {
         fprintf(stderr, "Error: rpc service type not supported for \"%s\"\n", fn->name);
      }
      else {
         fprintf(stderr, "Error: unknown service type for \"%s\"\n", fn->name);
      }
      last = fn;
      fn = fn->next;
      free(last);
   }
}

void emit_secondary_code(int i, char *filename) {
   struct segment_line *line;
   char output_name[MAX_LINE + 3];
   FILE *output_file;
   int last_line;

   line = segment[i].line;
   if (line != NULL) {
      strcpy(output_name, segment[i].name);
      strcat(output_name, ".c");
      output_file = fopen(output_name,"w+");
      if (output_file == NULL) {
         fprintf(stderr, "Error: Cannot open output file %s\n", output_name);
         return;
      }
      fprintf(
         output_file, 
         "/*\n"
         " * secondary segment:\n"
         " *    name=\"%s\"\n"
         " *    address=\"%s\"\n"
         " *    stack=\"%s\"\n"
         " *    mode=\"%s\"\n"
         " *    options=\"%s\"\n"
         " *    type=\"%s\"\n"
         " *    binary=\"%s\"\n"
         " *    overlay=\"%s\"\n"
         " */\n", 
         segment[i].name, 
         segment[i].address, 
         segment[i].stack, 
         segment[i].mode, 
         segment[i].options, 
         segment[i].type,
         segment[i].binary,
         segment[i].overlay);
      if (segment[0].line != NULL) {
         // common segment exists - include as a header file
         fprintf(output_file, "\n#include \"%s.h\"\n", segment[0].name);
      }
      if (proxy_list != NULL) {
         // some proxy functions were defined using #pragma catapult service
         // so generate real proxy functions
         generate_proxies(i, output_file);
      }
      last_line = -1;
      while (line != NULL) {
         if (line->line_no != last_line + 1) {
            if (filename == NULL) {
               fprintf(output_file, "#line %d\n", line->line_no);
            }
            else {
               fprintf(output_file, "#line %d \"%s\"\n", line->line_no, filename);
            }
         }
         last_line = line->line_no;
         fprintf(output_file, "%s\n", line->text);
         line = line->next;
      }
      // include code to call the secondary function
      if (strcmp(segment[i].type, "") == 0) {
         // no type - assume name_t
         fprintf(
            output_file,
            "\nvoid main(%s_t *arg) {\n"
            "   %s(arg);\n"
            "   _unregister_plugin(_cogid());\n"
            "   _cogstop(_cogid());\n"
            "}\n",
            segment[i].name,
            segment[i].name);
      }
      else {
         // use specified type
         fprintf(
            output_file,
            "\nvoid main(%s *shared) {\n"
            "   %s(shared);\n"
            "   while(1);\n"
            "}\n",
            segment[i].type,
            segment[i].name);
      }
      fclose(output_file);
   }
}

// case insensitive strcmp
static int strcmp_i(const char *str1, const char *str2) {
   while ((*str1) && (*str2) 
   &&     (toupper(*str1) == toupper(*str2))) {
      str1++;
      str2++;
   }
   return (toupper(*str1) - toupper(*str2));
}


char *mode_symbol(char *mode) {
   if (strlen(mode) == 0) {
      if (propeller == 1) {
         return "TINY";
      }
      else {
         return "NATIVE";
      }
   }
   else if (strcmp_i(mode, "COMPACT") == 0) {
      return "COMPACT";
   }
   else if (strcmp_i(mode, "CMM") == 0) {
      return "COMPACT";
   }
   else if (strcmp_i(mode, "NATIVE") == 0) {
      return "NATIVE";
   }
   else if (strcmp_i(mode, "NMM") == 0) {
      return "NATIVE";
   }
   else if (strcmp_i(mode, "TINY") == 0) {
      return "TINY";
   }
   else if (strcmp_i(mode, "LMM") == 0) {
      return "TINY";
   }
   else if (strcmp_i(mode, "SMALL") == 0) {
      return "SMALL";
   }
   else if (strcmp_i(mode, "LARGE") == 0) {
      return "LARGE";
   }
   else if (strcmp_i(mode, "XMM") == 0) {
      return "LARGE";
   }
   else if (strcmp_i(mode, "XMM SMALL") == 0) {
      return "SMALL";
   }
   else if (strcmp_i(mode, "XMM LARGE") == 0) {
      return "SMALL";
   }
   else {
      fprintf(stderr, "Error: Unknown mode %s\n", mode);
      return "UNKNOWN";
   }
}

char *addr_value(char *address) {
  if (strcmp(address, "") == 0) {
     return DEFAULT_ADDR;
  }
  else {
     return address;
  }
}

char *stack_value(char *stack) {
  if (strcmp(stack, "") == 0) {
     return DEFAULT_STACK;
  }
  else {
     return stack;
  }
}

void emit_primary_command() {
   if ((strstr(segment[0].options, "-p2") != NULL) 
   ||  (strstr(segment[1].options, "-p2") != NULL)) {
     propeller = 2;
   }
   if (strlen(segment[1].binary) > 0) {
      printf("catalina -C FIXED_ARGS -C %s %s %s %s.c -o %s\n", 
         mode_symbol(segment[1].mode), 
         segment[1].options, 
         segment[0].options, // common options
         segment[1].name,
         segment[1].binary);
   }
   else {
      printf("catalina -C FIXED_ARGS -C %s %s %s %s.c\n", 
         mode_symbol(segment[1].mode), 
         segment[1].options, 
         segment[0].options, // common options
         segment[1].name);
   }
  
}

void emit_secondary_command(int i) {
   char *binary_name;

   if ((strstr(segment[0].options, "-p2") != NULL) 
   ||  (strstr(segment[i].options, "-p2") != NULL)) {
     propeller = 2;
   }
   if (strlen(segment[i].binary) > 0) {
      binary_name = segment[i].binary;
   }
   else {
      binary_name = segment[i].name;
   }
   if (propeller == 1) {
      printf("catalina -C NO_ARGS -C %s -M64k -R %s %s %s %s.c -o %s.binary\n", 
          mode_symbol(segment[i].mode), 
          addr_value(segment[i].address), 
          segment[i].options, 
          segment[0].options, // common options
          segment[i].name,
          binary_name);
      if (strlen(segment[i].overlay) == 0) {
         printf("spinc -B2 -s %s -c -l -n %s %s.binary >%s.inc\n",
             stack_value(segment[i].stack),
             segment[i].name,
             binary_name,
             segment[i].name);
      }
      else {
         printf("spinc -B2 -s %s -c -l -n %s %s.binary -o %s >%s.inc\n",
             stack_value(segment[i].stack),
             segment[i].name,
             binary_name,
             segment[i].overlay,
             segment[i].name);
      }
   }
   else {
      printf("catalina -C NO_ARGS -C %s -R %s %s %s %s.c -o %s.bin\n", 
          mode_symbol(segment[i].mode), 
          addr_value(segment[i].address), 
          segment[i].options, 
          segment[0].options, // common options
          segment[i].name,
          binary_name);
      if (strlen(segment[i].overlay) == 0) {
         printf("spinc -p2 -B2 -s %s -c -l -n %s %s.bin >%s.inc\n",
             stack_value(segment[i].stack),
             segment[i].name,
             binary_name,
             segment[i].name);
      }
      else {
         printf("spinc -p2 -B2 -s %s -c -l -n %s %s.bin -o %s >%s.inc\n",
             stack_value(segment[i].stack),
             segment[i].name,
             binary_name,
             segment[i].overlay,
             segment[i].name);
      }
   }
}

void finalize_pragma_fn( a_VARARG *va ) {
   struct segment_line *line;
   char *filename;
   int  i;

   filename = awka_gets(va->var[0]);

   // emit common segment
   line = segment[0].line;
   if (line != NULL) {
      emit_common_code(filename);
   }
   // emit all secondary segments
   for (i = 2; i < segment_count; i++) {
      line = segment[i].line;
      if (line != NULL) {
         emit_secondary_code(i, filename);
         emit_secondary_command(i);
      }
   }
   // emit primary segment
   line = segment[1].line;
   if (line != NULL) {
      emit_primary_code(filename);
      emit_primary_command();
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

a_VAR * define_segment_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   char *address;
   char *stack;
   char *mode;
   char *options;
   char *type;
   char *binary;
   char *overlay;
   int i;

   name    = awka_gets(va->var[0]);
   address = awka_gets(va->var[1]);
   stack   = awka_gets(va->var[2]);
   mode    = awka_gets(va->var[3]);
   options = awka_gets(va->var[4]);
   type    = awka_gets(va->var[5]);
   binary  = awka_gets(va->var[6]);
   overlay = awka_gets(va->var[7]);

#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < segment_count; i++) {
      if (segment[i].name == NULL) {
         break; 
      }
      if (strcmp(segment[i].name, name) == 0) {
         break;
      }
   }

   ret = awka_getdoublevar(FALSE);

   if (i < segment_count) {
#if DEBUG      
      printf("%s known\n", name);
#endif      
      if ((strcmp(segment[i].address, address) != 0)
      ||  (strcmp(segment[i].stack, stack) != 0)
      ||  (strcmp(segment[i].mode, mode) != 0)
      ||  (strcmp(segment[i].options, options) != 0)
      ||  (strcmp(segment[i].type, type) != 0)
      ||  (strcmp(segment[i].binary, binary) != 0)
      ||  (strcmp(segment[i].overlay, overlay) != 0)) {
         fprintf(stderr, "Error: catapult pragma mismatch for segment \"%s\"\n", name);
         ret->dval = (float)-1;
         return ret;
      }
   }    
   else {
#if DEBUG      
      printf("%s unknown\n", name);
#endif
   }
   segment[segment_count].name    = strdup(name);      
   segment[segment_count].address = strdup(address);      
   segment[segment_count].stack   = strdup(stack);      
   segment[segment_count].mode    = strdup(mode);      
   segment[segment_count].options = strdup(options);      
   segment[segment_count].type    = strdup(type);      
   segment[segment_count].binary  = strdup(binary);      
   segment[segment_count].overlay = strdup(overlay);      
   ret->dval = (float)segment_count;
   segment_count++;      
   return ret;
}

a_VAR * update_segment_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   int  i;
   char *name;
   char *address;
   char *stack;
   char *mode;
   char *options;
   char *type;
   char *binary;
   char *overlay;

   i       = (int)awka_getd(va->var[0]);
   name    = awka_gets(va->var[1]);
   address = awka_gets(va->var[2]);
   stack   = awka_gets(va->var[3]);
   mode    = awka_gets(va->var[4]);
   options = awka_gets(va->var[5]);
   type    = awka_gets(va->var[6]);
   binary  = awka_gets(va->var[7]);
   overlay = awka_gets(va->var[8]);

#if DEBUG      
   printf("checking %d\n", i);
   printf("name = %s\n", name);
   printf("address = %s\n", address);
   printf("stack = %s\n", stack);
   printf("mode = %s\n", mode);
   printf("options = %s\n", options);
   printf("type = %s\n", type);
   printf("binary = %s\n", binary);
   printf("overlay = %s\n", overlay);
#endif

   ret = awka_getdoublevar(FALSE);

   if (i < segment_count) {
      if ((strlen(segment[i].address) != 0) && (strcmp(segment[i].address, address) != 0)
      ||  (strlen(segment[i].stack) != 0)   && (strcmp(segment[i].stack, stack) != 0)
      ||  (strlen(segment[i].mode) != 0)    && (strcmp(segment[i].mode, mode) != 0)
      ||  (strlen(segment[i].options) != 0) && (strcmp(segment[i].options, options) != 0)
      ||  (strlen(segment[i].type) != 0)    && (strcmp(segment[i].type, type) != 0) 
      ||  (strlen(segment[i].binary) != 0)  && (strcmp(segment[i].binary, binary) != 0)
      ||  (strlen(segment[i].overlay) != 0) && (strcmp(segment[i].overlay, overlay) != 0)) {
         fprintf(stderr, "Error: catapult pragma mismatch for segment \"%s\"\n", name);
         ret->dval = (float)-1;
      }    
      else {
#if DEBUG
         printf("updating %d\n", i);
#endif
         segment[i].name    = strdup(name);      
         segment[i].address = strdup(address);      
         segment[i].stack   = strdup(stack);      
         segment[i].mode    = strdup(mode);      
         segment[i].options = strdup(options);      
         segment[i].type    = strdup(type);      
         segment[i].binary  = strdup(binary);
         segment[i].overlay = strdup(overlay);
         ret->dval = (float)0;
      }
#if DEBUG
      printf("name = %s\n", segment[i].name);
      printf("address = %s\n", segment[i].address);
      printf("stack = %s\n", segment[i].stack);
      printf("mode = %s\n", segment[i].mode);
      printf("options = %s\n", segment[i].options);
      printf("type = %s\n", segment[i].type);
      printf("binary = %s\n", segment[i].binary);
      printf("overlay = %s\n", segment[i].overlay);
#endif
   }
   return ret;
}

a_VAR * save_proxy_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   int  i;
   char *name;
   char *stype;
   char *line_no;
   struct proxy_function *fn;
   struct proxy_function *last;
   char output_line[1000] = "";

   i       = (int)awka_getd(va->var[0]);
   name    = awka_gets(va->var[1]);
   stype   = awka_gets(va->var[2]);
   line_no = awka_gets(va->var[3]);

#if DEBUG
      printf("segment = %d\n", i);
      printf("name = %s\n", name);
      printf("stype = %s\n", stype);
      printf("line_no = %s\n", line_no);
#endif

   ret = awka_getdoublevar(FALSE);
   ret->dval = (float)0;

   if (proxy_list == NULL) {
      malloc(&proxy_list, sizeof(struct proxy_function));
      if (proxy_list == NULL) {
         printf("out of memory\n");
         ret->dval = (float)-1;
         return ret;
      }
      fn = proxy_list;
   }
   else {
      fn = proxy_list;
      while (fn->next != NULL) {
         fn = fn->next;
      }
      malloc(&fn->next, sizeof(struct proxy_function));
      if (fn->next == NULL) {
         printf("out of memory\n");
         ret->dval = (float)-1;
         return ret;
      }
      fn = fn->next;
   }
   fn->segment = i;
   fn->id = proxy_id++;
   fn->name = strdup(name);
   fn->stype = strdup(stype);
   fn->next = NULL;
   if (i < segment_count) {
      //ret->dval = (float)1;
      if (strcmp_i(stype, "short") == 0) {
         fn->type = SHORT_SVC;
         fn->stype = "SHORT_SVC";
      }
      else if (strcmp_i(stype, "long") == 0) {
         fn->type = LONG_SVC;
         fn->stype = "LONG_SVC";
      }
      else if (strcmp_i(stype, "long_2") == 0) {
         fn->type = LONG_2_SVC;
         fn->stype = "LONG_2_SVC";
      }
      else if (strcmp_i(stype, "float") == 0) {
         fn->type = FLOAT_SVC;
         fn->stype = "FLOAT_SVC";
      }
      else if (strcmp_i(stype, "long_float") == 0) {
         fn->type = LONG_FLOAT_SVC;
         fn->stype = "LONG_FLOAT_SVC";
      }
      else if (strcmp_i(stype, "shared") == 0) {
         fn->type = SHARED_SVC;
         fn->stype = "SHARED_SVC";
      }
      else if (strcmp_i(stype, "serial") == 0) {
         fn->type = SERIAL_SVC;
         fn->stype = "SERIAL_SVC";
      }
      else if (strcmp_i(stype, "remote") == 0) {
         fn->type = REMOTE_SVC;
         fn->stype = "REMOTE_SVC";
      }
      else if (strcmp_i(stype, "rpc") == 0) {
         fn->type = RPC_SVC;
         fn->stype = "RPC_SVC";
      }
      else {
         fprintf(stderr, "Error: invalid service type for \"%s\"\n", name);
         ret->dval = (float)-1;
      }
#if DEBUG      
      printf("segment %d\n", fn->segment);
      printf("id = %d\n", fn->id);
      printf("name = %s\n", fn->name);
      printf("stype = %s\n", fn->stype);
      printf("type = %d\n", fn->type);
#endif      
   }
   return ret;
}

/*
  NOTE: The generated service_list entries must match the dedinition in <service.h>
  typedef struct svc_entry {
     char  *name;      // required for Lua, otherwise for documentation only
     void  *addr;      // required for C - see "call_XXXX" types
     svc_t svc_type;   // service type (defines call and return types)
     int   svc_id;     // global (public) id (0 to terminate list)
     int   svc_port;   // global (public) remote serial port
     char  *svc_ip;    // global (public) remote IP address
     int   svc_handle; // service listen handle (server listens on /rpc/name)
  } svc_entry_t;
*/

a_VAR * generate_service_list_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   int  i;
   char *name;
   char *stype;
   int type;
   char *line_no;
   struct proxy_function *fn;
   char output_line[1000] = "";

   i       = (int)awka_getd(va->var[0]);
   name    = awka_gets(va->var[1]);
   stype   = awka_gets(va->var[2]);
   line_no = awka_gets(va->var[3]);

#if DEBUG
   printf("segment = %d\n", i);
   printf("name = %s\n", name);
   printf("stype = %s\n", stype);
   printf("line_no = %s\n", line_no);
#endif

   ret = awka_getdoublevar(FALSE);

   if (proxy_list == NULL) {
      fprintf(stderr, "Warning: no proxy functions defined using #pragma catapult service\n");
   }

   if ((strcmp_i(stype, "c") == 0) || (strlen(stype) == 0)) {
      type = 0;
      fn = proxy_list;
   }
   else if (strcmp_i(stype, "lua") == 0) {
      type = 1;
      fn = proxy_list;
   }
   else {
      fprintf(stderr, "Error: unknown service_list type \"%s\"\n", stype);
      fn = NULL;
   }
   while (fn != NULL) {
      if (type == 0) {
         // C proxy function
         sprintf(
            output_line,
            "   {\"%s\", %s, %s, CATAPULT_SVC_ID+%d, 0, 0, 0},",
            fn->name,
            fn->name,
            fn->stype,
            fn->id);
      }
      else {
         // Lua proxy function
         sprintf(
            output_line,
            "   {\"%s\", NULL, %s, CATAPULT_SVC_ID+%d, 0, 0, 0},",
            fn->name,
            fn->stype,
            fn->id);
      }
      // printf("service_list line = %s\n", output_line);
      add_line_to_segment(i, output_line, line_no);
      fn = fn->next;
   }
   ret->dval = (float)0;
   return ret;
}

