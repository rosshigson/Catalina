#include <stdio.h>

#define DEBUG 0

int main(int argc, char *argv[]) {
   int start_pos;
   int end_pos;
   FILE *file;
   unsigned char byte;
   int pos;
   unsigned char checksum;

   if (argc < 2) {
      printf("usage: %s <filename> [ start [ finish ] ]\n", argv[0]);
      exit(1);
   }
   if ((file = fopen(argv[1], "rb")) == NULL) {
      printf("cannot open file %s\n", argv[1]);
      exit(-1);
   }

   end_pos = -1;
   start_pos = 0;

   if (argc > 2) {
      sscanf(argv[2], "%d", &start_pos);
      printf("\nstart_pos = %d\n", start_pos);
      if (argc > 3) {
         sscanf(argv[3], "%d", &end_pos);
         printf("end_pos   = %d\n", end_pos);
      }
   }
   printf("\n");

   pos = 0;
   checksum = 0xEC; // include stack marker (FF F9 FF FF FF F9 FF FF)

   byte = fgetc(file);
   while (!feof(file)) {
      if ((pos >= start_pos) && ((end_pos == -1) || (pos <= end_pos))) {
#if DEBUG == 1	      
         printf("pos = %d, char = 0x%02X (%d)\n", pos, byte, byte);
#endif	 
         checksum += byte;
      }
      byte = fgetc(file);
      pos++;
   }

   fclose(file);
   printf("sum = 0x%02X (%d)\n", checksum, checksum);

   return 0;
}

/*
'
' calc_checksum : calculate checksum
' on entry:
'    start_pos : address of first byte to include
'    end_pos   : address of last byte to include
' on exit:
'    checksum  : checksum (including stack marker 'FF F9 FF FF FF F9 FF FF')
'    start_pos, end_pos: lost
'
calc_checksum
        mov  checksum,#$EC
:calc_loop
        add  checksum,start_pos
        and  checksum,#$FF
        add  start_pos,#1
        cmp  start_pos,end_pos wz,wc
  if_be jmp  #:calc_loop
calc_checksum_ret
        ret
'
start_pos long $0
end_pos   long $0
checksum  long $0
'
*/
