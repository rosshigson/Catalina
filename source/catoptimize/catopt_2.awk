#
# Phase 2
#
# AWK script to identify functions that can be inlined
# (and save their 'inlinable' section). An 'inlinable'
# function must:
#     (not use BC - i.e. not spill arguments to stack)
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
   getline;
   while (left($0,1) != "}") {
      getline;
   }
   next;
}
/^C_/  {
   f = $1; 
   if (f == "C__exit") {
      /* pretend C__exit uses BC - since we don't want it inlined */
      uses_BC(f);
   }
   else if (known_function(f)) {
      leaf = 1;
      done = 0;
      getline;
      if (left($0,1) == "{") {
         /* skip code that is commented out */
         getline;
         while (left($0,1) != "}") {
            getline;
         }
         getline;
      }
      if ((($1 == "jmp") && ($2 == "#NEWF")) || (($1 == "calld") && ($2 == "PA,#NEWF"))) {
         /* strip the call to NEWF - we simulate it later */
         getline;
      }
      if ((($1 == "jmp") && (($2 == "#CALI") || ($2 == "#CALA"))) || (($1 == "calld") && (($2 == "PA,#CALI") || ($2 == "PA,#CALA")))) {
         leaf = 0;
         add_line_to_function(f, $0);
         getline;
         if (left($0,1) == "{") {
            /* skip code that is commented out */
            getline;
            while (left($0,1) != "}") {
               getline;
            }
            getline;
         }
      }
      if ((($1 == "jmp") && (($2 == "#RETF") || ($2 == "#RETN"))) || (($1 == "calld") && (($2 == "PA,#RETF") || ($2 == "PA,#RETN")))) {
         /* strip the call to RETF or RETN - we simulate it later */
         done = 1;
      }
      if (done == 0) {
         if (left($0,10) == " sub SP, #") {
            /* pretend this function uses BC - actually it has local vars */
            uses_BC(f);
            done = 1;
         }
         else if ((left($0,10) == " jmp #LODF") || (left($0,15) == " calld PA,#LODF")) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (index($0, ", FP") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (index($0, ",FP") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (index($0, " FP,") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (index($0, "\tFP,") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (left($0, 2) == "C_") {
            /* pretend this function uses BC - acutally it defines a label */
            uses_BC(f);
            done = 1;
         }
         else if ((left($0,10) == " jmp #LODL") || (left($0,15) == " calld PA,#LODL")) {
            add_line_to_function(f, $0);
            getline;
            add_line_to_function(f, $0);
            getline;
            if (left($0,11) == " sub SP, RI") {
               /* pretend this function uses BC - actually it has local vars */
               uses_BC(f);
               done = 1;
            }
            if ((($1 == "jmp") && (($2 == "#CALI") || ($2 == "#CALA"))) || (($1 == "calld") && (($2 == "PA,#CALI") || ($2 == "PA,#CALA")))) {
               add_line_to_function(f, $0);
               getline;
               leaf = 0;
            }
            else if ((($1 == "jmp") && (($2 == "#RETF") || ($2 == "#RETN"))) || (($1 == "calld") && (($2 == "PA,#RETF") || ($2 == "PA,#RETN")))) {
               /* strip the call to RETF or RETN - we simulate it later */
               done = 1;
            }
         }
         if ((($1 == "jmp") && (($2 == "#CALI") || ($2 == "#CALA"))) || (($1 == "calld") && (($2 == "PA,#CALI") || ($2 == "PA,#CALA")))) {
            add_line_to_function(f, $0);
            getline;
            leaf = 0;
         }
         else if ((($1 == "jmp") && (($2 == "#RETF") || ($2 == "#RETN"))) || (($1 == "calld") && (($2 == "PA,#RETF") || ($2 == "PA,#RETN")))) {
            /* strip the call to RETF or RETN - we simulate it later */
            done = 1;
         }
      }
      if (done == 0) {
         if ((left($0, 10) == " jmp #PSHM") || (left($0, 15) == " calld PA,#PSHM")) {
            add_line_to_function(f, $0);
            getline;
            add_line_to_function(f, $0);
            getline;
         }
         if ((($1 == "jmp") && (($2 == "#CALI") || ($2 == "#CALA"))) || (($1 == "calld") && (($2 == "PA,#CALI") || ($2 == "PA,#CALA")))) {
            leaf = 0;
            add_line_to_function(f, $0);
            getline;
         }
         else if ((($1 == "jmp") && (($2 == "#RETF") || ($2 == "#RETN"))) || (($1 == "calld") && (($2 == "PA,#RETF") || ($2 == "PA,#RETN")))) {
            /* strip the call to RETF or RETN - we simulate it later */
            done = 1;
         }   
      }
      if (done == 0) {
         if (left($0, 11) == " mov RI, FP") {
            add_line_to_function(f, $0);
            getline;
            if (left($0, 11) == " add RI, #8") {
               add_line_to_function(f, $0);
               getline;
               if (left($0, 11) == " sub BC, #4") {
                  /* it's probably not necessary to check so far */
                  add_line_to_function(f, $0);
                  getline;
                  uses_BC(f);
                  done = 1;
               }
            }
         }
      }
      while (done == 0) {
         if (left($0,1) == "{") {
            /* skip code that is commented out */
            getline;
            while (left($0,1) != "}") {
               getline;
            }
            getline;
         }
         else if ((($1 == "jmp") && (($2 == "#CALI") || ($2 == "#CALA"))) || (($1 == "calld") && (($2 == "PA,#CALI") || ($2 == "PA,#CALA")))) {
            leaf = 0;
         }
         else if ((left($0,10) == " jmp #LODF") || (left($0,15) == " calld PA,#LODF")) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (index($0, ", FP") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (index($0, ",FP") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (index($0, " FP,") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (index($0, "\tFP,") != 0) {
            /* pretend this function uses BC - actually it uses FP */
            uses_BC(f);
            done = 1;
         }
         else if (left($0, 2) == "C_") {
            /* pretend this function uses BC - acutally it defines a label */
            uses_BC(f);
            done = 1;
         }
         else if ((($1 == "jmp") && (($2 == "#RETF") || ($2 == "#RETN"))) || (($1 == "calld") && (($2 == "PA,#RETF") || ($2 == "PA,#RETN")))) {
            /* strip the call to RETF or RETN - we simulate it later */
            done = 1;
            break;
         }
         add_line_to_function(f, $0);
         getline;
      }
      set_leaf(f, leaf);
      f = "no function";
   }
   next;
}
/^[ \t]+jmp[ \t]+#CALA/ || /^[ \t]+calld[ \t]PA,#CALA/ {
   /* ignore this line and next - this is a function call */
   /* printf("skip %s\n", $0) */
   getline;
   /* printf("skip %s\n", $0) */
   next;

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
   finalize_phase_2(6);
}
