#
# Phase 12
#
# AWK script to identify the functions used by each known function, or if
# the functions address is taken (which means it is used).
#
BEGIN {
   code = 0;
   initialize_phase_12();
}
/^'/ { next }
/^{/ {
   getline;
   while (left($0,1) != "}") {
      if (getline <= 0) {
         break;
      }
   }
   next;
}
/^Catalina_Code/ {
   code = 1;
}
/^Catalina_Cnst/ {
   code = 0;
}
/^Catalina_Data/ {
   code = 0;
}
/^Catalina_Init/ {
   code = 0;
}
/^C_/  {
   f = $1; 
   if (f == "C__context_switch") {
      # if this function is present, it means the code is 
      # multi-threaded, so prevent it being removed even
      # if it is not used by saying that C_main uses it!
      uses_FN("C_main", f, code);
   }
   if (code && known_function(f)) {
      # printf("function %s\n", f)
      done = 0;
      getline;
      while (done == 0) {
         if (left($0,1) == "{") {
            /* skip code that is commented out */
            do {
               if (getline <- 0) {
                  break;
               }
            } while (left($0,1) != "}");
         }
         else if (left($1,2) == "C_") {
            u = $1;
            uses_FN(f, u, code);
            # printf("uses %s\n", u)
         }
         else if (($2 == "I16B_RETF") || ($2 == "I32_RETF") || ($2 == "I16B_RETN") || (($2 == "I16B_POPM") && (left($4,4) != "$180"))) {
            /* this terminates function */
            # printf("function %s terminated by RETF/RETN/POPM\n", f)
            done = 1;
         }
         else if (($1 == "'") && (left($2, 3) == "end")) {
            /* this terminates function */
            # printf("function %s terminated by ' end\n", f)
            done = 1;
         }
         else if (($2 == "I32_CALA") || ($2 == "I32_LODI") || ($2 == "I32_LODA") || ($2 == "I32_PSHA")) {
            u = left($4,length($4)-5);
            if (left(u,1) == "(") {
               u = ltrim(u,"(");
               u = rtrim(u,")");
            }
            if (left(u,1) == "@") {
               u = ltrim(u,"@");
               if ((i = index(u,"+")) > 1) {
                   u = left(u, i-1)
               }
               if ((i = index(u,"-")) > 1) {
                  u = left(u, i-1)
               }
               uses_FN(f, u, code);
               # printf("uses %s\n", u)
            }
         }
         else if (($2 == "I32_LODS")) {
            # printf("%s\n", $6)
            u = left($6,length($6)-14);
            if (left(u,1) == "(") {
               u = ltrim(u,"(");
               u = rtrim(u,")");
            }
            if (left(u,1) == "@") {
               u = ltrim(u,"@");
               if ((i = index(u,"+")) > 1) {
                   u = left(u, i-1)
               }
               if ((i = index(u,"-")) > 1) {
                  u = left(u, i-1)
               }
               uses_FN(f, u, code);
               # printf("uses %s\n", u)
            }
         }
         else if ($2 == "I16B_LODL") {
            /* address being taken */
            getline;
            if (left($1,6) == "alignl") {
               getline;
            }
            if (left($2,1) == "@") {
               u = ltrim($2,"@");
               if ((i = index(u,"+")) > 1) {
                   u = left(u, i-1)
               }
               if ((i = index(u,"-")) > 1) {
                  u = left(u, i-1)
               }
               uses_FN(f, u, code);
               # printf("uses %s\n", u)
            }
         }
         if (getline <= 0) {
            break;
         }
      }
      f = "no function";
   }
   else if (!code && known_function(f)) {
      # printf("function %s\n", f)
      done = 0;
      getline;
      while (done == 0) {
         if (left($0,1) == "{") {
            /* skip code that is commented out */
            getline;
            while (left($0,1) != "}") {
               if (getline <= 0) {
                  break;
               }
            }
            getline;
         }
         else if (($1 == "'" ) || ($1 == "byte") || ($1 == "word") || ($1 == "alignl")) {
            /* ignore these */
            getline;
         }
         else if (($1 == "long") && (left($2,1) == "@")) {
            u = ltrim($2, "@"); 
            if ((i = index(u,"+")) > 1) {
               u = left(u, i-1)
            }
            if ((i = index(u,"-")) > 1) {
               u = left(u, i-1)
            }
            uses_FN(f, u, code);
            # printf("uses %s\n", u)
            getline;
         }
         else if ($1 == "long") {
            /* ignore these */
            getline;
         }
         else {
            done = 1;
         }
      }
   }
   next;
}
END {
   finalize_phase_12();
}
