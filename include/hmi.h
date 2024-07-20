#ifndef _HMI__H
#define _HMI__H

#include <plugin.h>
#include <stdarg.h>

/*
 * HMI calls : keyboard
 */
extern int k_present();
extern int k_get();
extern int k_wait();
extern int k_new();
extern int k_ready();
extern int k_clear();
extern int k_state(int key);

/*
 * HMI calls : mouse
 */
extern int m_present();
extern int m_button (unsigned long b);
extern int m_buttons();
extern int m_abs_x();
extern int m_abs_y();
extern int m_abs_z();
extern int m_delta_x();
extern int m_delta_y();
extern int m_delta_z();
extern int m_reset();
extern void m_bound_limits(int xmin, int ymin, int zmin, int xmax, int ymax, int zmax);
extern void m_bound_scales (int xscale, int yscale, int zscale);
extern int m_abs (int value);
extern void m_bound_preset (int xpreset, int ypreset, int zpreset);
extern int m_limit (int i, int value);
extern int m_bound (int i, int delta);
extern int m_bound_x();
extern int m_bound_y();
extern int m_bound_z();

/*
 * Cursor type constants:
 */
#define HMI_cursor_off 0x0
#define HMI_cursor_on 0x1

#define HMI_cursor_slow 0x2
#define HMI_cursor_fast 0x3

#define HMI_cursor_block 0x0
#define HMI_cursor_under 0x4

#define HMI_cursor_wrap 0x0
#define HMI_cursor_scroll 0x8

/*
 * HMI calls : text (screen)
 */
extern int t_geometry ();
extern int t_char (unsigned curs, unsigned ch);
extern int t_string (unsigned curs, char *str);
extern int t_integer (unsigned curs, int val);
extern int t_unsigned (unsigned curs, unsigned val);
extern int t_hex (unsigned curs, unsigned val);
extern int t_bin (unsigned curs, unsigned val);
extern int t_setpos (unsigned curs, unsigned cols, unsigned rows);
extern int t_getpos (unsigned curs);
extern int t_mode (unsigned curs, unsigned mode);
extern int t_scroll (unsigned count, unsigned first, unsigned last);
extern int t_color (unsigned curs, unsigned color);
extern int t_color_fg(unsigned curs, unsigned color);
extern int t_color_bg (unsigned curs, unsigned color);

/*
 * note that t_float is not really a hmi call - it is implemented
 * in libc and requires both libm and libc libary support
 */
extern int t_float (unsigned curs, float val, int digits);

/*
 * note that t_printf and t_vprintf are not really HMI calls - they are
 * implemented in C and call the other HMI functions to do the actual I/O
 */
extern int t_printf (char *str, ...);

extern int t_vprintf (char *str, va_list ap);

#endif
