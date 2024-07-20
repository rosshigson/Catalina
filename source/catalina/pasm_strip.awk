#
# Pasm_Strip - an AWK script to strip comments and blank lines from PASM files
#
# Compiled with AWKA 0.7.5
#
# Copyright (c) 2020 Ross Higson
#
# +----------------------------------------------------------------------------------------------------------------------+
# |                                             TERMS OF USE: MIT License                                                |
# +----------------------------------------------------------------------------------------------------------------------+
# |Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated          |
# |documentation files (the "Software"), to deal in the Software without restriction, including without limitation the   |
# |rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit|
# |persons to whom the Software is furnished to do so, subject to the following conditions:                              |
# |                                                                                                                      |
# |The above copyright notice and this permission notice shall be included in all copies or substantial portions of the  |
# |Software.                                                                                                             |
# |                                                                                                                      |
# |THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE  |
# |WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR |
# |COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR      |
# |OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.      |
# +----------------------------------------------------------------------------------------------------------------------+
#

BEGIN {
}

/^' Catalina Code/ {
   print
   next
}

/^' Catalina Data/ {
   print
   next
}

/^' Catalina Init/ {
   print
   next
}

/^' Catalina Cnst/ {
   print
   next
}

/^' Catalina Export/ {
   print
   next
}

/^' Catalina Import/ {
   print
   next
}

/^' end/ {
   print
   next
}

/^'/ { 
   next 
}

/^{/ {
   getline
   while (left($0,1) != "}") {
      if (getline <= 0) {
         break;
      }
   }
   next
}

/^[ ]*$/  {
   next
}

/^.* '.*$/ {
   print substr($0, 1, index($0,"'")-1)
   next
}

{
   print
   next
}

END {
}
