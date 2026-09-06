/*
MD_SN76489 - Library for using a SN74689 sound generator

See header file for copyright and licensing comments.
*/
#include <soundmd.h>
#include <prop2.h>

#define CLOCK_HZ 4000000

#define ENABLE_DEBUG 0

#if ENABLE_DEBUG
#define DEBUG(s, i)  printf("%s %d",s, i)
#define DEBUGS(s)    printf("%s",s);
#define DEBUGX(s, x) printf("%s %x",s, x)
#else
#define DEBUG(s, i)
#define DEBUGS(s)
#define DEBUGX(s, x)
#endif

//< real-time tracking data for each channel
struct channelData_t C[MAX_CHANNELS];   

adsrEnvelope_t _adsrDefault = {
  false,        // Normal non-inverted curve
  40,           // Time for attack curve to reach Vmax
  60,           // Time for decay curve to reach Vs
  3,            // Sustain volume delta from setpoint
  75            // Time for Release curve to reach 0 volume
};

void md_begin(void)
{
  uint8_t i;

  sne_initialize();

  for (i = 0; i < MAX_CHANNELS; i++) {
    C[i].state = IDLE;
    C[i].adsr = &_adsrDefault;
    C[i].volSP = VOL_MAX;   // all setpoints to max
    setCVolume(i, VOL_OFF); // all currents to off and write to device
  }

}

uint32_t md_millis() {
// return millisecs since first call
  static uint32_t ms = 0;
  register uint32_t new_ms, res;
  if (ms == 0) {
    ms = _cnt(); // first call
    return 0;
  }
  else {
    new_ms = _cnt();
    res = new_ms - ms; // ticks
    res /= _clockfreq()/1000; // millisecs
    return res;
  }
}

bool md_setADSR(uint8_t chan, adsrEnvelope_t* padsr)
{
  bool b = false;

  if (chan < MAX_CHANNELS)
  {
    if (md_isIdle(chan))
    {
      if (padsr == NULL) {
        C[chan].adsr = &_adsrDefault;
      }
      else {
        C[chan].adsr = padsr;
      }
      b = true;
    }
  }

  return(b);
}

bool md_setAllADSR(adsrEnvelope_t* padsr)
{
  bool b = true;
  uint8_t c;

  for (c = 0; c < MAX_CHANNELS; c++) {
    b &= md_setADSR(c, padsr);
  }

  return(b);
}

bool md_isIdle(uint8_t chan)
{
  bool b = false;

  if (chan < MAX_CHANNELS) {
    b = (C[chan].state == IDLE);
  }

  return(b);
}

uint16_t calcTs(uint8_t chan, uint16_t duration)
// work out what the Vs time should be for this note
// if it is zero, return 0.
// if it works out negative, return 1 (ie, not zero)
// otherwise return the calculated value
{
  if (duration != 0)
  {
    // work out what the Vs time should be for this note
    if (duration < C[chan].adsr->Ta + C[chan].adsr->Td + C[chan].adsr->Tr) {
      duration = 1;   
    }
    else {
      duration -= C[chan].adsr->Ta + C[chan].adsr->Td + C[chan].adsr->Tr;
    }
  }

  return(duration);
}

void md_tone(uint8_t chan, uint16_t freq, uint8_t volume, uint16_t duration)
// play a tone without ADSR
{
  DEBUG("\ntone C", chan);
  DEBUG(" F", freq);
  if (chan < MAX_CHANNELS - 1)   // noise channel not valid for this
  {
    DEBUGS(" note ");

    if (freq != 0)
    {
      DEBUGS("on");
      C[chan].frequency = freq;
      C[chan].volSP = C[chan].volCV = saneVolume(volume);
      C[chan].duration = duration;
      C[chan].playTone = true;
      C[chan].state = TONE_ON;
    }
    else
    {
      DEBUGS("off");
      C[chan].state = IDLE;
    }
  }
}

void md_note(uint8_t chan, uint16_t freq, uint8_t volume, uint16_t duration)
// queue a note to be played with ADSR
{
  DEBUG("\nnote C", chan);
  DEBUG(" F", freq);
  if (chan < MAX_CHANNELS - 1)   // noise channel not valid for this
  {
    DEBUGS(" note ");

    if (freq != 0)
    {
      DEBUGS("on");
      C[chan].frequency = freq;
      C[chan].volSP = C[chan].volCV = saneVolume(volume);
      C[chan].duration = calcTs(chan, duration);
      C[chan].playTone = false;
      C[chan].state = NOTE_ON;
    }
    else
    {
      DEBUGS("off");
      C[chan].state = NOTE_OFF;
    }
  }
}

