#
# Phase 3
#
# AWK script to replace calls to inlinable functions
#
BEGIN {
   initialize_phase_3();
}
/^'/ {
   print
   next
}
/^{/ {
   print
   getline
   while (left($0,1) != "}") {
      print
      getline
   }
   print
   next
}
/^C_/  {
   f = $1; 
   if (known_function(f)) {
      /* remove the actual function (will be inlined at each call) */
      printf "' Catalina Optimizer - %s removed (Inlined)\n", f
      getline; while (left($1,6) == "alignl") { getline }
      while (1) {
         if (($1 == "long") && ($2 == "I32_RETF")) {
            break;
         }
         if (($1 == "word") && ($2 == "I16B_RETF")) {
            break;
         }
         if (($1 == "word") && ($2 == "I16B_RETN")) {
            break;
         }
         if (($1 == "word") && ($2 == "I16B_POPM") && ($4 != "$180<<S16B")) {
            break;
         }
         if (($1 == "'") && (left($2, 3) == "end") && ($3 == f)) {
            /* this line indicates we have reached the end, even if it is not a normal termination */
            break;
         }
         getline; while (left($1,6) == "alignl") { getline }
      }
   }
   else {
      /* not inlinable call - reconstruct original line */
      print $0
   }
   next;
}
/^[ \t]+word[ \t]+I16A_MOVI[ \t]*\+[ \t]*BC/  {
   bcl = $0;
   getline; while (left($1,6) == "alignl") { getline }
   if (left($0, 20) == " word I16A_ADDI + SP") {
      spl = $0;
      getline; while (left($1,6) == "alignl") { getline }
      if (left($0, 14) == " long I32_CALA") {
         cal = $0
         if (left($4,1)=="(") {
            f = ltrim($4,"(@");
            f = left(f, length(f)-6);
         }
         else {
            f = ltrim($4,"@");
            f = left(f, length(f)-5);
         }
         if (known_function(f)) {
            /* inline it */
            insert_inline(f);
            print " alignl"
            getline; while (left($1,6) == "alignl") { getline }
            if (left($0, 20) != " word I16A_ADDI + SP") {
               if (left($0, 14) == " long I32_LODA") {
                  spl = $0
                  getline; while (left($1,6) == "alignl") { getline }
                  if (left($0, 19) != " word I16A_ADD + SP") {
                     print spl
                     print $0
                  }
               }
               else {
                  print $0
               }
            }
         }
         else {
            /* not inlinable call - reconstruct lines */
            print bcl
            print spl
            print $0
         }

      }
      else {
         /* not inlinable call - reconstruct original lines */
         print bcl
         print spl
         print $0
      }
   }
   else if (left($0, 14) == " long I32_CALA") {
      cal = $0;
      if (left($4,1)=="(") {
         f = ltrim($4,"(@");
         f = left(f, length(f)-6);
      }
      else {
         f = ltrim($4,"@");
         f = left(f, length(f)-5);
      }
      if (known_function(f)) {
         /* inline it */
         insert_inline(f);
         print " alignl"
         getline; while (left($1,6) == "alignl") { getline }
         if (left($0, 20) != " word I16A_ADDI + SP") {
            if (left($0, 14) == " long I32_LODA") {
               spl = $0
               getline; while (left($1,6) == "alignl") { getline }
               if (left($0, 19) != " word I16A_ADD + SP") {
                  print cal
                  print $0
               }
            }
            else {
               print $0
            }
         }
      }
      else {
         /* reconstruct lines */
         print bcl
         print $0
      }
   }
   else {
      /* not inlinable call - reconstruct original lines */
      print bcl
      print $0
   }
   next;
}
/^[ \t]+long[ \t]+I32_MOVI[ \t]*\+[ \t]*BC/  {
   bcl = $0;
   getline; while (left($1,6) == "alignl") { getline }
   if (left($0, 20) == " word I16A_ADDI + SP") {
      spl = $0;
      getline; while (left($1,6) == "alignl") { getline }
      if (left($0, 14) == " long I32_CALA") {
         cal = $0
         if (left($4,1)=="(") {
            f = ltrim($4,"(@");
            f = left(f, length(f)-6);
         }
         else {
            f = ltrim($4,"@");
            f = left(f, length(f)-5);
         }
         if (known_function(f)) {
            /* inline it */
            insert_inline(f);
            print " alignl"
            getline; while (left($1,6) == "alignl") { getline }
            if (left($0, 20) != " word I16A_ADDI + SP") {
               if (left($0, 14) == " long I32_LODA") {
                  spl = $0
                  getline; while (left($1,6) == "alignl") { getline }
                  if (left($0, 19) != " word I16A_ADD + SP") {
                     print spl
                     print $0
                  }
               }
               else {
                  print $0
               }
            }
         }
         else {
            /* not inlinable call - reconstruct lines */
            print bcl
            print spl
            print $0
         }

      }
      else {
         /* not inlinable call - reconstruct original lines */
         print bcl
         print spl
         print $0
      }
   }
   else if (left($0, 14) == " long I32_CALA") {
      cal = $0;
      if (left($4,1)=="(") {
         f = ltrim($4,"(@");
         f = left(f, length(f)-6);
      }
      else {
         f = ltrim($4,"@");
         f = left(f, length(f)-5);
      }
      if (known_function(f)) {
         /* inline it */
         insert_inline(f);
         print " alignl"
         getline; while (left($1,6) == "alignl") { getline }
         if (left($0, 20) != " word I16A_ADDI + SP") {
            if (left($0, 14) == " long I32_LODA") {
               spl = $0
               getline; while (left($1,6) == "alignl") { getline }
               if (left($0, 19) != " word I16A_ADD + SP") {
                  print cal
                  print $0
               }
            }
            else {
               print $0
            }
         }
      }
      else {
         /* reconstruct lines */
         print bcl
         print $0
      }
   }
   else {
      /* not inlinable call - reconstruct original lines */
      print bcl
      print $0
   }
   next;
}

/^[ \t]+word[ \t]+I16B_CPREP/ {
   /* printf("cprep : %s", $0) */
   cpl = $0;
   getline; while (left($1,6) == "alignl") { getline }
   sp1 = "";
   sp2 = "";
   if (left($0, 20) == " word I16A_SUBI + SP") {
      sp1 = $0;
   }
   else if (left($0, 14) == " long I32_LODA") {
      sp1 = $0;
      getline; while (left($1,6) == "alignl") { getline }
      if (left($0, 19) != " word I16A_SUB + SP") {
         sp2 = $0;
      }
   }
   if (left($0, 14) == " long I32_CALA") {
      /* printf("cala : %s", $0) */
      cal = $0
      if (left($4,1)=="(") {
         f = ltrim($4,"(@");
         f = left(f, length(f)-6);
      }
      else {
         f = ltrim($4,"@");
         f = left(f, length(f)-5);
      }
      /* printf("f : %s", f) */
      if (known_function(f)) {
         /* inline it */
         insert_inline(f);
         print " alignl"
         getline; while (left($1,6) == "alignl") { getline }
         if (left($0, 20) != " word I16A_ADDI + SP") {
            if (left($0, 14) == " long I32_LODA") {
               spl = $0
               getline; while (left($1,6) == "alignl") { getline }
               if (left($0, 19) != " word I16A_ADD + SP") {
                  print spl
                  print $0
               }
            }
            else {
               print $0
            }
         }
      }
      else {
         /* not inlinable call - reconstruct lines */
         print cpl
         if (sp1 != "") {
            print sp1
         }
         if (sp2 != "") {
            print sp2
         }
         print $0
      }
   }
   else {
      /* not inlinable call - reconstruct original lines */
      print cpl
      if (sp1 != "") {
         print sp1
      }
      if (sp2 != "") {
         print sp2
      }
      print $0
   }
   next;
}
/^[ \t]+long[ \t]+I32_CPREP/ {
   cpl = $0;
   getline; while (left($1,6) == "alignl") { getline }
   sp1 = "";
   sp2 = "";
   if (left($0, 20) == " word I16A_SUBI + SP") {
      sp1 = $0;
   }
   else if (left($0, 14) == " long I32_LODA") {
      sp1 = $0;
      getline; while (left($1,6) == "alignl") { getline }
      if (left($0, 19) != " word I16A_SUB + SP") {
         sp2 = $0;
      }
   }
   if (left($0, 14) == " long I32_CALA") {
      cal = $0
      if (left($4,1)=="(") {
         f = ltrim($4,"(@");
         f = left(f, length(f)-6);
      }
      else {
         f = ltrim($4,"@");
         f = left(f, length(f)-5);
      }
      if (known_function(f)) {
         /* inline it */
         insert_inline(f);
         print " alignl"
         getline; while (left($1,6) == "alignl") { getline }
         if (left($0, 20) != " word I16A_ADDI + SP") {
            if (left($0, 14) == " long I32_LODA") {
               spl = $0
               getline; while (left($1,6) == "alignl") { getline }
               if (left($0, 19) != " word I16A_ADD + SP") {
                  print spl
                  print $0
               }
            }
            else {
               print $0
            }
         }
      }
      else {
         /* not inlinable call - reconstruct lines */
         print cpl
         if (sp1 != "") {
            print sp1
         }
         if (sp2 != "") {
            print sp2
         }
         print $0
      }

  }
   else {
      /* not inlinable call - reconstruct original lines */
      print cpl
      if (sp1 != "") {
         print sp1
      }
      if (sp2 != "") {
         print sp2
      }
      print $0
   }
   next; 
}

/^[ \t]+long[ \t]+I32_CALA/ {
   cal = $0;
   if (left($4,1)=="(") {
      f = ltrim($4,"(@");
      f = left(f, length(f)-6);
   }
   else {
      f = ltrim($4,"@");
      f = left(f, length(f)-5);
   }
   if (known_function(f)) {
      /* inline it */
      insert_inline(f);
      print " alignl"
      getline; while (left($1,6) == "alignl") { getline }
      if (left($0, 20) != " word I16A_ADDI + SP") {
         if (left($0, 14) == " long I32_LODA") {
            spl = $0
            getline; while (left($1,6) == "alignl") { getline }
            if (left($0, 19) != " word I16A_ADD + SP") {
               print spl
               print $0
            }
         }
         else {
            print $0
         }
      }
   }
   else {
      /* not inlinable call - reconstruct original lines */
      print "' candidate for inlining rejected!"
      print $0
   }
   next;
}        
{ print }
