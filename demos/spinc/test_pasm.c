/*
 * This program works only on a Propeller 1
 */
#ifdef __CATALINA_P2
#error THIS PROGRAM REQUIRES A PROPELLER 1
#endif

/*
 * Define the PIN to use - suitable for the C3 or HYDRA.
 * May need to be modified for other platforms:
 */

#ifdef __CATALINA_C3
#define LED_PIN   15
#else
#define LED_PIN   1
#endif

/*
 * Declare the PASM function to be called
 */
void Flash_Led(int pin, int clocks);

/*
 * The main C program - just calls the PASM function
 */
void main(void) {

   Flash_Led(LED_PIN, _clockfreq()/2); // this function never returns

}
