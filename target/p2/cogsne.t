{{

24-AUG-26 MODIFIED FOR CATALINA BY ROSS HIGSON
          - removal of unused SPIN methods and variables
          - must be compiled with -v33 option to p2asm

+------------------------------------------------------------------------------------------------------------------------------+
¦                                 SNEcog - SN76489 emulator V0.6 (C) 2011 by Johannes Ahlebrand                                ¦
+------------------------------------------------------------------------------------------------------------------------------¦
¦                                          P2 port (C) 2021 by Ada Gottensträter                                               ¦
+------------------------------------------------------------------------------------------------------------------------------¦
¦                                    TERMS OF USE: Parallax Object Exchange License                                            ¦
+------------------------------------------------------------------------------------------------------------------------------¦
¦Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    ¦
¦files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,    ¦
¦modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software¦
¦is furnished to do so, subject to the following conditions:                                                                   ¦
¦                                                                                                                              ¦
¦The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.¦
¦                                                                                                                              ¦
¦THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          ¦
¦WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         ¦
¦COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   ¦
¦ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         ¦
+------------------------------------------------------------------------------------------------------------------------------+
}}
CON

' make SNE_FREQUENCY a #define instead of using Spin constant PSG_FREUQENCY ...
'  NTSC = 3_579_545.0, PAL = 3_546_893.0
'  PSG_FREQUENCY     = NTSC   ' Clock frequency input on the emulated SN chip
#ifndef SNE_FREQUENCY
' Clock frequency input on the emulated SN chip
#define SNE_FREQUENCY 3579545
#endif

  VOLUME_CORRECTION = 0.9   ' Volume correction value (0.0 - 1.0)

'SMS, Genesis and Game Gear
  NOISE_TAP = %1001
  NOISE_MSB = 15

'SG-1000, OMV, SC-3000H, BBC Micro and Colecovision
'  NOISE_TAP = %11
'  NOISE_MSB = 14

'Tandy 1000
'  NOISE_TAP = %10001
'  NOISE_MSB = 14

CON

 ' WARNING !!  Don't alter the constants below unless you know what you are doing

' make SNE SAMPLE_RATE a #define instead of using Spin constant SAMPLE_RATE ...
#ifndef SNE_SAMPLE_RATE
#define SNE_SAMPLE_RATE    1411200
#endif
'  SAMPLE_RATE           = 1_411_200 ' (32 x CD quality)           ' Sample rate of SNEcog (176 kHz is maximum for an 80 Mhz propeller)

  OSC_FREQ_CALIBRATION  = trunc((float(SNE_FREQUENCY)/16.0)/float(SNE_SAMPLE_RATE)*(float(1<<22)))          ' Calibration of the oscillator frequency
  MAX_AMPLITUDE         = float($7F7F / 4)                      ' maxDACvalue / numberOfChannels (this makes room for maximum "swing" on all channels)
  AMPLITUDE_DAMP_FACTOR = 0.7941                               ' This gives a 2db drop per amplitude level (like the real thing)

  AMPLITUDE_LEVEL_0 = MAX_AMPLITUDE     * VOLUME_CORRECTION
  AMPLITUDE_LEVEL_1 = AMPLITUDE_LEVEL_0 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_2 = AMPLITUDE_LEVEL_1 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_3 = AMPLITUDE_LEVEL_2 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_4 = AMPLITUDE_LEVEL_3 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_5 = AMPLITUDE_LEVEL_4 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_6 = AMPLITUDE_LEVEL_5 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_7 = AMPLITUDE_LEVEL_6 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_8 = AMPLITUDE_LEVEL_7 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_9 = AMPLITUDE_LEVEL_8 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_A = AMPLITUDE_LEVEL_9 * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_B = AMPLITUDE_LEVEL_A * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_C = AMPLITUDE_LEVEL_B * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_D = AMPLITUDE_LEVEL_C * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_E = AMPLITUDE_LEVEL_D * AMPLITUDE_DAMP_FACTOR
  AMPLITUDE_LEVEL_F = 0.0

  P_DAC_75R_2V     = %0000_0000_000_1011100000000_00_00000_0
  P_OE             = %0000_0000_000_0000000000000_01_00000_0
  P_DAC_DITHER_PWM = %0000_0000_000_0000000000000_00_00011_0
  P_DAC_DITHER_RND = %0000_0000_000_0000000000000_00_00010_0