void md_noise(noiseType_t noise, uint8_t volume, uint16_t duration)
// queue a noise to be played with ADSR
{
  {
    DEBUG("\nnoise ", noise);

    if (noise != NOISE_OFF)
    {
      DEBUGS("on");
      C[NOISE_CHANNEL].frequency = noise;
      C[NOISE_CHANNEL].volSP = C[NOISE_CHANNEL].volCV = saneVolume(volume);
      C[NOISE_CHANNEL].duration = calcTs(NOISE_CHANNEL, duration);
      C[NOISE_CHANNEL].state = NOISE_ON;
    }
    else
    {
      DEBUGS("off");
      C[NOISE_CHANNEL].state = NOTE_OFF;
    }
  }
}

void md_play(void)
{
  uint8_t chan;

  for (chan = 0; chan < MAX_CHANNELS; chan++)
  {
    switch (C[chan].state)
    {
    case IDLE:    // doing nothing, just make sure the volume is turned off
    {
      if (C[chan].volCV != VOL_OFF)
        setCVolume(chan, VOL_OFF);
    }
    break;

    case NOISE_ON:  // set up the hardware to play this noise with ADSR
    case NOTE_ON:   // set up the hardware to play this note with ADSR
    {
      DEBUGS("\n->NOTE/NOISE_ON");

      if (C[chan].state == NOTE_ON) {
        md_setFrequency(chan, C[chan].frequency);   // set channel frequency
      }                                                 
      else {
        md_setNoise((noiseType_t)(C[chan].frequency));
      }

      // set timing parameters for ATTACK phase
      C[chan].timeBase = md_millis();
      C[chan].timeStep = (C[chan].adsr->Ta / C[chan].volSP);

      // set inital playing volume and volume step direction
      setCVolume(chan, C[chan].adsr->invert ? C[chan].volSP : 0);
      C[chan].volumeStep = C[chan].adsr->invert ? -1 : 1;

      DEBUGS("\n->NOTE/NOISE_ON to ATTACK");
      C[chan].state = ATTACK;
    }
    break;

    case TONE_ON:   // set up the hardware to play this note without
    {
      DEBUGS("\n->TONE_ON");

      // set channel frequency
      md_setFrequency(chan, C[chan].frequency);

      // set timing parameters for SUSTAIN phase
      C[chan].timeBase = md_millis();

      // set inital playing volume
      setCVolume(chan, C[chan].volSP);

      DEBUGS("\n->TONE_ON to SUSTAIN");
      C[chan].state = SUSTAIN;
    }
    break;

    case ATTACK:
    {
      // check if enough time has passed to do something
      if (md_millis() - C[chan].timeBase >= C[chan].timeStep)
      {
        // if the current level was the end of the interval
        if ((C[chan].adsr->invert && C[chan].volCV == 0) ||
            (!C[chan].adsr->invert && C[chan].volCV == C[chan].volSP))
        {
          // set timing parameters for DECAY phase
          C[chan].timeBase = md_millis();
          C[chan].timeStep = C[chan].adsr->Td / C[chan].adsr->deltaVs;

          // reverse volume step direction from current one
          C[chan].volumeStep *= -1;

          DEBUGS("\n->ATTACK to DECAY");
          C[chan].state = DECAY;
        }
        else
        {
          DEBUG("\n--ATTACK Volume delta:", C[chan].volumeStep);
          DEBUG(" CV:", C[chan].volCV);
          DEBUG(" SP:", C[chan].volSP);
          // still in ATTACK, just set the volume to the new level
          setCVolume(chan, C[chan].volCV + C[chan].volumeStep);
          C[chan].timeBase += C[chan].timeStep;
        }
      }
    }
    break;

    case DECAY:
    {
      // check if enough time has passed to do something
      if (md_millis() - C[chan].timeBase >= C[chan].timeStep)
      {
        int8_t volEnd = (C[chan].volSP - C[chan].adsr->deltaVs < 0) ? 0 : (C[chan].volSP - C[chan].adsr->deltaVs);

        // if the current level was the end of the interval
        if (C[chan].volCV == volEnd)
        {
          C[chan].timeBase = md_millis();
          C[chan].state = SUSTAIN;
          DEBUG("\n->DECAY to SUSTAIN: duration ", C[chan].duration);
        }
        else
        {
          DEBUG("\n--DECAY Volume delta ", C[chan].volumeStep);
          // still in DECAY, just set the volume to the new level
          setCVolume(chan, C[chan].volCV + C[chan].volumeStep);
          C[chan].timeBase += C[chan].timeStep;
        }
      }
    }
    break;

    case SUSTAIN:
    {
      // if configured, wait for the duration to expire, otherwise
      // do nothing but keep playing the same note at current volume
      if (C[chan].duration != 0)
      {
        if (md_millis() - C[chan].timeBase >= C[chan].duration)
          C[chan].state = C[chan].playTone ? IDLE : NOTE_OFF;
      }
    }
    break;

    case NOTE_OFF:
    {
      DEBUGS("\n->NOTE_OFF");
      // set timing parameters for RELEASE phase
      C[chan].timeBase = md_millis();
      C[chan].timeStep = C[chan].adsr->Tr / (C[chan].volSP - C[chan].adsr->deltaVs);

      // volume step direction remains the same as for previous DECAY
      // but we set this explicitly as NOTE_OFF can happen anytime,
      // before we finish ATTACK and timeStep is actually set.
      C[chan].volumeStep = C[chan].adsr->invert ? 1 : -1;

      DEBUGS("\n->NOTE_OFF to RELEASE");
      C[chan].state = RELEASE;
    }
    break;

    case RELEASE:
    {
      // check if enough time has passed to do something
      if (md_millis() - C[chan].timeBase >= C[chan].timeStep)
      {
        // if the current level was the end of the interval
        if ((!C[chan].adsr->invert && C[chan].volCV == 0) ||
            (C[chan].adsr->invert && C[chan].volCV == C[chan].volSP))
        {
          DEBUGS("\n->RELEASE to IDLE");
          setCVolume(chan, VOL_OFF);
          C[chan].state = IDLE;
        }
        else
        {
          DEBUG("\n--RELEASE Volume delta ", C[chan].volumeStep);
          // still in RELEASE, just set the volume to the new level
          setCVolume(chan, C[chan].volCV + C[chan].volumeStep);
          C[chan].timeBase += C[chan].timeStep;
        }
      }
    }
    break;

    default:
      C[chan].state = IDLE;
      break;
    }
  }
}

