#include <sound.h>
#include <plugin.h>
#include <cog.h>

extern unsigned int *_sound_buffer;
extern int          _sound_lock;

extern void _initialize_sound();

/*
 * StopSound - Stops playing a sound.
 *
 *  channel:  The channel to stop.
 */ 
extern void StopSound(int channel) {
   unsigned int * pending_shape;

   if (_sound_buffer == 0) {
      _initialize_sound();
   }

   pending_shape = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_SHAPE);

   ACQUIRE (_sound_lock);
   
   while (*pending_shape != NOTHING_PENDING) { };

   *pending_shape = SHAPE_SILENT | (1<<31);

   RELEASE (_sound_lock);

}                                               