{{
PUB start(right, left, useShadowRegisters) : result
' +--------------------------------------------------------------+
' ¦                Starts SNEcog in a single cog                 ¦
' +--------------------------------------------------------------¦
' ¦ Returns a pointer to the first SN register in hub memory     ¦
' ¦ on success; otherwise returns 0.                             ¦
' ¦                                                              ¦
' ¦ right - The pin to output the right channel to. 0 = Not used ¦
' ¦                                                              ¦
' ¦ left - The pin to output the left channel to. 0 = Not used   ¦
' +--------------------------------------------------------------¦
' ¦NOTE!! The "Shadow registers" are latched register values!!   ¦
' ¦You need to call "flipRegisters" to update the real registers ¦
' ¦(This was originally implemented to make "vgm's" sound right) ¦
' +--------------------------------------------------------------+

  if useShadowRegisters
    writeRegister_p := @shadowRegisters
  else
    writeRegister_p := @SNregisters

  sampleRate := clkfreq/SAMPLE_RATE
  if sampleRate & 255
    res1 := P_DAC_75R_2V|P_OE|P_DAC_DITHER_RND
    'using_pwm := false
  else
    res1 := P_DAC_75R_2V|P_OE|P_DAC_DITHER_PWM
    'using_pwm := true
  leftp := left
  rightp := right
  cog := coginit(COGEXEC_NEW,@SNEMU, @SNregisters) + 1

  resetRegisters()

  if cog
    return @SNregisters
  else
    return 0

PUB stop()
' +--------------------------------------------------------------+
' ¦                         Stops SNEcog                         ¦
' +--------------------------------------------------------------+
  if cog
    cogstop(cog~ -1)
    cog := 0

PUB setRegister(data)
  if data&128
    regist := (data >> 4)&%111
    long[writeRegister_p][regist] := (long[writeRegister_p][regist] & (%111111<<4)) | data&%1111
  elseif (regist&1) or regist > 5 ' data word into short register
    long[writeRegister_p][regist] := data&%1111
  else ' data word into tone register
    long[writeRegister_p][regist] := (long[writeRegister_p][regist] & %1111) |((data&%111111) << 4)

  if regist == 6           ' | This is ONLY needed to make the "shadow registers" work properly with "noise reset"
    noiseReset := true     ' | and is NOT needed if writing directly to the normal registers
                           ' | Feel free to remove these lines if that's the case

PUB flipRegisters()
' +--------------------------------------------------------------+
' ¦Writes all the values from the shadow regs to the normal regs ¦
' +--------------------------------------------------------------¦
' ¦NOTE!! This method is ONLY needed when shadow registers are   ¦
' ¦used                                                          ¦
' +--------------------------------------------------------------+
   if noiseReset
     long[writeRegister_p + 24] &= 255
     noiseReset := false
   else
     long[writeRegister_p + 24] |= 256

   updateRegisters(writeRegister_p)

PUB updateRegisters(source)
' +--------------------------------------------------------------+
' ¦                  Update all 8 SN registers                   ¦
' +--------------------------------------------------------------¦
' ¦ source - A pointer to an array containing 16 bytes to update ¦
' ¦          the 8 SN registers with.                            ¦
' +--------------------------------------------------------------+
  longmove(@SNregisters, source, 8)

PUB resetRegisters() | i
' +--------------------------------------------------------------+
' ¦                   Reset all 8 SN registers                   ¦
' +--------------------------------------------------------------+
  longfill(@SNregisters, 15, 16) ' + shadow regs

PUB setFreq(channel, frequency) | addr
' +--------------------------------------------------------------+
' ¦             Sets the frequency of a SN channel               ¦
' +--------------------------------------------------------------¦
' ¦ channel - The SN channel to set (0 - 3)                      ¦
' ¦                                                              ¦
' ¦ frequency - The 10bit frequency value (0 - 1023)             ¦
' +--------------------------------------------------------------+
  long[writeRegister_p + (channel << 3)][0] := frequency

PUB setVolume(channel, frequency)
' +--------------------------------------------------------------+
' ¦             Sets the frequency of a SN channel               ¦
' +--------------------------------------------------------------¦
' ¦ channel - The SN channel to set (0 - 3)                      ¦
' ¦                                                              ¦
' ¦ frequency - The 10bit frequency value (0 - 1023)             ¦
' +--------------------------------------------------------------+
  long[writeRegister_p + (channel << 3)][1] := frequency

PUB play(channel, frequency, volumeLevel) | addr
' +--------------------------------------------------------------+
' ¦           Sets the attributes of an SN channel               ¦
' +--------------------------------------------------------------¦
' ¦ channel - The SN channel to set (0 - 3)                      ¦
' ¦                                                              ¦
' ¦ frequency - The 10bit frequency value (0 - 1023)             ¦
' ¦                                                              ¦
' ¦ volumeLevel - A value betwen 0 and 15 (lo value = hi volume) ¦
' +--------------------------------------------------------------¦
' ¦ NOTE!! Channel 0 - 2 are square waves and channel 3 is noise ¦
' +--------------------------------------------------------------¦
' ¦ NOTE!! The noise channel has got a 2bit freq value (0 - 3)   ¦
' ¦ Setting the noise freq to %X11 enables channel 2's frequency ¦
' ¦ register to operate the noise channel frequency.             ¦
' ¦ By setting the third freq bit high/low, a white or periodic  ¦
' ¦ noise can be selected. (High = White, Low = Periodic)        ¦
' +--------------------------------------------------------------+
  addr := writeRegister_p + (channel << 3)
  long[addr][0] := frequency
  long[addr][1] := volumeLevel
}}

