/*
 * Define the clock frequency and PIN to use - these definitiosn are suitable
 * for the HYDRA, and may need to be modified for other platforms:
 */
#define CLOCKFREQ 80000000
#define LED_PIN   1

/*
 * Define the LMM PASM function to call (not necessary, but good practice!)
 */
void Flash_Led(int pin, int clock);

/*
 * The main C program - just calls the LMM PASM function
 */
int main(void) {

   Flash_Led(LED_PIN, CLOCKFREQ/2); // this function never returns

   return 0;
}
