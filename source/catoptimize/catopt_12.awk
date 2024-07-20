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
   if (code && known_function(f)) {
      #printf("function %s\n", f)
      done = 0;
      getline;
      while (done == 0) {
         if (left($0,1) == "{") {
            /* skip code that is commented out */
            do {
               if (getline <= 0) {
                  break;
               }
            } while (left($0,1) != "}");
         }
         else if (left($1,2) == "C_") {
            u = $1;
            uses_FN(f, u, code);
            #printf("uses %s\n", u)
         }
         else if ((($1 == "jmp") && (($2 == "#RETF") || ($2 == "#RETN"))) || (($1 == "calld") && (($2 == "PA,#RETF") || ($2 == "PA,#RETN")))) {
            /* this terminates function */
            #printf("function %s terminated by RETF/RETN\n", f)
            done = 1;
         }
         else if (($1 == "'") && (left($2, 3) == "end")) {
            /* this terminates function */
            #printf("function %s terminated by ' end\n", f)
            done = 1;
         }
         else if ((($1 == "jmp") && ($2 == "#CALA")) || (($1 == "calld") && ($2 == "PA,#CALA"))) {
            /* direct call */
            getline;
            u = right($2,length($2)-1);
            uses_FN(f, u, code);
            #printf("uses %s\n", u)
         }
         else if ((($1 == "jmp") && (($2 == "#LODA") || ($2 == "#LODL") || ($2 == "#LODI") || ($2 == "#PSHA"))) || (($1 == "calld") && (($2 == "PA,#LODA") || ($2 == "PA,#LODL") || ($2 == "PA,#LODI")|| ($2 == "PA,#PSHA")))) {
            /* address being taken */
            getline;
            if (left($2,1) == "@") {
               u = right($2,length($2)-1);
               if ((i = index(u,"+")) > 1) {
                   u = left(u, i-1)
               }
               if ((i = index(u,"-")) > 1) {
                  u = left(u, i-1)
               }
               uses_FN(f, u, code);
               #printf("uses %s\n", u)
            }
         }
         else if (left($2,3) == "##@") {
            /* address being taken */
            u = right($2,length($2)-3);
            if ((i = index(u,"+")) > 1) {
                u = left(u, i-1)
            }
            if ((i = index(u,"-")) > 1) {
               u = left(u, i-1)
            }
            uses_FN(f, u, code);
            #printf("uses %s\n", u)
         }
         else if (left($3,3) == "##@") {
            /* address being taken */
            u = right($3,length($3)-3);
            if ((i = index(u,"+")) > 1) {
                u = left(u, i-1)
            }
            if ((i = index(u,"-")) > 1) {
               u = left(u, i-1)
            }
            uses_FN(f, u, code);
            #printf("uses %s\n", u)
         }
         if (getline <= 0) {
            break;
         }
      }
      #printf("done function %s\n", f)
      f = "no function";
   }
   else if (!code && known_function(f)) {
      #printf("function %s\n", f)
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
         else if (($1 == "'" ) || ($1 == "byte") || ($1 == "word")) {
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
            #printf("uses %s\n", u)
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