uint8_t saneVolume(uint8_t v)
// check and return a volume setting within bounds
{
  if (v > VOL_MAX) {
    v = VOL_MAX;
  }

  return(v);
}

void setCVolume(uint8_t chan, uint8_t v)
// Set the volume current value for channel and remember the setting
// Application values are 0-15 for min to max. Attenuator values
// are the complement of this (15-0).
{
  uint8_t cmd;

  v = saneVolume(v);
  sne_setVolume(chan, 0xf - v);
  C[chan].volCV = v;
}

void md_setVolume(uint8_t chan, uint8_t v)
// Set the volume set point for channel and remember the setting
// Application values are 0-15 for min to max. Attenuator values
// are the complement of this (15-0).
{
  if (chan < MAX_CHANNELS)
  {
    v = saneVolume(v);
    setCVolume(chan, v);
    C[chan].volSP = v;
  }
}

void md_setAllVolume(uint8_t v)
// Set the same volume set point for all channels
{
  int8_t i;

  for (i = 0; i < MAX_CHANNELS; i++)
    md_setVolume(i, v);
}

void md_setFrequency(uint8_t chan, uint16_t freq)
// Calculate register values and set them
{
  if (chan < MAX_CHANNELS - 1)    // last channel only does noise
  {
    uint16_t n = CLOCK_HZ / ((uint32_t)freq << 5);  // <<5 same as *32

    sne_setFreq(chan, n);
  }
}

void md_setNoise(noiseType_t noise)
// Set the noise channel parameters
{
  if (noise != NOISE_OFF)
    sne_setFreq(NOISE_CHANNEL, noise);
  else
    sne_setVolume(NOISE_CHANNEL, 0);
}


