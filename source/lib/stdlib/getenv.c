/*
 * implementation of getenv that reads from the environment set up using
 * CogStore on the Propeller 2.
 */

#include	<stdlib.h>
#include  <string.h>

char *
getenv(const char *name) {
   static char timezone[] = "GMT";

#ifdef __CATALINA_P2
   static char *eaddr = NULL;
   char *tmp, *equals;
   int name_len;
   int env_len;

   if (eaddr == NULL) {
      eaddr = (char *)PASM (
          "#ifdef COMPACT\n"
          " word I16B_LODL + (r0)<<D16B\n"
          " alignl ' align long (required on the P2!)\n"
          " long ENVIRON\n"
          "#else\n"
          "#ifdef NATIVE\n"
          " mov r0, ##ENVIRON\n"
          "#else\n"
          " jmp #LODL\n"
          " long ENVIRON\n"
          " mov r0, RI\n"
          "#endif\n"
          "#endif\n"
      );
      if (eaddr != NULL) {
         // on first call, process the environment string
         // by replacing all newlines with null characters. 
         // We make sure there are three nulls at the end 
         // so that a zero length string signals the end 
         // of the list.
         int i;
         tmp = eaddr;
         while (*tmp != '\0') {
            while (*tmp != '\n') {
               tmp++;
            }
            *tmp++ = '\0';
         }
         for (i = 0; i < 3; i++) {
            *tmp++ = '\0';
         }
         tmp = eaddr;
         while (strlen(tmp) > 0) {
            tmp += strlen(tmp) + 1;
         }
      }
   }
   if (eaddr != NULL) {
      // find name in list of strings, which will contain
      // strings of the form "NAME=VALUE" and be terminated 
      // by a null string
      tmp = eaddr;
      name_len = strlen(name);
      while ((env_len = strlen(tmp)) > 0) {
         equals = strchr(tmp, '=');
         if (equals != NULL) { 
            if ((tmp[name_len] == '=') 
            && (strncmp(name, tmp, name_len) == 0)) {
               // found name and '=' - return pointer to value after '='
               return equals + 1;
            }
            else {
               // found '=' - point past value (i.e. to next name)
               tmp = equals + strlen(equals) + 1; 
            }
         }
         else {
            // no '=' - point past name
            tmp += env_len + 1; 
         }
      }
   }
#endif

   // name not found or it does not have a value, or we have been compiled 
   // for the Propeller 1. Return default value for variables where a value 
   // is always expected (e.g. time zone), otherwize NULL
   if (strcmp(name, "TZ") == 0) {
      return timezone;
   }
   else {
	   return (char *)NULL;
   }
}
