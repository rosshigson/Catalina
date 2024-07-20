#if defined(__CATALINA_P2_EVAL)
#define LED_PIN 56            // Pin 56 is LED on the P2 EVAL
#elif defined(__CATALINA_P2_EDGE)
#define LED_PIN 38            // Pin 38 is LED on the P2 EDGE
#else
#ifndef LED_PIN
#error Define LED_PIN using -C P2_EDGE, -C P2_EVAL or -D LED_PIN=nn
#endif
#endif

#define TIME    180000000/2   // 1/2 second at 180 M<hz

void main() {
   while(1) {
      _pinnot(LED_PIN);       // Toggle pin every half second
      _waitx(TIME);
   }
}

