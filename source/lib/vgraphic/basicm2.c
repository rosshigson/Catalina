#include <vgraphic.h>
#include <plugin.h>
/*
 * Graphics Mouse calls : basic mouse 2 (X & Y)
 */

extern void gm_initialize();
extern int *m_block;

int gm_present() {
   if (m_block == 0) {
      gm_initialize();
   }
	return m_block[7];
}

int gm_abs_x() {
	return m_block[3];
}

int gm_abs_y() {
	return m_block[4];
}

int gm_buttons() {
	return m_block[6];
}  

