#include <prop.h>

#ifdef __CATALINA_P2
#include <prop2.h>
#define DIRA _DIRA
#define INA  _INA
#define OUTA _OUTA
#define DIRB _DIRB
#define INB  _INB
#define OUTB _OUTB
#endif

//
// getpin - read the state of a pin
//    pin : Pin to get (0 to 31 on Propeller 1, 0 to 63 on Propeller 2)
//    returns : State of the requested pin with range (0 or 1)
//
int getpin(int pin) {
   register unsigned mask;
   if (pin < 32) {
      mask = 1 << pin;
      DIRA &= ~mask;
      return INA & mask ? 1 : 0;
   }
#ifdef __CATALINA_P2
   else {
      mask = 1 << (pin - 32);
      DIRB &= ~mask;
      return INB & mask ? 1 : 0;
   }
#else
   return 0;
#endif
}

//
// setpin - write the state of a pin
//    pin : Pin to set (0 to 31 on Propeller 1, 0 to 63 on Propeller 2)
//    value : The value to set to the pin (0 or 1)
//    returns : nothing
//
void setpin(int pin, int value) {
   register unsigned mask;
   if (pin < 32) {
      mask = 1 << pin;
      if (value)
         OUTA |= mask;
      else
         OUTA &= ~mask;
      DIRA |= mask;
   }
#ifdef __CATALINA_P2
   else {
      mask = 1 << (pin - 32);
      if (value)
         OUTB |= mask;
      else
         OUTB &= ~mask;
      DIRB |= mask;
   }
#endif
}

//
// togglepin - toggle the state of a pin
//    pin : Pin to toggle (0 to 31 on Propeller 1, 0 to 63 on Propeller 2)
//    returns : nothing
//
void togglepin(int pin) {
   unsigned mask;
   if (pin <= 32) {
      mask = 1 << pin;
      OUTA ^= mask;
      DIRA |= mask;
   }
#ifdef __CATALINA_P2
   else {
      mask = 1 << (pin - 32);
      OUTB ^= mask;
      DIRB |= mask;
   }
#endif
}


