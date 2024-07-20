#include <sound.h>
#include <plugin.h>
#include <cog.h>

unsigned int *_sound_buffer = 0;  // initialized on first use
int          _sound_lock    = -1; // initialized on first use

void _initialize_sound() {
   int cog;
  
   if (_sound_buffer == 0) {
      // find SND plugin (if loaded)
      cog = _locate_plugin(LMM_SND);
      if (cog >= 0) {
         // fetch our base pointer
         _sound_buffer = (unsigned int *)((*REQUEST_BLOCK(cog)).request);
         // allocate a lock (if possible)
         _sound_lock = _locknew();
      }
   }
}

