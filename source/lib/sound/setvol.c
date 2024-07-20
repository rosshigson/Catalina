#include <sound.h>
#include <plugin.h>
#include <cog.h>

extern unsigned int *_sound_buffer;
extern int          _sound_lock;

extern void _initialize_sound();

/*
 * SetVolume - Changes the volume of the playing sound. If called
 *             repetedly, it can be used to manually create an envelope.
 *
 *  channel:  The channel to set the volume of.
 *  volume:   The desired volume (1-255). A value of 0 leaves the volume 
 *            unchanged.
 */ 
extern void SetVolume(int channel, unsigned int volume) {
   unsigned int * pending_shape;
   unsigned int * pending_volume;

   if (_sound_buffer == 0) {
      _initialize_sound();
   }

   pending_shape  = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_SHAPE);
   pending_volume = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_VOLUME);

   ACQUIRE (_sound_lock);

   while (*pending_shape != NOTHING_PENDING) { };

   *pending_volume = volume;
   *pending_shape  = SHAPE_IGNORE | (1<<31);

   RELEASE (_sound_lock);
}   


