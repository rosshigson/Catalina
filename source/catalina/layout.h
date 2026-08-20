/*
 * This file contains various constants that define 
 * the layout of Catalina programs in memory or in
 * binary files.
 */
#ifndef SECTOR_SIZE
#define SECTOR_SIZE        0x0200 // size of sector 
#endif

#define P1_INIT_B0_OFF 0x51       // must match kernels and [clnx]mmbeg.s
#define P1_INIT_BZ_OFF 0x51
#define P1_LAYOUT_OFFS (P1_INIT_BZ_OFF - P1_INIT_B0_OFF + 0x10)

#define P2_PROLOGUE_OFFS   0x1000
#define P2_LAYOUT_OFFS       0x10

#define KERNEL_SIZE        0x0800 // size of kernel (max - 2048 bytes) 
#define P1_HUB_SIZE        0x8000 // size of P1 HUB RAM (32kb)
#define P2_HUB_SIZE       0x80000 // size of P2 HUB RAM (512kb)

#define P1_LOAD_SIZE  P1_HUB_SIZE // max size of P1 loader (32kb)
                                  // must match cog.h and Catalina_Common.spin

#define P2_LOAD_SIZE      0x20000 // max size of P2 loader (128kb)
                                  // must match cog.h and constant.inc
                                  // and all the build_utilities scripts

#define PROLOGUE_SIZE SECTOR_SIZE // size of XMM prologue (one sector!)

#define SHORT_LAYOUT_2 1 /* 1 if unused bytes removed from layout 2 (P2 only) */
#define SHORT_LAYOUT_3 1 /* 1 if unused bytes removed from layout 3 (P1 only) */
#define SHORT_LAYOUT_4 1 /* 1 if unused bytes removed from layout 4 (P1 only) */
#define SHORT_LAYOUT_5 1 /* 1 if unused bytes removed from layout 5 (P1 only) */


