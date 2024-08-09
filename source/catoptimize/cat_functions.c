#include <libawka.h> 
#include <stdio.h>
#include <stdlib.h>
#include <catoptimize.h>

#define DEBUG 0

#define MAX_INST 20000

#define MAX_LINE 128

#define MAX_FUNC 10000

#define MAX_RECURSE 10

#define MAX_KIDS 40000


struct optimized_instruction {
   int n;
   char *str;
};

static int instr_count = 0;
static struct optimized_instruction instr[MAX_INST] = { 0, NULL };

struct function_line {
   char text[MAX_LINE];
   int func;
   struct function_line *next;
};


struct known_function {
   char *name;
   int size;
   int leaf;
   int needs_BC;
   int call_count;
   int line_count;
   struct function_line *line;
};

struct child_function {
   int parent;
   int child;
   int code;
};

static int func_count = 0;
static int kids_count = 0;
static struct known_function func[MAX_FUNC] = { NULL, 0, 0 };
static struct child_function rels[MAX_KIDS] = { 0, 0 };


void initialize_phase_2_fn() {
   FILE *f;
   char line[MAX_LINE];
   char name[MAX_LINE];
   int  s;
   int  i, j;

   if ((f = fopen(OPTIMIZER_PHASE_1_OUTPUT_NAME, "r")) == NULL) {
      printf ("failed to open inliner phase 1 output file %s\n",
         OPTIMIZER_PHASE_1_OUTPUT_NAME);
      return;
   }
   while (fgets(line, MAX_LINE, f) != NULL) {
      sscanf(line, "%s %d", (char *)&name, &s);
      i = 0;

      for (i = 0; i < func_count; i++) {
         if (strcmp(name, func[i].name) == 0) {
            func[i].call_count++;
            break;
         }
      }
      if (i == func_count) {
         func[i].name = strdup(name);
         func[i].size = s;
         func[i].leaf = 0;
         func[i].needs_BC = 0;
         func[i].call_count = 1;
         func[i].line = NULL;
#if DEBUG      
         printf("input: %s %d\n", func[func_count].name, func[func_count].size);
#endif      
         func_count++;
      }
   }
#if DEBUG      
   printf("input %d functions\n", func_count);
#endif      
   fclose(f);
}

void add_line_to_function_fn( a_VARARG *va ) {
   char *name;
   char *text;
   struct function_line *newtext;
   struct function_line *last;
   struct function_line *line;
   int i;

   if (va->used < 2) {
      awka_error("function add_line_to_function - not enough arguments\n");
   }

   name = awka_gets(va->var[0]);
   text = awka_gets(va->var[1]);
#if DEBUG      
   printf("adding line to %s: %s\n", name, text);
#endif      
   for (i = 0; i < func_count; i++) {
      if (func[i].name == NULL) {
         break; 
      }
      if (strcmp(func[i].name, name) == 0) {
         break;
      }
   }
   if (i < func_count) {
      malloc(&newtext, sizeof(struct function_line));
      if (newtext == NULL) {
         printf("out of memory\n");
         return;
      }
      newtext->func = -1;
      newtext->next = NULL;
      strncpy(newtext->text, text, MAX_LINE);
      last = NULL;
      line = func[i].line;
      while (line != NULL) {
         last = line;
         line = line->next;
      }
      if (last == NULL) {
         func[i].line = newtext;
      }
      else {
         last->next = newtext;
      }
      func[i].line_count++;
   }
   else {
#if DEBUG      
      printf("cannot find function %s\n", name);
#endif      
   }
}

void set_leaf_fn( a_VARARG *va ) { 
   char *name;
   double leaf;
   int i;

   if (va->used < 2) {
     awka_error("function check_inline expected 2 arguments, got %d.\n", 
       va->used);
   }
   name = awka_gets(va->var[0]);
   leaf = awka_getd(va->var[1]);
#if DEBUG      
   printf("setting leaf status of %s = %g\n", name, leaf);
#endif      
   for (i = 0; i < func_count; i++) {
      if (func[i].name == NULL) {
         break; 
      }
      if (strcmp(func[i].name, name) == 0) {
         break;
      }
   }
   if (i < func_count) {
      func[i].leaf = (leaf != 0);
   }
   else {
#if DEBUG      
      printf("cannot find function %s\n", name);
#endif      
   }
}

