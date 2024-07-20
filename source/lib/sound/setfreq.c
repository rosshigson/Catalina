#include <sound.h>
#include <plugin.h>
#include <cog.h>

extern unsigned int *_sound_buffer;
extern int          _sound_lock;

extern void _initialize_sound();

/*
 * SetFreq - Changes the frequency of the playing sound. If called
 *           repetedly, it can be used to create a frequency sweep.
 *
 * channel:  The channel to set the frequency of.
 * freq:     The desired sound frequncy. Can be a number or a NOTE_* constant.
 *           A value of 0 leaves the frequency unchanged.
 * 
 */ 
extern void SetFreq(int channel, unsigned int freq) {
   unsigned int * pending_shape;
   unsigned int * pending_freq;

   if (_sound_buffer == 0) {
      _initialize_sound();
   }

   pending_shape = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_SHAPE);
   pending_freq  = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_FREQ);

   ACQUIRE (_sound_lock);
   
   while (*pending_shape != NOTHING_PENDING) { };

   *pending_freq  = freq;
   *pending_shape = SHAPE_IGNORE | (1<<31);

   RELEASE (_sound_lock);
}                                               

