#include <propeller.h>

/*
 * This program flashes the debug LED 10 times on the Hydra. On other platforms
 * you will have to adjust the LED constant. Note that this program will only
 * work on a Propeller 1 - the Propeller 2 has slightly different PASM.
 *
 * Although it is a fully working program, it is mainly intended to demonstrate
 * the use and effect of the 'PASM' keyword. For a simpler working program, 
 * see 'test_inline_pasm_2.c'
 *
 * Compile this program using a command like the following, being sure to
 * generate a listing by including the -y command line flag:
 *
 *   catalina test_inline_pasm.c -lci -y -C NO_HMI -C HYDRA
 *
 * Then examine the listing, looking specifically for the string "PASM!". 
 * You will see the arguments to the PASM function calls inserted inline 
 * in the assembly code generated for the C program.
 *
 * Note 1: You can insert more than one instruction per PASM call - just
 *         separate them with '\n'. For example:
 *
 *            PASM(" mov R0,#1\n mov R1,#2\n mov R3,#3");
 *
 * Note 2: Some of the PASM primitives (LODL, JMPA etc) are DIFFERENT 
 *         between LMM, XMM and CMM programs. For example, this program 
 *         will NOT compile in COMPACT mode because it uses LODL and BR_Z, 
 *         which do not exist in that mode (also, see Note 3, below).
 *
 * Note 3: In COMPACT mode, to use inline PASM you MUST add special 
 *         instructions. To execute multiple PASM instructions, use
 *         " word I16B_EXEC\n alignl" before and " jmp #EXEC_STOP" after 
 *         each sequence of inserted PASM instructions. For example:
 *
 *            PASM(" word I16B_EXEC\nalignl");
 *            PASM(" mov R0,#1");
 *            PASM(" jmp #EXEC_STOP");
 *
 *         To execute a SINGLE inline PASM instruction, you can also use
 *         "word I16B_PASM". For example:
 *
 *            PASM(" word I16B_PASM\n alignl\n mov R0,#1");
 *
 * Note 4: If you intend to use the optimizer, be aware that it may not
 *         "see" references to variables used only within the inline PASM, 
 *         and may therefore optimize them away. To prevent this, simply
 *         make sure to reference the variables explicitly from within 
 *         the C program at least once.
 */

#ifdef __CATALINA_COMPACT
#error "This program will not work in COMPACT mode"
#endif

#ifdef __CATALINA_P2
#error "This program will not work on a Propeller 2"
#endif

#define LED 1      // DEBUG LED on Hydra
#define COUNT 10   // number of times to flash

int c;
int b;

void test_pasm(int count, int bits) {
   c = count*2;                             // global variables are easiest ...
   b = bits;                                // ... to reference from PASM
   PASM(":loop ' PASM!");                   // we can declare our own labels
   msleep(500);                             // we can intersperse other C Code
   PASM(" JMP #LODL\n long @C_b ' PASM!");  // we can use LODL for C addresses
   PASM(" rdlong r1,RI ' PASM!");           // we can read ...
   PASM(" jmp #LODL\n long @C_c ' PASM!");  // ...
   PASM(" rdlong r0,RI ' PASM!");           // ... C variables
   PASM(" sub r0,#1 wz ' PASM!");           // we can set and use Z & C flags
   PASM(" wrlong r0,RI ' PASM!");           // we can write C variables
   PASM(" xor outa,r1 'PASM!");             // we can use special registers
   PASM(" jmp #BRNZ\n long @:loop ' PASM!");// we can branch to our own labels
}

void main() {

   PASM("or dira,#1 ' PASM!");  // we can insert PASM inline anywhere
   test_pasm(COUNT, LED);       // we can put our PASM in a subroutine
                                // and then pass parameters to it

   while (1) ;
}

