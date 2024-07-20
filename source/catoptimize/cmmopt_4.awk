#
# Phase 4
#
# AWK script to enumerate optimization candidates
#
BEGIN { print "' Catalina Optimized Warning : This is a temporary file used by the Catalina Optimizer\n' Catalina Optimized Warning : It is not intended to be used and will not run correctly\n" }
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
/^[ \t]+long[ \t]+I32_JMPA/ { 
   print " " $1 " " $2 " " $3 " " $4 " ' Catalina Optimizer " ++i
   next 
}
/^[ \t]+long[ \t]+I32_BR_Z/ { 
   print " " $1 " " $2 " " $3 " " $4 " ' Catalina Optimizer " ++i 
   next 
}
/^[ \t]+long[ \t]+I32_BRNZ/ { 
   print " " $1 " " $2 " " $3 " " $4 " ' Catalina Optimizer " ++i 
   next 
}
/^[ \t]+long[ \t]+I32_BR_A/ { 
   print " " $1 " " $2 " " $3 " " $4 " ' Catalina Optimizer " ++i 
   next 
}
/^[ \t]+long[ \t]+I32_BRAE/ { 
   print " " $1 " " $2 " " $3 " " $4 " ' Catalina Optimizer " ++i 
   next 
}
/^[ \t]+long[ \t]+I32_BR_B/ { 
   print " " $1 " " $2 " " $3 " " $4 " ' Catalina Optimizer " ++i 
   next 
}
/^[ \t]+long[ \t]+I32_BRBE/ { 
   print " " $1 " " $2 " " $3 " " $4 " ' Catalina Optimizer " ++i 
   next 
}
{ print }
