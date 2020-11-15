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
 * Notice there are two forms of the "wait" pragma around line 102, but 
 * one is commented out - one has a condition, and one does not:
 *
 *     // #pragma propeller wait
 *     #pragma propeller wait (s > 0)
 *
 * Run this program as a serial program if you like, but then as a parallel 
 * program TWICE - uncommenting each of the pragmas in turn, to see the 
 * effect of the "wait" condition on the program times. Also, notice the 
 * matching "if" condition in the worker pragma - a "wait" pragma can wait 
 * for other conditions, including conditions that have nothing to do with 
 * the workers, but in this case we want to wait for any worker to be a 
 * winner, to match the condition under which the serial version of the
 * program will exit the trial.
 *
 */

#define NUM_TRIALS  20
#define NUM_GAMES   25
#define NUM_ROLLS  100

#pragma propeller worker(int game) local(int winner) output(int *winner) if(winner > 0) threads(NUM_GAMES) stack(90)

int play(int game) {
   int roll;
   int result;

   for (roll = 1; roll < NUM_ROLLS; roll++) {
      result = ((rand() % 10000) + 1);
      if (result >= 9996) {
	 // a winner!
         return game; 
      }
   }
   // no winner
   return 0; 
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

          #pragma propeller begin
          winner = play(game);
          #pragma propeller end

          if (winner > 0) {
	     // we have a winner!
             break;
          }
      }

      // uncomment ONE of the following pragmas ...

      //#pragma propeller wait
      #pragma propeller wait (winner > 0)

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
   
      #pragma propeller wait

   }

   printf("\nGoodbye, %s world!\n", serial_or_parallel);

   while(1);  // never terminate
}
