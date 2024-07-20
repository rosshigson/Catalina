#
# Phase 14
#
# AWK script to re-insert 'alignl' statements where required
#
BEGIN {
   code = 0;
   long = 0;
   alignment = 4;
   post_align = 0;
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
      if (getline <= 0) {
         break;
      }
   }
   print 
   next
}
{
   if ($1 == "alignl") {
      alignment = 4;
   }
   else if ($1 == "alignw") {
      alignment = 2;
   }
   else if ($1 == "byte") {
      alignment = 1;
   }
   else if ($1 == "word") {
      if ((alignment != 4) && (alignment != 2)) {
         print (" alignw ' align word")
      }
      alignment = 2;
      if (($2 == "I16B_EXEC")||($2=="I16B_PASM")) {
         post_align = 1;
      }
   }
   #else if (($1 == "long") || (left($1,2) == "C_")||( left($1,3)=="#if")||( left($1,3)=="#el")) {
   else if (($1 == "long") || ((length($1) > 0) && (left($1,1) != " ") && (left($1,1) != "\t") && (left($1,1) != "#"))) {
      if (alignment != 4) {
         print (" alignl ' align long")
      }
      alignment = 4;
   }
   print
   if (post_align) {
      print (" alignl ' align long")
      post_align = 0;
   }
}
