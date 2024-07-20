#include <vgraphic.h>
#include <plugin.h>
/*
 * Graphics Mouse calls : basic mouse (X & Y)
 */

int *m_block = 0;  // initialized on first use

void gm_initialize() {
   int cog;
  
   if (m_block == 0) {
      // find Mouse plugin (if loaded)
      cog = _locate_plugin(LMM_MOU);
      if (cog >= 0) {
         // fetch our base pointer
         m_block = (int *)((*REQUEST_BLOCK(cog)).request);
      }
   }
}

int gm_delta_x() {
   int new; 
   int result;
   new = m_block[3];
   result = new - m_block[0];
   m_block[0] = new;
	return result;
}

int gm_delta_y() {
   int new; 
   int result;
   new = m_block[4];
   result = new - m_block[1];
   m_block[1] = new;
	return result;
}

int gm_button (unsigned long b) {
	return ((m_block[6]>>b) & 0x1);
} 

int gm_reset() {
   int i;

   if (m_block == 0) {
      gm_initialize();
   }
   if (m_block != 0) {
   	for (i = 0; i < 3; i++) {
         m_block[i] = m_block[i+3];
      }
   }
   return 0;
}

