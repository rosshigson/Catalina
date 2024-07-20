#
# Phase 6
#
# AWK script to replace optimizable instructions with relative jumps
#
BEGIN {
   p = 0;
   initialize_phase_6();
   print "' Optimized by Catalina Optimizer 1.0"

}
/^' Optimized by Catalina Optimizer / { 
   /* for the second pass, we use larger numbers (to avoid label collisions) */
   p = 100000;
   print "' Optimized (pass 2) by Catalina Optimizer 1.0"
}
/^' Catalina Optimized Warning / { next }
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
/[ \t]+long[ \t]+I32_JMPA/  { 
   n = p + $8
   /* printf("'optimizing %s\n", $8) */
   opt = can_optimize($8)
   if (length(opt) != 0) {
      if (left($4,1)=="(") {
         d = ltrim($4,"(");
         d = left(d,length(d)-6);
      }
      else {
         d = left($4,length($4)-5);
      }
      printf " %s + ((%s-(@:Opt_%06d-4))&$1FF)<<S16B ' Catalina Optimized %s\n alignl ' align long\n:Opt_%06d\n", opt, d, n, n, n
   }
   else {
      printf " %s %s %s %s\n", $1,$2,$3,$4
   }
   next;
}
/[ \t]+long[ \t]+I32_BR/  { 
   n = p + $8
   /* printf("'optimizing %s\n", $8) */
   opt = can_optimize($8)
   if (length(opt) != 0) {
      if (left($4,1)=="(") {
         d = ltrim($4,"(");
         d = left(d,length(d)-6);
      }
      else {
         d = left($4,length($4)-5);
      }
      printf " %s + ((%s-(@:Opt_%06d-4))&$1FF)<<S16B ' Catalina Optimized %s\n alignl ' align long\n:Opt_%06d\n", opt, d, n, n, n
   }
   else {
      printf " %s %s %s %s\n", $1,$2,$3,$4
   }
   next;
}

{ 
   print
   next 
}
