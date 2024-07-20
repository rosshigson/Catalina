#
# Catapult - an AWK script to process catapult pragmas
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

# return true if the line begins with the specified token (and is 
# followed by the end of line, a space or a tab, or a '(' character)
function token(str, token) {
   if ((left(str, length(token)) == token) && (length(str) == length(token) || (substr(str, length(token)+1, 1) == " ") || (substr(str, length(token)+1, 1) == "\t") || (substr(str, length(token)+1, 1) == "("))) {
       return 1;
   }
   return 0;
}

# remove up to 'len' chars from the beginning of str
function remove_chars(str, len) {
   if (length(str) <= len) {
      return "";
   }
   else {
      return trim(right(str, length(str)-len));
   }
}

# remove ".c" extension from end of str if present
function remove_dot_c(str) {
   len = length(str);
   if ((len >= 2) && (substr(str, len-1, 2) == ".c")) {
      return substr(str, 1, len-2);
   }
   else {
      return str;
   }
}

# print an error message about a malformed option
function malformed_option(line) {
   print pragma > "/dev/stderr"
   printf("%s:%d: Warning : catapult pragma contains malformed option '%s'\n", FILENAME, line_no, line) > "/dev/stderr"
}

# trim parentheses from start and end of string
function trim_parentheses(str) {
   if ((left(str, 1) != "(") || (right(str, 1) != ")")) {
      malformed_option(str);
   }
   return substr(str, 2, length(str) - 2);
}

# 'right' fails if we try and remove the whole string, so ... 
function my_right(str, i) {
   if (length(str) == i) {
      str = "";
   }
   else {
      str = trim(right(str, length(str)-i));
   }
   return str;
}

# count parentheses, and return the index of the ")" 
# that matches the first "(", or zero if not found
function match_paren(str, len, count, open, closed, i) {
   # printf("line = %s\n", str) > "/dev/stderr"
   len = length(str);
   if (len < 2) {
      return 0;
   }
   open = index(str,"(")
   if (open == 0) {
      return 0;
   }
   count = 1;
   i = open + 1;
   # printf("found '(' at index %d\n", open) > "/dev/stderr"
   while (i <= len) {
      if (substr(str, i, 1) == "(") {
          count++;
      }
      else if (substr(str, i, 1) == ")") {
         count--;
         closed = i;
         if (count == 0) {
            # printf("match for '(' at %d is ')' at %d\n", open, closed) > "/dev/stderr"
            return closed;
         }
      }
      i++;
   }
   # printf("no match for '(' at %d\n", open) > "/dev/stderr"
   return 0;
}

#parse line for pragma options
function get_pragma_options(line, count, i)
{
   count = 0;
   name = "";
   type = "";
   address = "";
   stack = "";
   mode = "";
   options = "";
   binary = "";
   overlay = "";

   while (length(line) > 0) {
      # printf("line = %s\n", line);
      if (token(line, "address")) {
          line = remove_chars(line, 7);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                address = left(line, i);
                line = my_right(line, i);
                address = trim_parentheses(address);
                # printf("address = '%s'\n", address);
             }
          }
          else {
              address = "";
          }
          count++;
      }
      else if (token(line, "stack")) {
          line = remove_chars(line, 5);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                stack = left(line, i);
                line = my_right(line, i);
                stack = trim_parentheses(stack);
                # printf("stack = '%s'\n", stack);
             }
          }
          else {
              stack = "";
          }
          count++;
      }
      else if (token(line, "mode")) {
          line = remove_chars(line, 4);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                mode = left(line, i);
                line = my_right(line, i);
                mode = trim_parentheses(mode);
                # printf("mode = '%s'\n", mode);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          count++;
      }
      else if (token(line, "options")) {
          line = remove_chars(line, 7);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                options = left(line, i);
                line = my_right(line, i);
                options = trim_parentheses(options);
                # printf("options = '%s'\n", options);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          count++;
      }
      else if (token(line, "binary")) {
          line = remove_chars(line, 6);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                binary = left(line, i);
                line = my_right(line, i);
                binary = trim_parentheses(binary);
                # printf("binary = '%s'\n", binary);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          count++;
      }
      else if (token(line, "overlay")) {
          line = remove_chars(line, 7);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                overlay = left(line, i);
                line = my_right(line, i);
                overlay = trim_parentheses(overlay);
                # printf("overlay = '%s'\n", overlay);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          count++;
      }
      else {
          # must be a name, with or without a type in parentheses
          # printf("it's a name: %s\n", line);
          i = index(line, "(");
          j = index(line, " ");
          if ((i > 0) && (j > 0) && (j < i)) {
              # make sure we don't have multiple words before the type!
              for (k = j; k < i; k++) {
                  if (substr(line, k, 1) != " ") {
                      i = k - 1;
                      break;
                  }
              }
          }
          if (i == 0) {
             i = length(line);
          }
          else {
             i--;
          }
          if (i > 0) {
             name = trim(left(line,i));
             line = my_right(line, i);
          }
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                type = left(line, i);
                line = my_right(line, i);
                type = trim_parentheses(type);
                # printf("type = '%s'\n", type);
             }
          }
          count++;
      }
   }
   return count;
}

