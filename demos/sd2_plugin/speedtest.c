
#include <prop.h>
#include <propeller2.h>
#include <lut_exec.h>
#include <alloca.h>

#include <stdint.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include "ff.h"
#include "diskio.h"

/*
static void  emithex( uint8_t *addr, size_t size )
{
    do {
        printf(" %02x", *addr++);
    } while( --size );
    puts("");
}
*/

FATFS  fs;


static void  mountsd( void )
{
    char  *str = __builtin_alloca(16384);    // auto-frees upon function return
    FATFS  *f;
    FRESULT  rc;
    DWORD  free_clust;

    rc = f_mount(&fs, "", 1); // force mount the first partition
    if( rc != FR_OK ) {
        printf("f_mount() returned %d\n\n", rc);
//        printf("f_mount() returned %d:  Attempting to reformat to FAT32 ...\n", rc);
//        rc = f_mkfs("0",FM_FAT32,2,2048,0,0,str,16384);
//        if( rc != FR_OK ) {
//            printf("f_mkfs() returned %d\n\n", rc);
            exit(3);
//        }
    }
    rc = f_getlabel("", str, NULL);
    if (rc == FR_OK) {
        printf("Volume label is \"%s\"\n", str);
    } else {
        printf("Error fetching volume label\n");
    }

    printf("Filesystem Type is ");
    if (fs.fs_type == FS_FAT12)
        printf("FAT12.\n");
    else if (fs.fs_type == FS_FAT16)
        printf("FAT16.\n");
    else if (fs.fs_type == FS_FAT32)
        printf("FAT32.\n");
    else if (fs.fs_type == FS_EXFAT)
        printf("exFAT.\n");
    else
        printf("[unknown]\n");

    printf("%d FATs\n", fs.n_fats);
    printf("%d Cluster size (sectors)\n", fs.csize);
    printf("%lu Current directory start cluster\n", fs.cdir);
    printf("%lu FAT entries (number of clusters + 2)\n", fs.n_fatent);
    printf("%lu Sectors per FAT\n", fs.fsize);

    rc = f_getfree("",&free_clust, &f);
    if (rc == FR_OK) {
        printf("%lu free sectors\n", free_clust*fs.csize);
    } else {
        printf("Cannot determine free space, result=%d\n", rc);
    }

}


//===================================================================================


static uint32_t  randfill( uint32_t *addr, size_t size, uint32_t state )
{
    PASM(
"		shr	_PASM(size), #2\n"
"		rep	@.rend, _PASM(size)\n"
"		xoro32	_PASM(state)\n"
"		mov	r0, 0-0\n"
"		wrlong	r0, _PASM(addr)\n"
"		add	_PASM(addr), #4\n"
" .rend\n"
    );

    return state;    // for potential continuation of psuedo random sequence
}



static size_t  randcmp( const uint32_t *addr, size_t size, uint32_t state )
{
    return PASM(
"		shr	_PASM(size), #2\n"
"		mov	r0, #0\n"
"		rep	@.rend, _PASM(size)\n"
"		rdlong	r1, _PASM(addr)\n"
"		add	_PASM(addr), #4\n"
"		xoro32	_PASM(state)\n"
"		cmp	r1, 0-0   wz\n"
"	if_z	add	r0, #4\n"
" .rend\n"
    );
}