void finalize_phase_2_fn( a_VARARG *va ) {
   FILE *f;
   char name[MAX_LINE];
   struct function_line *line;
   int  s;
   int  i, j;
   double lines;

   if (va->used < 1) {
     awka_error("function check_inline expected 1 argument, got %d.\n", 
       va->used);
   }
   lines = awka_getd(va->var[0]);
   if ((f = fopen(OPTIMIZER_PHASE_2_OUTPUT_NAME, "w")) == NULL) {
      printf ("failed to open inliner phase 2 output file %s\n",
         OPTIMIZER_PHASE_2_OUTPUT_NAME);
      return;
   }
   for (i = 0; i < func_count; i++) {
      if (!func[i].needs_BC 
      &&  func[i].leaf 
      &&  ((func[i].call_count == 1) || (func[i].line_count <= lines))) {
#if DEBUG      
         printf("function %s inlinable (count=%d, lines=%d)\n", 
            func[i].name, func[i].call_count,
            func[i].line_count);
#endif      
         /* only output functions that can be inlined */
         fprintf(f, "%s %d\n", func[i].name, func[i].size);
         fprintf(f, "[\n");
         line = func[i].line;
         while (line != NULL) {
            fprintf(f, "%s\n", line->text);
            line = line->next;
         }
         fprintf(f, "]\n");
      }
#if DEBUG      
      else {
         printf("function %s not inlinable (needs_BC=%d, leaf=%d, count=%d, lines = %d)\n", 
            func[i].name, 
            func[i].needs_BC,
            func[i].leaf,
            func[i].call_count,
            func[i].line_count);
      }
#endif      
   }
   fclose(f);
}

int inlinable_function(char *name) {
   int i;

#if DEBUG      
   printf("looking for %s\n", name);
#endif      
   for (i = 0; i < func_count; i++) {
      if (func[i].name == NULL) {
         break; 
      }
      if (strcmp(func[i].name, name) == 0) {
         break;
      }
   }
   if (i < func_count) {
#if DEBUG      
      printf("%s found\n", name);
#endif      
      return i;
   }
   else {
#if DEBUG      
      printf("%s not found\n", name);
#endif      
      return -1;
   }
}

#define max(a,b) ((a)>(b)?(a):(b))

int inline_depth(int i, int depth) {
   struct function_line *line;

   if (depth >= MAX_RECURSE) {
      return MAX_RECURSE;
   }
   if (func[i].leaf) {
      return depth + 1;
   }
   line = func[i].line;
   while (line != NULL) {
      if (line->func >= 0) {
#if DEBUG
         printf("function %s, func %d, depth %d\n", func[i].name, line->func, depth);
#endif         
         depth = max (depth, inline_depth(line->func, depth + 1));
      }
      line = line->next;
   }
   return depth;
}