DAT
              org 0
'???????????????????????????????????????????????????????????
'                Assembly SN emulator
'???????????????????????????????????????????????????????????
SNEMU
              fltl     leftp
              fltl     rightp
              wrpin    res1,leftp
              wrpin    res1,rightp
              wxpin    sampleRate,leftp
              wxpin    sampleRate,rightp
              wypin    dac_center,leftp
              wypin    dac_center,rightp
              drvh     leftp
              drvh     rightp



mainLoop      call     #getRegisters                        ' Main loop
              call     #SN
              call     #mixer
              jmp      #mainLoop

'???????????????????????????????????????????????????????????
' Read all SN registers from hub memory and convert
' them to more convenient representations.
'???????????????????????????????????????????????????????????
getRegisters
              setq      #7
              rdlong    frequency1,ptra
              shl       frequency1,#22
              shl       frequency2,#22
              shl       frequency3,#22
              wrbyte    #1, ptra[6*4+1]
              mov       snetmp1,noiseFeedback
              and       snetmp1,#3
              cmp       snetmp1, #3                    wz   '|
        if_ne decod     noiseFreq, #26                      '|
        if_ne shl       noiseFreq, snetmp1                  '| These 4 lines handles selection of "external" noise frequency on/off
        if_e  mov       noiseFreq, frequency3               '|
              fge       noiseFreq,noiseSubValue   ' fix case where noise freq is zero

              ret

'???????????????????????????????????????????????????????????
SN'                  Calculate SN samples
'???????????????????????????????????????????????????????????



AmpN
              test     noiseFeedback, #256               wz ' If bit 8 is zero; Reset noise register
  if_z        mov      noiseValue, #1
Noise1        sub      oscCounterN, noiseSubValue        wc ' Noise generator
  if_nc       waitx    #(7-1)*2 ' wait equivalent time for timing stability
  if_nc       jmp      #Amp1
              add      oscCounterN, noiseFreq
'-----------------------------------------------------------
              test     noiseFeedback, #4                 wz ' Is it periodic or white noise ?
  if_nz       test     noiseValue, #NOISE_TAP            wc ' C = White noise !
  if_z        test     noiseValue, #1                    wc ' C = Periodic noise !
              bitc     noiseValue, #NOISE_MSB + 1
              shr      noiseValue, #1                    wc
              alts     amplitudeN,#psg_amplitudeTable
              negnc    outN, 0-0
'-----------------------------------------------------------
Amp1
Square1       sub      oscCounter1, oscSubValue          wc ' Square wave generator 1
  if_c        add      oscCounter1, frequency1
  if_c        xor      oscState1, #1                     wz
  if_c        alts     amplitude1,#psg_amplitudeTable
  if_c        negz     out1, 0-0
'-----------------------------------------------------------
Amp2
Square2       sub      oscCounter2, oscSubValue          wc ' Square wave generator 2
  if_c        add      oscCounter2, frequency2
  if_c        xor      oscState2, #1                     wz
  if_c        alts     amplitude2,#psg_amplitudeTable
  if_c        negz     out2, 0-0
