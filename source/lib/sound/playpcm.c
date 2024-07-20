#include <sound.h>
#include <plugin.h>
#include <cog.h>

extern unsigned int *_sound_buffer;
extern int          _sound_lock;

extern void _initialize_sound();

/*
 * PlaySoundPCM - Plays a signed 8-bit 11KHz PCM sound once. If a sound is 
 *                already playing, then the old sound stops and the new sound 
 *                is played.
 *
 *  channel:   The channel on which to play the sound (0-8)
 *  pcm_start: The address of the PCM buffer
 *  pcm_end:   The address of the end of the PCM buffer
 *  volume:    The desired volume (1-255)
 *  amp_env:   The amplitude envelope, specified as eight 4-bit nybbles
 *             from $0 (0% of arg_volume, no sound) to $F (100% of arg_volume,
 *             full volume), to be applied least significant nybble first and
 *             most significant nybble last. Or, use NO_ENVELOPE to not use an
 *             envelope. See "Explanation of Envelopes and Duration" for 
 *             important details.
 */
extern void PlaySoundPCM(int channel, void *pcm_start, void *pcm_end, 
                         unsigned int volume) {
   unsigned int * pending_shape;
   unsigned int * addr;

   if (_sound_buffer == 0) {
      _initialize_sound();
   }

   pending_shape = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_SHAPE);

   ACQUIRE (_sound_lock);

   while (*pending_shape != NOTHING_PENDING) { };

   addr = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_FREQ);

   *addr++ = 400;                             // freq
   *addr++ = DURATION_INFINITE | SAMPLE_RATE; // duration
   *addr++ = volume;                          // volume
   *addr++ = NO_ENVELOPE;                     // amp_env
   *addr++ = (int)pcm_start;                  // pcm_start
   *addr++ = (int)pcm_end;                    // pcm_end

   *pending_shape  = SHAPE_PCM_8BIT_11KHZ | (1<<31);

   RELEASE (_sound_lock);
}                                               

