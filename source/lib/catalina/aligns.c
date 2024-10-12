/*
 * _align_sbrk - align sbrk to (1<<align), add offset, and report 
 *               the final value (using t_printf) if requested.
 *               For example:
 *
 *               _align_sbrk(10,0,0); // align to next 1k boundary
 */
unsigned long _align_sbrk(int align, int offset, int report) {
   unsigned long sbrk;
   unsigned long mask;
   unsigned long diff;
   sbrk = _sbrk(0);
   if ((align > 0) && (align < 32)) {
      mask = (1<<align) - 1;
      diff = ((sbrk + mask) & ~mask) - sbrk;
      _sbrk(diff);
   }
   if (offset != 0) {
      sbrk = _sbrk(offset);
   }
   sbrk = _sbrk(0);
   if (report) {
      t_string(0, "SBRK=");
      t_hex(0, sbrk);
      t_char(0,'\n');
   }
}


