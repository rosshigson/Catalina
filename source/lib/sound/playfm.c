#include <sound.h>
#include <plugin.h>
#include <cog.h>

extern unsigned int *_sound_buffer;
extern int          _sound_lock;

extern void _initialize_sound();

/* PlaySoundFM - Starts playing a frequency modulation sound. If a sound is 
 *               already playing, then the old sound stops and the new sound
 *               is played.
 *
 * channel:   The channel on which to play the sound (0-5)
 * shape:     The desired shape of the sound. Use any of the
 *            following constants: SHAPE_SINE, SHAPE_SAWTOOTH,
 *            SHAPE_SQUARE, SHAPE_TRIANGLE, SHAPE_NOISE.
 *            Do NOT send a SHAPE_PCM_* constant, use PlaySoundPCM() instead.
 * freq:      The desired sound frequncy. Can be a number or a NOTE_* constant.
 *            A value of 0 leaves the frequency unchanged.
 * duration:  Either a 31-bit duration to play sound for a specific length
 *            of time, or (DURATION_INFINITE | "31-bit duration of amplitude
 *            envelope") to play until StopSound, ReleaseSound or another call
 *            to PlaySound is called. See "Explanation of Envelopes and
 *            Duration" for important details.
 * volume:    The desired volume (1-255). A value of 0 leaves the volume 
 *            unchanged.
 * amp_env:   The amplitude envelope, specified as eight 4-bit nybbles
 *            from $0 (0% of arg_volume, no sound) to $F (100% of arg_volume,
 *            full volume), to be applied least significant nybble first and
 *            most significant nybble last. Or, use NO_ENVELOPE to not use an
 *            envelope. See "Explanation of Envelopes and Duration" for 
 *            important details.
 */
extern void PlaySoundFM(int channel, unsigned int shape, unsigned int freq, 
                        unsigned int duration, unsigned int volume, 
                        unsigned int amp_env) {
   unsigned int * pending_shape;
   unsigned int * addr;

   if (_sound_buffer == 0) {
      _initialize_sound();
   }

   pending_shape = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_SHAPE);

   ACQUIRE (_sound_lock);

   while (*pending_shape != NOTHING_PENDING) { };

   addr = _sound_buffer + CHANNEL_OFF(channel, OFF_PENDING_FREQ);

   *addr++ = freq;     // freq
   *addr++ = duration; // duration
   *addr++ = volume;   // volume
   *addr++ = amp_env;  // amp_env

   *pending_shape = shape | (1<<31);

   RELEASE (_sound_lock);

}


