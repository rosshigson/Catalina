#include <hmi.h>

/*
 * HMI calls : text (screen)
 * Note that for the large memory mode, we must copy the string
 * to memory space that the HMI plugin can access - this is done
 * in chunks to avoid using too much stack space.
 */

int t_string (unsigned curs, char *str) {

#ifdef __CATALINA_LARGE

#define CHUNK_SIZE 100

   int i = 0;
   int j = 0;
   int retval = 0;
   char tmp[CHUNK_SIZE + 1];

   while (str[i] != '\0') {
      tmp[j++] = str[i++];
      if (j == CHUNK_SIZE) {
         tmp[j] = '\0';
         retval = _short_service(SVC_T_STRING, ((curs&1)<<23) + (int)tmp);
         j = 0;
      }
   }
   if (j > 0) {
      tmp[j] = '\0';
      retval = _short_service(SVC_T_STRING, ((curs&1)<<23) + (int)tmp);
   }
   return retval;

#else

   return _short_service(SVC_T_STRING, ((curs&1)<<23) + (int)str);

#endif

}