BEGIN {
   error = 0;
   line_no = 0;
   current_segment = 0;
   primary_count = 0;
   pragma_warning = 0;
   initialize_pragma();
}

/^[[:blank:]]*#pragma[[:blank:]]+catapult[[:blank:]]+common[[:blank:]]/ {
   line_no++;
   # print "// processing common pragma\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   if (name == "") {
      name = "common";
   }
   # printf("name = %s, address = %s, stack = %s, mode = %s, options = %s, type = %s, binary = %s, overlay = %s\n", name, address, stack, mode, options, type, binary, overlay);
   update_segment(0, name, address, stack, mode, options, type, binary, overlay);
   if (address != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult common pragma cannot specify an address\n", FILENAME, line_no) > "/dev/stderr"
   }
   if (stack != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult common pragma cannot specify a stack\n", FILENAME, line_no) > "/dev/stderr"
   }
   if (mode != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult common pragma cannot specify a mode\n", FILENAME, line_no) > "/dev/stderr"
   }
   if (type != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult common pragma cannot specify a type\n", FILENAME, line_no) > "/dev/stderr"
   }
   if (binary != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult common pragma cannot specify a binary\n", FILENAME, line_no) > "/dev/stderr"
   }
   if (overlay != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult common pragma cannot specify an overlay\n", FILENAME, line_no) > "/dev/stderr"
   }
   # collect to common segment
   current_segment = 0;
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+catapult[[:blank:]]+primary[[:blank:]]/ {
   line_no++;
   # print "// processing primary pragma\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   # printf("name = %s, address = %s, stack = %s, mode = %s, options = %s, type = %s, binary = %s, overlay = %s\n", name, address, stack, mode, options, type, binary, overlay);
   if (name == "") {
      name = "primary";
   }
   if (name == remove_dot_c(FILENAME)) {
      print pragma > "/dev/stderr"
      printf("%s:%d: Error : catapult primary pragma name '%s' would overwrite this source file\n", FILENAME, line_no, name) > "/dev/stderr"
      error = 1;
   }
   update_segment(1, name, address, stack, mode, options, type, binary, overlay);
   if (type != "") {
      # print "// processing erroneous primary pragma\n";
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult primary pragma cannot specify a type\n", FILENAME, line_no) > "/dev/stderr"
   }
   if (address != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult primary pragma cannot specify an address\n", FILENAME, line_no) > "/dev/stderr"
   }
   if (stack != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult primary pragma cannot specify a stack\n", FILENAME, line_no) > "/dev/stderr"
   }
   if (overlay != "") {
      print pragma > "/dev/stderr"
      printf("%s:%d: Warning : catapult primary pragma cannot specify an overlay\n", FILENAME, line_no) > "/dev/stderr"
   }
   # collect to primary segment
   current_segment = 1;
   primary_count++;
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+catapult[[:blank:]]+secondary[[:blank:]]/ {
   line_no++;
   # print "// processing secondary pragma\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   if (name == "") {
      name = "secondary";
   }
   if (name == remove_dot_c(FILENAME)) {
      print pragma > "/dev/stderr"
      printf("%s:%d: Error : catapult secondary pragma name '%s' would overwrite this source file\n", FILENAME, line_no, name) > "/dev/stderr"
      error = 1;
   }
   if ((mode == "LARGE") || (mode == "SMALL") ||  (mode == "XMM") ||  (mode == "XMM LARGE") ||  (mode == "XMM SMALL")) {
      print pragma > "/dev/stderr"
      printf("%s:%d: Error: catapult secondary pragma cannot specify an XMM mode\n", FILENAME, line_no) > "/dev/stderr"
      error = 1;
   }
   new_segment = define_segment(name, address, stack, mode, options, type, binary, overlay);
   # printf("segment now %d\n", new_segment);
   if (new_segment >= 0) {
      # collect to new secondary segment
      current_segment = new_segment;
   }
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+catapult/ {
   line_no++;
   pragma = $0
   print pragma > "/dev/stderr"
   printf("%s:%d: Warning: catapult pragma not recognized\n", FILENAME, line_no) > "/dev/stderr"
   next;
}

/^[[:blank:]]*#pragma/ {
   line_no++;
   pragma = $0
   # printf("adding line to segment %d\n", current_segment);
   add_line_to_segment(current_segment, pragma, line_no);
   if (pragma_warning == 0) {
      printf("%s:%d: Warning: non-catapult pragmas will be ignored\n", FILENAME, line_no) > "/dev/stderr"
      # print pragma > "/dev/stderr"
      pragma_warning = 1;
   }

   next;
}

{
   line_no++;
   # collect to common, primary or secondary segment
   # printf("adding line to segment %d\n", current_segment);
   add_line_to_segment(current_segment, $0, line_no);
}

END {
   if (!error) {
      if (primary_count == 0) {
         print pragma > "/dev/stderr"
         printf("%s:%d: Error: No primary pragmas specified\n", FILENAME, line_no) > "/dev/stderr"
         exit 1;
      }
      else {
         finalize_pragma(FILENAME);
      }
   }
   else {
      exit 1;
   }
}
