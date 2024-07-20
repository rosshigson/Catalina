#ifndef _SOUND__H
#define _SOUND__H

//
// Based on the Sound Driver - 22KHz, 16-bit, 6 Channels
// by Nick Sabalausky
// VERSION 5.2
//

// NOTE THAT THE SOUND LIBRARY ASSUMES AN 80 Mhz CLOCK!!!

// SAMPLE_RATE - Approximately 22KHz. Do NOT change this value! The 
// calculation of theta_delta has an optimization (to avoid a division) 
// that relies on this exact sample rate.
#define SAMPLE_RATE            21845

// Offsets into sound buffer (long offsets, used internally)
#define OFF_AUDIO_PIN          0
#define OFF_CHANNEL_0          (OFF_AUDIO_PIN + 1)
#define OFF_PENDING_SHAPE      0
#define OFF_PENDING_FREQ       (OFF_PENDING_SHAPE     + 1)
#define OFF_PENDING_DURATION   (OFF_PENDING_FREQ      + 1)
#define OFF_PENDING_VOLUME     (OFF_PENDING_DURATION  + 1)
#define OFF_PENDING_AMP_ENV    (OFF_PENDING_VOLUME    + 1)
#define OFF_PENDING_PCM_START  (OFF_PENDING_AMP_ENV   + 1)
#define OFF_PENDING_PCM_END    (OFF_PENDING_PCM_START + 1)
#define CHANNEL_SIZE           (OFF_PENDING_PCM_END   + 1)

#define MAX_CHANNEL            6

// macro to calculate offset within a specific channel in the sound buffer
#define CHANNEL_OFF(C, OFF)    (OFF_CHANNEL_0 + (CHANNEL_SIZE * C) + OFF)

#define SHAPE_IGNORE           0
#define SHAPE_SILENT           1
#define SHAPE_SINE             2
#define SHAPE_SAWTOOTH         3
#define SHAPE_SQUARE           4
#define SHAPE_TRIANGLE         5
#define SHAPE_NOISE            6
#define SHAPE_PCM_8BIT_11KHZ   7
#define SHAPE_RELEASE          8

#define DURATION_INFINITE      0x80000000
#define NOTHING_PENDING        0

#define NO_ENVELOPE            0xFFFFFFFF

#define VOLUME_MIN             1
#define VOLUME_MAX             255

// Musical note frequencies
#define NOTE_C0                16
#define NOTE_Cs0               17
#define NOTE_Db0               NOTE_Cs0
#define NOTE_D0                18
#define NOTE_Ds0               19
#define NOTE_Eb0               NOTE_Ds0
#define NOTE_E0                21
#define NOTE_F0                22
#define NOTE_Fs0               23
#define NOTE_Gb0               NOTE_Fs0
#define NOTE_G0                25
#define NOTE_Gs0               26
#define NOTE_Ab0               NOTE_Gs0
#define NOTE_A0                28
#define NOTE_As0               29
#define NOTE_Bb0               NOTE_As0
#define NOTE_B0                31

#define NOTE_C1                33
#define NOTE_Cs1               35
#define NOTE_Db1               NOTE_Cs1
#define NOTE_D1                37
#define NOTE_Ds1               39
#define NOTE_Eb1               NOTE_Ds1
#define NOTE_E1                41
#define NOTE_F1                44
#define NOTE_Fs1               46
#define NOTE_Gb1               NOTE_Fs1
#define NOTE_G1                49
#define NOTE_Gs1               52
#define NOTE_Ab1               NOTE_Gs1
#define NOTE_A1                55
#define NOTE_As1               58
#define NOTE_Bb1               NOTE_As1
#define NOTE_B1                62

#define NOTE_C2                65
#define NOTE_Cs2               69
#define NOTE_Db2               NOTE_Cs2
#define NOTE_D2                73
#define NOTE_Ds2               78
#define NOTE_Eb2               NOTE_Ds2
#define NOTE_E2                82
#define NOTE_F2                87
#define NOTE_Fs2               93
#define NOTE_Gb2               NOTE_Fs2
#define NOTE_G2                98
#define NOTE_Gs2               104
#define NOTE_Ab2               NOTE_Gs2
#define NOTE_A2                110
#define NOTE_As2               117
#define NOTE_Bb2               NOTE_As2
#define NOTE_B2                123

#define NOTE_C3                131
#define NOTE_Cs3               139
#define NOTE_Db3               NOTE_Cs3
#define NOTE_D3                147
#define NOTE_Ds3               156
#define NOTE_Eb3               NOTE_Ds3
#define NOTE_E3                165
#define NOTE_F3                175
#define NOTE_Fs3               185
#define NOTE_Gb3               NOTE_Fs3
#define NOTE_G3                196
#define NOTE_Gs3               208
#define NOTE_Ab3               NOTE_Gs3
#define NOTE_A3                220
#define NOTE_As3               233
#define NOTE_Bb3               NOTE_As3
#define NOTE_B3                247