void initialize_phase_3_fn() {
   FILE *f;
   char line[MAX_LINE];
   char name[MAX_LINE];
   char *fname;
   int  s;
   int  i, j, k;
   struct function_line *newtext;
   struct function_line *last;
   struct function_line *call1;
   struct function_line *call2;
   struct function_line *call3;
   struct function_line *call4;
   struct function_line *call5;

   if ((f = fopen(OPTIMIZER_PHASE_2_OUTPUT_NAME, "r")) == NULL) {
      printf ("failed to open inliner phase 2 output file %s\n",
         OPTIMIZER_PHASE_2_OUTPUT_NAME);
      return;
   }
   // read in the inlinable functions
   while (fgets(line, MAX_LINE, f) != NULL) {
      sscanf(line, "%s %d", (char *)&name, &s);
      i = 0;

      for (i = 0; i < func_count; i++) {
         if (strcmp(name, func[i].name) == 0) {
            func[i].call_count++;
            break;
         }
      }
      if (i == func_count) {
         func[i].name = strdup(name);
         func[i].size = s;
         func[i].leaf = 0;
         func[i].needs_BC = 0;
         func[i].call_count = 1;
         func[i].line = NULL;
#if DEBUG      
         printf("input: %s %d\n", func[func_count].name, func[func_count].size);
#endif      
         func_count++;
         last = NULL;
         while (fgets(line, MAX_LINE, f) != NULL) {
            if (strncmp(line, "[", 1) != 0) {
               if (strncmp(line, "]", 1) == 0) {
                  break;
               }
#if DEBUG      
               printf(" line: %s", line);
#endif      
               malloc(&newtext, sizeof(struct function_line));
               if (newtext == NULL) {
                  printf("out of memory\n");
                  return;
               }
               newtext->func = -1;
               newtext->next = NULL;
               strncpy(newtext->text, line, MAX_LINE);
               if (last == NULL) {
                  func[i].line = newtext;
               }
               else {
                  last->next = newtext;
               }
               last = newtext;
               func[i].line_count++;
            }
         }
      }
   }
#if DEBUG      
   printf("input %d functions\n", func_count);
#endif      
   fclose(f);

   // now resolve inlinable functions that contain references to other 
   // inlinable functions.
   for (i = 0; i < func_count; i++) {
#if DEBUG      
      printf("looking for inlinable functions in %s\n", func[i].name);
#endif      
      if (!func[i].leaf) {
#if DEBUG      
         printf("function %s is not a leaf function\n", func[i].name);
#endif      
         call1 = func[i].line;
         while (call1 != NULL) {
            call2 = call1->next;
            if (call2 == NULL) {
               break;
            }
            call3 = call2->next;
            if (call3 == NULL) {
               break;
            }
            call4 = call3->next;
            if (call4 == NULL) {
               break;
            }  
            call5 = call4->next;
            if (call5 == NULL) {
               break;
            }  
            if (strncmp(call1->text,     " mov BC, #", 10) == 0) {
               if ((strncmp(call2->text, " sub SP, #", 10) == 0) 
               &&  (strncmp(call3->text, " jmp #CALA", 10) == 0)
               &&  (strncmp(call4->text, " long @",     7) == 0)
               &&  (strncmp(call5->text, " add SP, #", 10) == 0)) {
                  j = 0;
                  while (isalnum(call4->text[j+7]) 
                  ||     (call4->text[j+7] == '_')) {
                     name[j] = call4->text[j+7];
                     j++;
                  }
                  name[j]='\0';
                  if ((k = inlinable_function(name)) >= 0) {
#if DEBUG      
                     printf("inlining 5 instruction call to function %s in function %s\n", name, func[i].name);
#endif      
                     call1->func = k;
                     call1->text[0] ='\0';
                     call2->text[0] ='\0';
                     call3->text[0] ='\0';
                     call4->text[0] ='\0';
                     call5->text[0] ='\0';
                  }
                  call1 = call5->next;
               } 
               else if ((strncmp(call2->text, " jmp #CALA", 10) == 0)
               &&       (strncmp(call3->text, " long @",     7) == 0)) {
                  j = 0;
                  while (isalnum(call3->text[j+7]) 
                  ||     (call3->text[j+7] == '_')) {
                     name[j] = call3->text[j+7];
                     j++;
                  }
                  name[j]='\0';
                  if ((k = inlinable_function(name)) >= 0) {
#if DEBUG      
                     printf("inlining 2 instruction call to function %s\n in function %s", name, func[i].name);
#endif      
                     call1->func = k;
                     call1->text[0] ='\0';
                     call2->text[0] ='\0';
                     call3->text[0] ='\0';
                  }
                  call1 = call2->next;
               }
               else {
                  call1 = call2;
               }
            }
            else {
               call1 = call2;
            }
         } 
      }
      else {
#if DEBUG      
         printf("function %s is a leaf function\n", func[i].name);
#endif      
      }         
   }
   // now trace recursive inlines and disable any that have depth > MAX_RECURSE
   for (i = 0; i < func_count; i++) {
#if DEBUG
         printf("checking inline recursion for function %s\n", func[i].name);
#endif         
      if (inline_depth(i, 0) >= MAX_RECURSE) {
#if DEBUG
         printf("function %s exceeds inline recursion limit - disabling\n", 
            func[i].name);
#endif         
         func[i].name = strdup("** not inlinable **");
      }
   }
}