'-----------------------------------------------------------
Amp3
Square3       sub      oscCounter3, oscSubValue          wc ' Square wave generator 3
  if_c        add      oscCounter3, frequency3
  if_c        xor      oscState3, #1                     wz
  if_c        alts     amplitude3,#psg_amplitudeTable
  if_c        negz     out3, 0-0
SN_ret        ret

'???????????????????????????????????????????????????????????
'      Mix channels and update FRQA/FRQB PWM-values
'???????????????????????????????????????????????????????????
mixer
              mov      psgOut,dac_center
              add      psgOut,out1
              add      psgOut,out2
              add      psgOut,out3
              add      psgOut,outN

              testp    rightp   wc
   'if_c       drvh #24  ' light LED if too slow
              testp    rightp   wc
  if_nc       jmp #$-1
              'waitcnt  waitCounter, sampleRate              ' Wait until the right time to update
              wypin      psgOut,leftp                      ' the PWM values in FRQA/FRQB
              wypin      psgOut,rightp
mixer_ret     ret

'???????????????????????????????????????????????????????????
'    Variables, tables, masks and reference values
'???????????????????????????????????????????????????????????
psg_amplitudeTable  long trunc(AMPLITUDE_LEVEL_0)
                    long trunc(AMPLITUDE_LEVEL_1)
                    long trunc(AMPLITUDE_LEVEL_2)
                    long trunc(AMPLITUDE_LEVEL_3)
                    long trunc(AMPLITUDE_LEVEL_4)
                    long trunc(AMPLITUDE_LEVEL_5)
                    long trunc(AMPLITUDE_LEVEL_6)
                    long trunc(AMPLITUDE_LEVEL_7)
                    long trunc(AMPLITUDE_LEVEL_8)
                    long trunc(AMPLITUDE_LEVEL_9)
                    long trunc(AMPLITUDE_LEVEL_A)
                    long trunc(AMPLITUDE_LEVEL_B)
                    long trunc(AMPLITUDE_LEVEL_C)
                    long trunc(AMPLITUDE_LEVEL_D)
                    long trunc(AMPLITUDE_LEVEL_E)
                    long trunc(AMPLITUDE_LEVEL_F)

leftp               long _VGA_BASE_PIN+6
rightp              long _VGA_BASE_PIN+7

#if (_CLOCKFREQ/SNE_SAMPLE_RATE) & 255
res1                long P_DAC_75R_2V|P_OE|P_DAC_DITHER_RND
#else
res1                long P_DAC_75R_2V|P_OE|P_DAC_DITHER_PWM
#endif

mask10bit           long $3ff
val31bit            long $80000000
val22bit            long 1<<22
val26bit            long 1<<26

sampleRate          long _CLOCKFREQ/SNE_SAMPLE_RATE

dac_center          long $7F80
dac_center_hi       long $7F80<<16

noiseValue          long 1 << NOISE_MSB
oscSubValue         long OSC_FREQ_CALIBRATION
noiseSubValue       long OSC_FREQ_CALIBRATION >> 1
oscState1           long 1
oscState2           long 1
oscState3           long 1
oscStateN           long 1

out1                long 0
out2                long 0
out3                long 0
outN                long 0

snetmp1             long 0
oscCounter1         long 0
oscCounter2         long 0
oscCounter3         long 0
oscCounterN         long 0

frequency1          long 0
amplitude1          long 0
frequency2          long 0
amplitude2          long 0
frequency3          long 0
amplitude3          long 0
noiseFeedback       long 0
amplitudeN          long 0


noiseFreq           long 0

psgOut              long 0


waitCounter         long 0
tempValue           long 0
                    fit 490

{{
VAR

  byte noiseReset
  byte cog
  long regist
  long writeRegister_p
  long SNregisters[8]      '(= 8 word registers)
  long shadowRegisters[8]  '(= 8 word registers)



' SN76489 registers
' -----------------

' Reg bits function
' -----------------------------------
' 00  9..0 channel 1 freq
' 01  3..0 channel 1 attunation
' 02  9..0 channel 2 freq
' 03  3..0 channel 2 attunation
' 04  9..0 channel 3 freq
' 05  3..0 channel 3 attunation
' 06  4..0 noise control
' 07  7..0 noise attunation

}}