#define NOTE_C4                262      //--- Middle C ---
#define NOTE_Cs4               277
#define NOTE_Db4               NOTE_Cs4
#define NOTE_D4                294
#define NOTE_Ds4               311
#define NOTE_Eb4               NOTE_Ds4
#define NOTE_E4                330
#define NOTE_F4                349
#define NOTE_Fs4               370
#define NOTE_Gb4               NOTE_Fs4
#define NOTE_G4                392
#define NOTE_Gs4               415
#define NOTE_Ab4               NOTE_Gs4
#define NOTE_A4                440
#define NOTE_As4               466
#define NOTE_Bb4               NOTE_As4
#define NOTE_B4                494

#define NOTE_C5                523
#define NOTE_Cs5               554
#define NOTE_Db5               NOTE_Cs5
#define NOTE_D5                587
#define NOTE_Ds5               622
#define NOTE_Eb5               NOTE_Ds5
#define NOTE_E5                659
#define NOTE_F5                698
#define NOTE_Fs5               740
#define NOTE_Gb5               NOTE_Fs5
#define NOTE_G5                784
#define NOTE_Gs5               831
#define NOTE_Ab5               NOTE_Gs5
#define NOTE_A5                880
#define NOTE_As5               932
#define NOTE_Bb5               NOTE_As5
#define NOTE_B5                988

#define NOTE_C6                1047
#define NOTE_Cs6               1109
#define NOTE_Db6               NOTE_Cs6
#define NOTE_D6                1175
#define NOTE_Ds6               1245
#define NOTE_Eb6               NOTE_Ds6
#define NOTE_E6                1319
#define NOTE_F6                1397
#define NOTE_Fs6               1480
#define NOTE_Gb6               NOTE_Fs6
#define NOTE_G6                1568
#define NOTE_Gs6               1661
#define NOTE_Ab6               NOTE_Gs6
#define NOTE_A6                1760
#define NOTE_As6               1865
#define NOTE_Bb6               NOTE_As6
#define NOTE_B6                1976


/*
 * Explanation of Envelopes and Duration
 * --------------------------------------
 * The duration is specified in 11KHz or 22KHz "ticks" (depending on which
 * version of the sound driver you're using). So, use a duration of
 * SAMPLE_RATE to play for one second, 2*SAMPLE_RATE for two seconds,
 * SAMPLE_RATE/2 for a half-second, etc.
 * 
 * To make a sound play for an infinite duration, you must "or" the
 * duration with DURATION_INFINITE (which sets bit 31 to 1). You still
 * need to specify an amount of time for the duration because the sound
 * driver needs to know how long the amplitude envelope (explained below)
 * should take. For example, use INFINITE_DURATION | SAMPLE_RATE to play
 * a never-ending sound using an envelope length of one second.
 * 
 * The amplitude (ie. volume), envelope is a 32-bit value made up of eight
 * 4-bit nybbles, with each nybble representing one of eight "segments"
 * of the envelope. Each segment plays for 1/8th of the sound's total
 * duration. Each segment specifies a percentage of the sound's desired
 * volume, with $0 representing 0%, and $F representing 100%. For instance,
 * if the sound is played at a volume of 200, then a segment of $0 means
 * "no volume", $8 means "volume 100", and $F means "volume 200". The eight
 * envelope segments are specified in reverse-order. The first segment to
 * be played (segment 0) is the least significant nybble and the final
 * segment (segment 7) is the most significant nybble. For example,
 * $1346_ACEF starts at full volume and ends at near-silence. An envelope
 * of $FFFF_FFFF is effectively no envelope.
 * 
 * Sounds with an infinite duration may also use envelopes. In this case,
 * the "attack" and "decay" (ie. the first few segments) will play, and
 * then the sound will remain indefinitely at the "sustain" segment
 * (segment 3 by default, but can be changed by adjusting the
 * AMP_ENV_SUSTAIN_SEG constant anywhere from 1 to 6 (0 and 7 are untested)).
 * When ReleaseSound is called, the "release" (ie. the last few segments)
 * will play for the rest of the specified envelope duration and then stop.
 * 
 * PCM sounds may also use an envelope, although for now you will have to
 * modify PlaySoundPCM to do this. The next version of the driver will have
 * this modification built-in.
 */


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
                        unsigned int amp_env);

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
                         unsigned int volume);

/*
 * StopSound - Stops playing a sound.
 *
 *  channel:  The channel to stop.
 */ 
extern void StopSound(int channel);

/*
 * ReleaseSound - "Releases" an infinite duration sound. Ie, starts the 
 *                 release portion of the sound's amplitude envelope.
 *
 *  channel:  The channel to "release".
 */ 
extern void ReleaseSound(int channel);

/*
 * SetFreq - Changes the frequency of the playing sound. If called
 *           repetedly, it can be used to create a frequency sweep.
 *
 * channel:  The channel to set the frequency of.
 * freq:     The desired sound frequncy. Can be a number or a NOTE_* constant.
 *           A value of 0 leaves the frequency unchanged.
 * 
 */ 
extern void SetFreq(int channel, unsigned int freq);

/*
 * SetVolume - Changes the volume of the playing sound. If called
 *             repetedly, it can be used to manually create an envelope.
 *
 *  channel:  The channel to set the volume of.
 *  volume:   The desired volume (1-255). A value of 0 leaves the volume 
 *            unchanged.
 */ 
extern void SetVolume(int channel, unsigned int volume);

#endif //_SOUND__H
