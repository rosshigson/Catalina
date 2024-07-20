#
# Phase 2
#
# AWK script to identify functions that can be inlined
# (and save their 'inlinable' section). An 'inlinable'
# function must:
#     (not spill arguments to stack)
# AND (not have local variables)
# AND (not use the frame pointer)
# AND (not have its address taken other than by a CALA)
# AND (   (be a leaf function - i.e. no 'CALA' or 'CALI')
#      OR (be called once only, or be less than or equal to SIX longs)
#
BEGIN {
   initialize_phase_2();
}
/^'/ { next }
/^{/ {
   getline
   while (left($0,1) != "}") {
      getline
   }
   next
}
/^C_/  {
   f = $1; 
   if ((f == "C__exit") ||  (f == "C__context_switch") ||  (f == "C__thread_force_switch") ||  (f == "C__context_do_switch")) {
      /* pretend this function uses BC - since we don't want it inlined */
      uses_BC(f);
   }
   else if (known_function(f)) {
      /* printf("processing known function %s\n", f) */
      leaf = 1;
      done = 0;
      getline; while ($1 == "alignl") { getline }
      if (left($0,1) == "{") {
         /* skip code that is commented out */
         getline;
         while (left($0,1) != "}") {
            getline;
         }
         getline; while ($1 == "alignl") { getline }
      }
      if (($1 == "long") && ($2 == "I32_NEWF")) {
         /* strip the call to NEWF - we simulate it later */
         getline; while ($1 == "alignl") { getline }
      }
      while (done == 0) {
         if (left($0,1) == "{") {
            /* skip code that is commented out */
            getline;
            while (left($0,1) != "}") {
               getline;
            }
            getline; while ($1 == "alignl") { getline }
         }
         if ((left($0,19) == " word I16A_SUB + SP") || (left($0,20) == " word I16A_SUBI + SP")) {
            /* pretend this function uses BC - actually it has local vars */
            uses_BC(f);
            /* printf("%s has local vars\n", f) */
            done = 1;
         }
         else if ((($1 == "long") && ($2 == "I32_LODF")) || (($1 == "word") && ($2 == "I16B_LODF"))) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            /* printf("%s uses FP\n", f) */
            done = 1;
         }
         else if (index($0, "+ FP<<") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            /* printf("%s uses FP\n", f) */
            done = 1;
         }
         else if (index($0, "+ FP <<") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            /* printf("%s uses FP\n", f) */
            done = 1;
         }
         else if (index($0, "+FP<<") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            /* printf("%s uses FP\n", f) */
            done = 1;
         }
         else if (index($0, "+FP <<") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            /* printf("%s uses FP\n", f) */
            done = 1;
         }
         else if (index($0, "+(FP)") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            /* printf("%s uses FP\n", f) */
            done = 1;
         }
         else if (index($0, "+ (FP)") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            /* printf("%s uses FP\n", f) */
            done = 1;
         }
         else if (left($0, 15) == " long I32_SPILL") {
            /* functions that spill arguments cannot be inlined */
            uses_BC(f);
            /* printf("%s spills arguments\n", f) */
            done = 1;
         }
         else if (left($0, 2) == "C_") {
            /* functions that define global labels cannot be inlined */
            uses_BC(f);
            /* printf("%s defines a label\n", f) */
            done = 1;
         }
         else if ((($1 == "word") && ($2 == "I16B_CALI")) || (($1 == "long") && ($2 == "I32_CALA"))) {
            /* printf("%s is not a leaf\n", f) */
            leaf = 0;
         }
         else if ((($1 == "long") && ($2 == "I32_RETF")) || (($1 == "word") && ($2 == "I16B_RETF")) || (($1 == "word") && ($2 == "I16B_RETN"))) {
            /* strip the call to RETF or RETN - we simulate it later */
            done = 1;
         }
         else if (($1 == "word") && ($2 == "I16B_POPM")) {
            if ($4 != "$180<<S16B") {
               /* POPM with implicit return - replace with a simple POPM */
               /* printf("%s replacing POPM with implicit return with simple POPM\n", f) */
               add_line_to_function(f, "word I16B_POPM + $180<<S16B");
               /* strip the implicit RETF or RETN - we simulate it later */
               done = 1;
            }
         }
         else if (($1 == "'") && (left($2, 3) == "end") && ($3 == f)) {
            /* this line indicates we have reached the end, even if it is not a normal termination */
            done = 1;
         }
         else if (left($0,15) == " word I16B_LODL") {
            add_line_to_function(f, $0);
            getline; while ($1 == "alignl") { getline }
         }
         if (!done) {
            if (left($0,15) == " jmp #FC_RETURN") {
               /* when inlining a function that ends in jmp #FC_RETURN, translate to jmp #FC_INLINE */
               add_line_to_function(f, " jmp #FC_INLINE");
            } 
            else {
               add_line_to_function(f, $0);
            }
         }
         getline; while ($1 == "alignl") { getline }
      }
      set_leaf(f, leaf);
      f = "no function";
   }
   next;
}
/^[ \t]+long[ \t]+I32_LODA/ {
   /* check for   long I32_LODA + ((@C_main_4_L000005)&$FFFFFF)<<S32 */
   /* or          long I32_LODA + (@C_main_6_L000007)<<S32 */
   if (right($4, 15) == ")&$FFFFFF)<<S32") {
      f = left($4,length($4)-15)
   }
   else {
      f = left($4,length($4)-6)
   }
   f = ltrim(f,"(");
   if (left(f,1) == "@") {
      if (known_function(f)) {
         /* pretend it uses BC - actually, its address is being taken for some reason (other than a function call) */
         uses_BC(f);
         /* printf("address taken %s\n", $0) */
      }
   }
}
/^[ \t]+long[ \t]+@/ {
   f = ltrim($2, "@"); 
   if (known_function(f)) {
      /* pretend it uses BC - actually, its address is being taken for some reason (other than a function call) */
      uses_BC(f);
      /* printf("address taken %s\n", $0) */
   }
}
END {
   finalize_phase_2(4);
}
