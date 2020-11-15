/*
 * In this program, we use random numbers to simulate a very simple game of 
 * chance.
 *
 * The function "play" simply generates random numbers, and declares a
 * "winner" if some specific numbers are generated. The basic idea is to
 * just occupy some time, and sometimes "win" after some random time. The 
 * details of the game are not really important.
 *
 * The main loop plays the game until either a winner is found, or a 
 * specified number of games are completed with no winner. The time taken
 * is calculated.
 *
 * The program runs multiple trials of the game simulation, and reports the 
 * time taken to find a winner (or no winner) in each trial.
 *
 * Notice that the worker "play", also contains a worker "dice". This is a
 * simple demonstration that workers can THEMSELVES contain workers.
 *
 * Unfortunately, it is also a demonstration that parallelizing programs does
 * not always improve their speed - in this case, the "dice" worker is so
 * trivial that parallelizing it actually slows the program down!
 *
 */

#define NUM_TRIALS  20
#define NUM_GAMES   25
#define NUM_ROLLS  100

#pragma propeller factory cogs(5) memory(dynamic)

#pragma propeller worker play(int game) local(int winner) output(int *winner) if(winner > 0) threads(NUM_GAMES) stack(90) 

#pragma propeller worker dice(int roll) local(int result) output(int *result) if (result >= 9996) threads(10) stack(90)


int play(int game) {
   int roll;
   int result;

   for (roll = 1; roll < NUM_ROLLS; roll++) {

      result = 0;

      #pragma propeller begin dice
      result = ((rand() % 10000) + 1);
      #pragma propeller end dice

      if (result >= 9996) {
	 // a winner!
         break;
      }
   }

   if (result >= 9996) {
      return game;
   }
   else {
      return 0; 
   }
}

void main(void) {

   int trial;
   int game;
   int winner;
   unsigned long count;


   #ifdef __PARALLELIZED
   char *serial_or_parallel = "parallel";
   #else
   char *serial_or_parallel = "serial";
   #endif

   #pragma propeller start

   printf("Hello, %s world!\n\n", serial_or_parallel);

   printf("Press a key to start ...\n");
   k_wait();

   // seed the random number generator
   srand ((unsigned) _cnt());

   // run NUM_TRIALS trials
   for (trial = 0; trial < NUM_TRIALS; trial++) {

      // remember starting time
      count = _cnt();

      // each trial plays up to NUM_GAMES games,  
      // and the trial stops if a winner is found
      for (game = 1; game <= NUM_GAMES; game++) {

          winner = 0;

          #pragma propeller begin play
          winner = play(game);
          #pragma propeller end play

          if (winner > 0) {
	     // we have a winner!
             break;
          }
      }

      #pragma propeller wait play (winner > 0)

      // calculate time taken
      count = _cnt() - count;
   
      if (winner > 0) {
         // we had a winner
         printf("The winner is %3d :", winner);
      }
      else {
         // no winner in this trial
         printf("No winner         :");
      }
      printf(" %8d clocks\n", count);
   
      #pragma propeller wait play

   }

   printf("\nGoodbye, %s world!\n", serial_or_parallel);

   while(1);  // never terminate
}
