#include "ptoc.h"

#define __printer_implementation__

#include "printer.h"

class unit_printer_initialize {
  public: unit_printer_initialize();
};
static unit_printer_initialize printer_constructor;

unit_printer_initialize::unit_printer_initialize() {
   assign(lst, "prn");
   rewrite(lst);
}
