#include <graphics.h>
#include <plugin.h>
/*
 * Graphics Mouse calls : basic mouse (Z)
 */

extern int *m_block;

int gm_delta_z() {
   int new; 
   int result;
   new = m_block[5];
   result = new - m_block[2];
   m_block[2] = new;
	return result;
}

int gm_abs_z() {
	return m_block[5];
}     


