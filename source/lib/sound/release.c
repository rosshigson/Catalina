#include <sound.h>
#include <plugin.h>
#include <cog.h>

extern unsigned int *_sound_buffer;
extern int          _sound_lock;

extern void _initialize_sound();

/*
 * ReleaseSound - "Releases" an infinite duration sound. Ie, starts the 
 *                 release portion of the sound's amplitude envelope.
 *
 *  channel:  The channel to "release".
 */ 
extern void ReleaseSound(int channel) {
   unsigned int * pending_shape;

   if (_sound_buffer == 0) {
      _initialize_sound();
   }

   pending_shape = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_SHAPE);

   ACQUIRE (_sound_lock);
   
   while (*pending_shape != NOTHING_PENDING) { };

   *pending_shape = SHAPE_RELEASE | (1<<31);

   RELEASE (_sound_lock);

}                                               

