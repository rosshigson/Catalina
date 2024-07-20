/*
 * simple "setenv" implementation in C. 
 *
 * Requires a Propeller 2, Catalyst and the extended library to work, since 
 * it stores the variable in the environment file CATALYST.ENV. Otherwise
 * it does nothing. Note that the current environment is not changed,
 * only the environment file, which will be used next time a program
 * is loaded by Catalyst. 
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define ENV_FILE     "CATALYST.ENV"   // name of environment file
#define MAX_ENV_LEN  2048             // maximum length of environment string

int setenv(const char *name, const char *value, int overwrite);
int unsetenv(const char *name);

#if !defined(__CATALINA_P2) && !defined(__CATALINA_SDCARD_IO)

int setenv(const char *name, const char *value, int overwrite) {
   errno = ENOENT;
   return -1;
}
int unsetenv(const char *name) {
   errno = ENOENT;
   return -1;
}

#else

// find the name in environ, returning a pointer to it or NULL if not found.
// If it is found, update *value with a pointer to the value (note this
// value may be terminated by EITHER '\n' or '\0'
static char *find_name(char *environ, char *name, char **value) {
   char *curr_name;
   int  len;

   // point to first name
   curr_name = environ;
   while (*curr_name != '\0') {
      // try this name
      *value = curr_name;
      while ((**value != '\n') && (**value != '=') && (**value != '\0')) {
         (*value)++;
      }
      len = *value - curr_name;
      if ((len == strlen(name)) && (strncmp(name, curr_name, len) == 0)) {
         // found it!
         if (**value == '=') {
            // value starts beyond '='
            (*value)++;
         }
         return curr_name;
      }
      else {
         // skip to next name
         while ((*curr_name != '\n') && (*curr_name != '\0')) {
            curr_name++;
         }
         if (*curr_name == '\n') {
            curr_name++;
         }
      }
   }
   // name not found
   *value = NULL;
   return NULL;
}

// find the name in environ, deleting it (and its value) if found.
static void delete_name(char *environ, char *name) {
   char *curr_name;
   char *value;
   int  len;

   // point to first name
   curr_name = environ;
   while (*curr_name != '\0') {
      // try this name
      value = curr_name;
      while ((*value != '\n') && (*value != '=') && (*value != '\0')) {
         value++;
      }
      len = value - curr_name;
      if ((len == strlen(name)) && (strncmp(name, curr_name, len) == 0)) {
         // found it!
         if (*value == '=') {
            // value starts beyond '='
            value++;
            // find end of value
            while ((*value != '\0') && (*value != '\n')) {
               value++;
            }
            // point to next entry
            if (*value == '\n') {
               value++;
            }
            // now delete by moving the rest of environment 
            // over the current entry
            while (*value != '\0') {
               *curr_name = *value;
               curr_name++;
               value++;
            }
            *curr_name = '\0';
         }
      }
      else {
         // skip to next name
         while ((*curr_name != '\n') && (*curr_name != '\0')) {
            curr_name++;
         }
         if (*curr_name == '\n') {
            curr_name++;
         }
      }
   }
}

// add the name and value to the end of the environment. 
// Note that the name is assumed not to already exist!
// return 0 on ok, or -1 if the resulting environment 
// would be larger than MAX_ENV_LEN
static int add_name(char *environ, char *name, char *value) {
   int env_len;
   int name_len;
   int val_len;
   int i;

   env_len = strlen((char *)environ);
   name_len = strlen(name);
   val_len = strlen(value);
   // check size, allowing for inclusion of and '\n' and '='
   if (env_len + name_len + val_len + 2 > MAX_ENV_LEN) {
      // result would be too long!
      return -1;
   }
   if ((env_len > 0) && (environ[env_len - 1] != '\n')) {
      environ[env_len++] = '\n';
   }
   for (i = 0; i < name_len; i++) {
      environ[env_len++] = name[i];
   }
   environ[env_len++] = '=';
   for (i = 0; i < val_len; i++) {
      environ[env_len++] = value[i];
   }
   environ[env_len] = '\0';
   env_len = strlen((char *)environ);
   return 0;
}

int setenv(const char *name, const char *value, int overwrite) {
   FILE *f;
   char environ[MAX_ENV_LEN + 1];
   unsigned long elen = 0;
   char *curr_name;
   char *curr_value;
   int update = 0;

   environ[0] = 0;
   // read environment from file to environ
   if ((f = fopen(ENV_FILE, "r+")) != NULL) {
      elen = fread(environ, 1, MAX_ENV_LEN, f);
      environ[elen] = 0;
   }
   else {
      // create new environment file
      if ((f = fopen(ENV_FILE, "w+")) == NULL) {
         errno = ENOENT;
         fclose(f);
         return -1;
      }
   }
   curr_name = find_name(environ, (char *)name, &curr_value);
   if ((curr_name != NULL) && overwrite) {
      delete_name(environ, (char *)name);
      update = 1;
   }
   if ((value != NULL) && overwrite) {
      if (add_name(environ, (char *)name, (char *)value) != 0) {
         errno = EFBIG;
         return -1;
      }
      else {
      }
      update = 1;
   }
   if (update) {
      if ((f = fopen(ENV_FILE, "w")) != NULL) {
         elen = strlen(environ);
         while ((elen > 0) && (environ[elen - 1] == '\n')) {
            // remove trailing newlines
            elen--;
         }
         if (elen != fwrite(environ, 1, elen, f)) {
            errno = ENOENT;
            fclose(f);
            return -1;
         }
      }
   }
   fclose(f);
   return 0;
}

int unsetenv(const char *name) {
   return setenv(name, NULL, 1);
}

#endif

