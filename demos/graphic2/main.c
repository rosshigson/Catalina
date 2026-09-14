
//main.c 

// original version by flightcrank (https://github.com/flightcrank/asteroids)
// Catalina mods by Ross Higson
// see LICENSE for licensing info

#include <stdlib.h>
#include "renderer.h"
#include "player.h"
#include "asteroids.h"
#include <prop2.h>
#include <prop2.h>
#include <graphic2.h>
#include <hmi.h>

#define ASTEROIDS 27
#define LIVES 3

#define KEY_LEFT  0xC0
#define KEY_RIGHT 0xC1
#define KEY_UP    0xC2
#define KEY_DOWN  0xC3
#define KEY_ESC   0x1B
#define KEY_SPACE 0x20

#define MIN_SHOT_SPACING 100000000 // ~1/3 second between shots

extern int _sbrk(int n);
#define STACK_SPACE 10000

int32_t screen_width;
int32_t screen_height;

int32_t half_screen_width;
int32_t half_screen_height;

struct asteroid asteroids[ASTEROIDS];      //The asteroids
struct player p;            //The player
struct player lives[LIVES];         //Player lives left
    
void main (int argc, char* args[]) {
   int  free_ram;
   int  tile_count;
   void *tile_space;
   int  stack_check; // only used to determine stack usage
   int sbrk;
   int k = 0;
   int nes_bits = 0;


   // calculate RAM available for tile space (reserving STACK_SPACE bytes)
   sbrk = _sbrk(0);
   free_ram = (int)&stack_check - _sbrk(0) - STACK_SPACE;
   tile_space = (void *)_sbrk(free_ram);
   // align tile space to a tile boundary
   tile_space = (void *)(((unsigned)tile_space + TILE_SIZE -1) & ~TILE_MASK);
   tile_count = ((int)free_ram / TILE_SIZE);

   while(1) {
      // set screen for text
      g_setup_2(0, 0, 120, 70, 0, 0, 0);
   
      // select size of universe
      t_setpos(1, 0, 0); t_char(1, 0xFF);
      t_setpos(1, 50, 0); t_string(1, "ASTEROIDS!");
      t_setpos(1, 48, 1); t_string(1, "by flightcrank");
      t_setpos(1, 36, 2); t_string(1, "(https://github.com/flightcrank/asteroids)");
      t_setpos(1, 42, 3); t_string(1, "Catalina mods by Ross Higson");
      t_setpos(1, 0, 6);
      t_string(1, "Select Universe Size\r\n\n");
      t_string(1, "gamepad/key:\r\n\n");
      t_string(1, "   A     1  => 640x480\r\n");
      t_string(1, "   B     2  => 800x600\r\n");
      t_string(1, "   X     3  => 1024x768\r\n");
      t_string(1, "   Y     4  => 1920x1080\r\n");
      do {
         if (k_ready()) {
             k = k_get();
         }
         else {
             nes_bits = g_snes(0)|g_snes(1);
             if (nes_bits & SNES_A) k = '1';
             if (nes_bits & SNES_B) k = '2';
             if (nes_bits & SNES_X) k = '3';
             if (nes_bits & SNES_Y) k = '4';
         }
      } while (( k < '1') || ( k >'4'));
   
      switch (k) {
          break;
        case '1':
          screen_width = 640; screen_height = 480;
          break;
        case '2':
          screen_width = 800; screen_height = 592;
          break;
        case '3':
          screen_width = 1024; screen_height = 768;
          break;
        case '4':
          screen_width = 1920; screen_height = 1072;
          break;
        default:
          break;
      }
      half_screen_width  = screen_width/2;
      half_screen_height = screen_height/2;
      t_string(1, "\r\nUse a keyboard:\r\n\n");
      t_string(1, "  Up Arrow = thrust\r\n");
      t_string(1, "  Left/Right Arrow = turn\r\n");
      t_string(1, "  Space = fire!\r\n");
      t_string(1, "  ESC = restart\r\n");
      t_string(1, "\r\nOr use a gamepad:\r\n\n");
      t_string(1, "  Up = thrust\r\n");
      t_string(1, "  Left/Right = turn\r\n");
      t_string(1, "  Button B = fire!\r\n");
      t_string(1, "  Select = restart\r\n");
      if (screen_width == 1920) {
         t_string(1, "\r\nPress Start or any key to begin\r\n");
         while (!k_ready() && 
                !((g_snes(0) & SNES_START) || (g_snes(1) & SNES_START)));
         if (k_ready()) {
            k_get(); // consume key
         }
      }
   
      // setup screen for graphics
      // centre the screen
      int startx = (cgi_x_total()-screen_width/16)/2;
      int starty =  (cgi_y_total()-screen_height/16)/2;
      g_setup_2(startx, starty, screen_width/16, screen_height/16, 0, screen_height, 1);
      g_add_ram(tile_space, tile_count*TILE_SIZE);
   
      g_palette(0,0);   // black (background)
      g_palette(1,59);  // grey37 (small asterioids)
      g_palette(2,145); // grey69 (medium asteroids)
      g_palette(3,15);  // white (ships and large asteroids)
   
      int i = 0;
      int j = 0;
      int offset = 0;
      struct vector2d translation = {-half_screen_width, -half_screen_height};
   
      //set up icons used to represent player lives
      for (i = 0; i < LIVES; i++) {
            
         init_player(&lives[i]);
         lives[i].lives = 1;
   
         //shrink lives
         for (j = 0; j < P_VERTS; j++) {
            divide_vector(&lives[i].obj_vert[j], 2);
         }
   
         //convert screen space vector into world space
         struct vector2d top_left = {20 + offset, 20};
         add_vector(&top_left, &translation);
         lives[i].location = top_left;
         update_player(&lives[i]);
         offset += 20;
      }
   
      //set up player and asteroids in world space
      init_player(&p);
      init_asteroids(asteroids, ASTEROIDS);

      int sleep = 0;
      int quit = 0;
      int32_t next_game_tick = _cnt();
      int32_t last_shot_time = _cnt();
   
      //render loop
      while(quit == 0) {
      
         k = 0;
         nes_bits = 0;

         // using keyboard
         if (k_ready()) {
           k = k_get();
         }

         // using either gamepad
         nes_bits = g_snes(0)|g_snes(1);
         if ((k == KEY_ESC) || (nes_bits & SNES_SELECT)) {
            quit = 1;
         }
         
         if ((k == KEY_UP) || (nes_bits & SNES_UP)) {
            struct vector2d thrust = get_direction(&p);
            multiply_vector(&thrust, .06);
            apply_force(&p.velocity, thrust);
         }
      
         if ((k == KEY_LEFT) || (nes_bits & SNES_LEFT)) {
            rotate_player(&p, -4);
         }

         if ((k == KEY_RIGHT) || (nes_bits & SNES_RIGHT)) {
            rotate_player(&p, 4);
         }

         if ((k == KEY_SPACE) || (nes_bits & SNES_B)) {
            if (p.lives > 0) {
               if ((_cnt() - last_shot_time) > MIN_SHOT_SPACING) {
                  shoot_bullet(&p);
                  last_shot_time = _cnt();
               }
            }
         }

         g_clear();

         // draw a box around the play area
         g_colorwidth(3,1);
         g_plot(0, 0);
         g_line(0,screen_height-1);
         g_line(screen_width-1, screen_height-1);
         g_line(screen_width-1, 0);
         g_line(0,0);

         draw_player(&p);
         for (i = 0; i < LIVES; i++) {
            draw_player(&lives[i]);
         }
         draw_asteroids(asteroids, ASTEROIDS);
         update_player(&p);
         bounds_player(&p);
         bounds_asteroids(asteroids, ASTEROIDS);

         int res = collision_asteroids(asteroids, ASTEROIDS, &p.location, p.hit_radius);

         if (res != -1) {
         
            p.lives--;
            p.location.x = 0;
            p.location.y = 0;
            p.velocity.x = 0;
            p.velocity.y = 0;

            int i = LIVES - 1;

            for (i = LIVES-1; i >= 0; i--) {
               if(lives[i].lives > 0) {
                  lives[i].lives = 0;
                  break;
               }
            }
         }

         if (lives[0].lives == 0) {
            g_clear();
            // redraw the box around the play area
            g_colorwidth(3,1);
            g_plot(0, 0);
            g_line(0,screen_height-1);
            g_line(screen_width-1, screen_height-1);
            g_line(screen_width-1, 0);
            g_line(0,0);
            g_textmode(3,1,6,5);
            g_colorwidth(3,1);
            g_text(half_screen_width-10, half_screen_height, "GAME OVER");
            g_copy(DOUBLE_BUFFER);
            _waitms(5000);

            break;
         }
         
         int i = 0;
         struct vector2d translation = {-half_screen_width , -half_screen_height};
   
         for (i = 0; i < BULLETS; i++) {
            //only check for collision for bullets that are shown on screen
            if (p.bullets[i].alive == TRUE) {
               //convert bullet screen space location to world space to compare
               //with asteroids world space to detect a collision
               struct vector2d world = add_vector_new(&p.bullets[i].location, &translation);
               int index = collision_asteroids(asteroids, ASTEROIDS, &world, 1);
               
               //collision occured
               if (index != -1) {
                  asteroids[index].alive = 0;
                  p.bullets[i].alive = FALSE;
                  if (asteroids[index].size != SMALL) {
                     spawn_asteroids(asteroids, ASTEROIDS, asteroids[index].size, asteroids[index].location);
                  }
               }
            }
         }
      
         update_asteroids(asteroids, ASTEROIDS);

         // copy bitmap to display
         g_copy(DOUBLE_BUFFER);
   
         _waitms(1); // reduce flicker
      }
   }
}