static void  tester( const char *filename, size_t kbytes, const size_t repeats )
{
    FRESULT  rc;
    FIL  *fp;
    size_t  count;
    const size_t  bufsize = kbytes * 1024;
    uint32_t  ticks, ticke, msecs, onesecond, seed, *buff;

    fp = __builtin_alloca(sizeof(FIL));    // auto-frees upon function return
    buff = __builtin_alloca(bufsize);    // auto-frees upon function return
    if( !fp || !buff ) {
        printf(" malloc() failed!\n");
        exit(1);
    }

//-----------------------
// Write file
//-----------------------
    seed = _rnd();
    randfill(buff, bufsize, seed);
//    emithex((uint8_t *)buff, bufsize);

    errno = 0;
    rc = f_open(fp, filename, FA_WRITE | FA_CREATE_ALWAYS);
    if( rc != FR_OK ) {
        printf("Error opening file \"%s\", error=%d\n", filename, rc);
        exit(3);
    }
    printf(" Buffer %zu kB ", kbytes);

    onesecond = _clockfreq();
    msecs = 0;
    ticks = _cnt();
    count = repeats;
    do {
        putchar('.');
        if( f_write(fp, buff, bufsize, NULL) != FR_OK )
            break;
        ticke = _cnt();
        while(ticke - ticks >= onesecond)  {    // one second chunk
            ticks += onesecond;    // one second in sysclock ticks
            msecs += 1000;    // one second in milliseconds
        }
    } while(--count);
    f_close(fp);
    ticke = _cnt();

    if( count ) {
        printf("\n fwrite() failed!  progress = %d   errno = %d: %s\n", repeats - count, errno, strerror(errno));
        exit(4);
    }

    kbytes *= repeats;
    msecs += _muldiv64(ticke - ticks, 1000, onesecond);  // include the remaining, ticks to milliseconds
    printf("\n%s,  Written %zu kBytes at %lu kB/s, ", filename, kbytes, _muldiv64(kbytes, 1000, msecs));

//-----------------------
// Read back file
//-----------------------
    errno = 0;
    rc = f_open(fp, filename, FA_READ);
    if( rc != FR_OK ) {
        printf("Error opening file \"%s\"\n", filename);
        exit(5);
    }
    count = repeats;
    do {
//        putchar('.');
        if( f_read(fp, buff, bufsize, NULL) != FR_OK )
            break;
        if( bufsize != randcmp(buff, bufsize, seed) )
            break;
    } while(--count);

    if( count )
        printf(" MISMATCH!, ");
    else
        printf(" Verified, ");

    f_rewind(fp);    // read the file again, this time purely for speed check
    errno = 0;
    onesecond = _clockfreq();
    msecs = 0;
    ticks = _cnt();
    count = repeats;
    do {
//        putchar('.');
        if( f_read(fp, buff, bufsize, NULL) != FR_OK )
            break;
        ticke = _cnt();
        while(ticke - ticks >= onesecond)  {    // one second chunk
            ticks += onesecond;    // one second in sysclock ticks
            msecs += 1000;    // one second in milliseconds
        }
    } while(--count);
    f_close(fp);
    ticke = _cnt();

    if( count ) {
        printf(" Read back incomplete!\n");
        exit(6);
    }

    msecs += _muldiv64(ticke - ticks, 1000, onesecond);  // include the remaining, ticks to milliseconds
    printf(" Read %zu kBytes at %lu kB/s\n", kbytes, _muldiv64(kbytes, 1000, msecs));
}



static void  testloops( const size_t kbytes, const size_t repeats )
{
    static int  num = 1;
    int  count = 3;
    char  *fname = __builtin_alloca(16);    // auto-frees upon return from testloops()

    puts("");
    do {
        sprintf(fname, "speed%d.bin", num);
        tester(fname, kbytes, repeats);
        num++;
    } while(--count);
}



static void  shutdown( void )
{
    f_unmount("");
    puts("\nexit\n");  // blank line for re-run separation
    _waitms(500);
    _clkset(1, 20000);  // cool running
}



//===================================================================================

void  main( void )
{
    setvbuf(stdout, NULL, _IONBF, 0);    // switch to unbuffered stdout
    atexit(shutdown);
    printf("   clkfreq = %lu   clkmode = 0x%lx\n", _clockfreq(), _clockmode());

    mountsd();

    testloops(1, 64);    // 64 x 1 KB = 64 kB
    testloops(4, 64);    // 64 x 4 KB = 256 kB
    testloops(16, 64);    // 64 x 16 KB = 1 MB
    testloops(64, 32);    // 32 x 64 KB = 2 MB

    exit(0);
}