void insert_func(int i) {
   struct function_line *line;

   printf("' Catalina Optimizer Inlined %s begins\n", func[i].name);
   line = func[i].line;
   while (line != NULL) {
      if (line->func >= 0) {
         insert_func(line->func);
         line = line->next;
         while (line && (line->text[0] = '\0')) {
            line = line-> next;
         }
      }
      else {
         printf("%s", line->text);
         line = line->next;
      }
   }
   printf("' Catalina Optimizer Inlined %s ends\n", func[i].name);
}

void insert_inline_fn( a_VARARG *va ) { 
   char *name;
   double leaf;
   int i;
   struct function_line *line;

   if (va->used < 1) {
     awka_error("no arguments to insert_inline\n", 
       va->used);
   }
   name = awka_gets(va->var[0]);
   for (i = 0; i < func_count; i++) {
      if (func[i].name == NULL) {
         break; 
      }
      if (strcmp(func[i].name, name) == 0) {
         break;
      }
   }
   if (i < func_count) {
      insert_func(i);
   }
   else {
#if DEBUG      
      printf("cannot find function %s\n", name);
#endif      
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

a_VAR * bytes_to_addr24_fn( a_VARARG *va ) { 
  a_VAR *ret = NULL;
  unsigned long hex = 0;
  unsigned long byte = 0;
  int i;

  if (va->used < 4) {
    awka_error("function bytes_to_addr24 expected 4 arguments, got %d.\n", 
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
  hex /= 4;
  hex &= 0xFFFFFF;
#if DEBUG  
  printf("combined bytes value = %X\n", hex);
#endif  
  ret->dval = (float) hex;
  return ret;
}

a_VAR * candidate_id_fn( a_VARARG *va ) {
  a_VAR *ret = NULL;
  char *str;
  char *sub;
  unsigned int id;

  str = awka_gets(va->var[0]);
  sub = strstr(str, "' Catalina Optimizer ");
  if (sub != 0) {
     sscanf(sub, "' Catalina Optimizer %u", &id);
  }
  else {
     id = 0;
  }
  ret = awka_getdoublevar(FALSE);
  ret->dval = (float) id;
  return ret;
}

a_VAR * str_to_addr24_fn( a_VARARG *va ) { 
  a_VAR *ret = NULL;
  unsigned long hex = 0;

  if (va->used < 1) {
    awka_error("function str_to_addr24 - no arguments\n");
  }

  ret = awka_getdoublevar(FALSE);
  sscanf(awka_gets(va->var[0]), "%lX", &hex);
  hex /= 4;
  hex &= 0xFFFFFF;
#if DEBUG  
  printf("converted hex value = %X\n", hex);
#endif  
  ret->dval = (float) hex;
  return ret;
}

void initialize_phase_6_fn() {
   FILE *f;
   char line[MAX_LINE];
   int i, j;

   if ((f = fopen(OPTIMIZER_PHASE_5_OUTPUT_NAME, "r")) == NULL) {
      printf ("failed to open phase 5 output file %s\n",
         OPTIMIZER_PHASE_5_OUTPUT_NAME);
      return;
   }
   while (fgets(line, MAX_LINE, f) != NULL) {
      sscanf(line, "%d", &instr[instr_count].n);
      i = 0;
      while ((line[i] != '\0') && (line[i] != ' ')) {
         i++;
      }
      if (line[i] == ' ') {
         i++;
      }
      j = i;
      while ((line[j] != '\0') && (line[j] != '\n')) {
         j++;
      }
      if (line[j] == '\n') {
         line[j] = '\0';
      }
      instr[instr_count].str = strdup(&line[i]);
#if DEBUG      
      printf("%d %s\n", instr[instr_count].n, instr[instr_count].str);
#endif      
      instr_count++;
   }
   fclose(f);
}

a_VAR * can_optimize_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   int n;
   int i;

   n = (int) awka_getd(va->var[0]);
#if DEBUG      
   printf("optimizing %d\n", n);
#endif      
   for (i = 0; i <instr_count; i++) {
      if (instr[i].n == n) {
         break; 
      }
   }
   ret = awka_getstringvar(FALSE);
   if (i < instr_count) {
#if DEBUG      
      printf("as %s\n", instr[i].str);
#endif      
      awka_strcpy(ret, instr[i].str);
   }
   else {
#if DEBUG      
      printf("is not possible\n");
#endif      
      awka_strcpy(ret, "");
   }
   return ret;
}

a_VAR * optimize_add_fn( a_VARARG *va ) {

   a_VAR *ret = NULL;
   ret = awka_getdoublevar(FALSE);
   ret->dval = (float)(strstr(awka_gets(va->var[0]), "add") != NULL);
   return ret;
}

void initialize_phase_8_fn() {
   FILE *f;
   char line[MAX_LINE];
   char name[MAX_LINE];
   int  s;
   int  i, j;

   if ((f = fopen(OPTIMIZER_PHASE_7_OUTPUT_NAME, "r")) == NULL) {
      printf ("failed to open phase 7 output file %s\n",
         OPTIMIZER_PHASE_7_OUTPUT_NAME);
      return;
   }
   while (fgets(line, MAX_LINE, f) != NULL) {
      sscanf(line, "%s %d", (char *)&name, &s);
      i = 0;

      for (i = 0; i < func_count; i++) {
         if (strcmp(name, func[i].name) == 0) {
            break;
         }
      }
      if (i == func_count) {
         func[i].name = strdup(name);
         func[i].size = s;
         func[i].needs_BC = 0;
#if DEBUG      
         printf("input: %s %d\n", func[func_count].name, func[func_count].size);
#endif      
         func_count++;
      }
   }
#if DEBUG      
   printf("input %d functions\n", func_count);
#endif      
   fclose(f);
}

void uses_BC_fn( a_VARARG *va ) {
   char *name;
   int i;

   name = awka_gets(va->var[0]);
#if DEBUG      
   printf("marking %s as needs BC\n", name);
#endif      
   for (i = 0; i < func_count; i++) {
      if (func[i].name == NULL) {
         break; 
      }
      if (strcmp(func[i].name, name) == 0) {
         break;
      }
   }
   if (i < func_count) {
      func[i].needs_BC = 1;
   }
}

a_VAR * known_function_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   int i;

   name = awka_gets(va->var[0]);
#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < func_count; i++) {
      if (func[i].name == NULL) {
         break; 
      }
      if (strcmp(func[i].name, name) == 0) {
         break;
      }
   }
   ret = awka_getdoublevar(FALSE);
   if (i < func_count) {
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

void finalize_phase_8_fn() {
   FILE *f;
   char line[MAX_LINE];
   char name[MAX_LINE];
   int  s;
   int  i, j;

   if ((f = fopen(OPTIMIZER_PHASE_8_OUTPUT_NAME, "w")) == NULL) {
      printf ("failed to open phase 8 output file %s\n",
         OPTIMIZER_PHASE_8_OUTPUT_NAME);
      return;
   }
   for (i = 0; i < func_count; i++) {
      if (!func[i].needs_BC) {
         /* only output functions that don't need BC */
         fprintf(f, "%s %d\n", func[i].name, func[i].size);
      }
   }
   fclose(f);
}

void initialize_phase_9_fn() {
   FILE *f;
   char line[MAX_LINE];
   char name[MAX_LINE];
   int  s;
   int  i, j;

   if ((f = fopen(OPTIMIZER_PHASE_8_OUTPUT_NAME, "r")) == NULL) {
      printf ("failed to open phase 8 output file %s\n",
         OPTIMIZER_PHASE_8_OUTPUT_NAME);
      return;
   }
   while (fgets(line, MAX_LINE, f) != NULL) {
      sscanf(line, "%s %d", (char *)&name, &s);
      i = 0;

      for (i = 0; i < func_count; i++) {
         if (strcmp(name, func[i].name) == 0) {
            func[i].call_count++;
            break;
         }
      }
      if (i == func_count) {
         func[i].name = strdup(name);
         func[i].size = s;
         func[i].leaf = 0;
         func[i].needs_BC = 0;
         func[i].call_count = 1;
         func[i].line = NULL;
#if DEBUG      
         printf("input: %s %d\n", func[func_count].name, func[func_count].size);
#endif      
         func_count++;
      }
   }
#if DEBUG      
   printf("input %d functions\n", func_count);
#endif      
   fclose(f);
}

void initialize_phase_12_fn() {
   FILE *f;
   char line[MAX_LINE];
   char name[MAX_LINE];
   int  i, j;

   if ((f = fopen(OPTIMIZER_PHASE_11_OUTPUT_NAME, "r")) == NULL) {
      printf ("failed to open inliner phase 11 output file %s\n",
         OPTIMIZER_PHASE_11_OUTPUT_NAME);
      return;
   }

   // C_main is always required!
   func[0].name = strdup("C_main");
   func[0].leaf = 0;
   func[0].needs_BC = 1;
   func[0].call_count = 1;
   func[0].line = NULL;

   func[1].name = strdup("C__exit");
   func[1].leaf = 0;
   func[1].needs_BC = 1;
   func[1].call_count = 1;
   func[1].line = NULL;

   func[2].name = strdup("C_debug_init");
   func[2].leaf = 0;
   func[2].needs_BC = 1;
   func[2].call_count = 1;
   func[2].line = NULL;

   func_count = 3;

   while (fgets(line, MAX_LINE, f) != NULL) {
      sscanf(line, "%s", (char *)&name);
      i = 0;

      for (i = 0; i < func_count; i++) {
         if (strcmp(name, func[i].name) == 0) {
            func[i].call_count++;
            break;
         }
      }
      if (i == func_count) {
         func[i].name = strdup(name);
         func[i].leaf = 0;
         func[i].needs_BC = 0;
         func[i].call_count = 1;
         func[i].line = NULL;
#if DEBUG      
         printf("input: %s\n", func[func_count].name);
#endif      
         func_count++;
      }
   }
#if DEBUG      
   printf("input %d functions\n", func_count);
#endif      
   fclose(f);
}

void finalize_phase_12_fn() {
   FILE *f;
   char name[MAX_LINE];
   struct function_line *line;
   int  s;
   int  i, j;
   int  more;

   if ((f = fopen(OPTIMIZER_PHASE_12_OUTPUT_NAME, "w")) == NULL) {
      printf ("failed to open inliner phase 12 output file %s\n",
         OPTIMIZER_PHASE_12_OUTPUT_NAME);
      return;
   }

   // need all parents of all required data segment references
   do {
      more = 0;
      for (i = 0; i < func_count; i++) {
         if (func[i].needs_BC) {
            for (j = 0; j < kids_count; j++) {
               if (!rels[j].code && rels[j].child == i) {
                  if (!func[rels[j].parent].needs_BC) {
                     func[rels[j].parent].needs_BC = 1;
#if DEBUG                     
                     printf("function %s required (data child required)\n", func[rels[j].child].name);
#endif         
                     more = 1;
                  }
               }
            }
         }
      }
   } while (more);

   // need all children of all required code or data segment references
   do {
      more = 0;
      for (i = 0; i < func_count; i++) {
         if (func[i].needs_BC) {
            for (j = 0; j < kids_count; j++) {
               if (rels[j].parent == i) {
                  if (!func[rels[j].child].needs_BC) {
                     func[rels[j].child].needs_BC = 1;
#if DEBUG                     
                     printf("function %s required (code parent required)\n", func[rels[j].child].name);
#endif         
                     more = 1;
                  }
               }
            }
         }
      }
   } while (more);

   for (i = 0; i < func_count; i++) {
      if (func[i].needs_BC) {
#if DEBUG      
         printf("function %s required\n", func[i].name);
#endif      
         /* only output functions that are required */
         fprintf(f, "%s\n", func[i].name);
      }
#if DEBUG      
      else {
         printf("function %s not required\n", func[i].name);
      }
#endif      
   }
   fclose(f);
}

void uses_FN_fn( a_VARARG *va ) {
   char *name;
   char *uses;
   int i,j;
   double code;

   if (va->used < 3) {
     awka_error("function uses_FN expected 3 arguments, got %d.\n", 
       va->used);
   }
   name = awka_gets(va->var[0]);
   uses = awka_gets(va->var[1]);
   code = (int)awka_getd(va->var[2]);
#if DEBUG      
   printf("marking %s as needs fn %s\n", name, uses);
#endif      
   for (i = 0; i < func_count; i++) {
      if (func[i].name == NULL) {
         break; 
      }
      if (strcmp(func[i].name, name) == 0) {
         break;
      }
   }
   if (i < func_count) {
      for (j = 0; j < func_count; j++) {
         if (func[j].name == NULL) {
            break; 
         }
          if (strcmp(func[j].name, uses) == 0) {
           break;
         }
      }
      if (j < func_count) {
         if (kids_count < MAX_KIDS - 1) {
            rels[kids_count].parent = i;
            rels[kids_count].child = j;
            rels[kids_count].code = code;
            kids_count++;
         }
      }
   }
}

void initialize_phase_13_fn() {
   FILE *f;
   char line[MAX_LINE];
   char name[MAX_LINE];
   char *fname;
   int  i, j, k;
   struct function_line *newtext;
   struct function_line *last;
   struct function_line *call1;
   struct function_line *call2;
   struct function_line *call3;
   struct function_line *call4;
   struct function_line *call5;

   if ((f = fopen(OPTIMIZER_PHASE_12_OUTPUT_NAME, "r")) == NULL) {
      printf ("failed to open phase 12 output file %s\n",
         OPTIMIZER_PHASE_12_OUTPUT_NAME);
      return;
   }
   // read in the requuired functions
   while (fgets(line, MAX_LINE, f) != NULL) {
      sscanf(line, "%s", (char *)&name);
      i = 0;

      for (i = 0; i < func_count; i++) {
         if (strcmp(name, func[i].name) == 0) {
            break;
         }
      }
      if (i == func_count) {
         func[i].name = strdup(name);
         func[i].size = 0;
         func[i].leaf = 0;
         func[i].needs_BC = 1;
         func[i].call_count = 0;
         func[i].line = NULL;
#if DEBUG      
         printf("input: %s\n", func[func_count].name);
#endif      
         func_count++;
      }
   }
#if DEBUG      
   printf("input %d functions\n", func_count);
#endif      
   fclose(f);
}

a_VAR * required_function_fn( a_VARARG *va ) {
   a_VAR *ret = NULL;
   char *name;
   int i;

   name = awka_gets(va->var[0]);
#if DEBUG      
   printf("checking %s\n", name);
#endif      
   for (i = 0; i < func_count; i++) {
      if (func[i].name == NULL) {
         break; 
      }
      if (strcmp(func[i].name, name) == 0) {
         break;
      }
   }
   ret = awka_getdoublevar(FALSE);
   if ((i < func_count) && (func[i].needs_BC)) {
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


