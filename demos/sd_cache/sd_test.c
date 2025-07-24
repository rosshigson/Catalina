
#include <propeller2.h>
#include <lut_exec.h>
#include <alloca.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <math.h>


#define  SECTORS  1                // number of sectors per file

#define  BUFSIZE  (SECTORS * 512)



uint32_t  xoro32state;



static void  randfill( uint32_t *addr, size_t size )
{
    LUT_BEGIN("0", "randfill", "$FACE0000");    // load into lutRAM
    PASM(
"		rdlong	r1, ##@_PASM(xoro32state)\n"
"		shr	_PASM(size), #2\n"
"		wrfast	#0, _PASM(addr)\n"
"		rep	@.rend, _PASM(size)\n"
"		xoro32	r1\n"
"		mov	pa, 0-0\n"
"		wflong	pa\n"
" .rend\n"
"		wrlong	r1, ##@_PASM(xoro32state)\n"    // preserved for continuation
    );
    LUT_END;

    LUT_CALL("randfill");
}



static size_t  randcmp( const uint32_t *addr, size_t size )
{
    LUT_BEGIN("30", "randcmp", "$FACE0001");    // load into lutRAM
    PASM(
"		rdlong	r1, ##@_PASM(xoro32state)\n"
"		shr	_PASM(size), #2\n"
"		mov	r0, #0\n"
"		rdfast	#0, _PASM(addr)\n"
"		rep	@.rend, _PASM(size)\n"
"		rflong	pa\n"
"		xoro32	r1\n"
"		cmp	pa, 0-0   wz\n"
"	if_z	add	r0, #4\n"
" .rend\n"
"		wrlong	r1, ##@_PASM(xoro32state)\n"    // preserved for continuation
    );
    LUT_END;

    return LUT_CALL("randcmp");
}


static void  writefile( const char *filename, uint32_t *data )
{
    FILE  *fh;
    size_t  count;

    errno = 0;
    fh = fopen(filename, "wb");
    if( !fh ) {
        printf(" fopen() %s for writing failed!   errno = %d: %s\n", filename, errno, strerror(errno));
        exit(1);
    }

    randfill(data, BUFSIZE);

    count = fwrite(data, 1, BUFSIZE, fh);
    if( count != BUFSIZE ) {
        printf(" fwrite() failed!  count = %d   errno = %d: %s\n", count, errno, strerror(errno));
        exit(1);
    }

    fclose(fh);
}



static void  checkfile( const char *filename, uint32_t *data )
{
    FILE  *fh;
    size_t  count;

    memset(data, 0, BUFSIZE);  // erase any echoes

    errno = 0;
    fh = fopen(filename, "rb");
    if( !fh ) {
        printf(" fopen() %s for reading failed!   errno = %d: %s\n", filename, errno, strerror(errno));
        exit(1);
    }

    count = fread(data, 1, BUFSIZE, fh);
    if( count != BUFSIZE ) {
        printf(" fread() failed!  count = %d   errno = %d: %s\n", count, errno, strerror(errno));
        exit(1);
    }
    fclose(fh);

    count = randcmp(data, BUFSIZE);
    if( count != BUFSIZE ) {
        printf(" rancmp() failed!   passed = %d\n", count);
        exit(2);
    }
}



static void  rmfile( const char *filename, uint32_t *data )
{
    remove(filename);
/*
    if( remove(filename) ) {
        printf(" error deleting file %s!   errno = %d: %s\n", filename, errno, strerror(errno));
        exit(1);
    }
*/
}



static void  countdown( int secs )
{
    printf("\n %d sec pause for card recovery ", secs);
    do {
        _waitms(1000);
        putchar('.');
    } while( --secs );
}


//===================================================================================


static void  tester( int files,
        void (*callback)(const char *filename, uint32_t *data) )
{
    uint32_t  ticks, ticke, usecs, onesecond;
    int  i;
    float  rate;
    static char  filepath1[] = "copy000.bin";
    static char  pfstr[] = "Duration %d ms, %.0f files/s\n";
    uint32_t  *buff = __builtin_alloca(BUFSIZE);    // auto-frees upon return from tester()
    if( !buff ) {
        printf(" malloc() failed!\n");
        exit(1);
    }

    onesecond = _clockfreq();
    usecs = 0;
    i = files;
    ticks = _cnt();
    do {
        i--;
        filepath1[4] = i/100 + '0';
        filepath1[5] = i/10%10 + '0';
        filepath1[6] = i%10 + '0';

        callback(filepath1, buff);

        ticke = _cnt();
        if(ticke - ticks >= onesecond)  {    // one second chunk
            ticks += onesecond;    // one second in sysclock ticks
            usecs += 1000000;    // one second in microseconds
        }
    } while( i );
    usecs += _muldiv64(ticke - ticks, 1000000, onesecond);  // remaining ticks to microseconds

    rate = files * 1.0e6 / usecs;
    if( rate < 10.0 )
        pfstr[18] = '3';
    else if( rate < 100.0 )
        pfstr[18] = '2';
    else if( rate < 1000.0 )
        pfstr[18] = '1';
    else
        pfstr[18] = '0';
    printf(pfstr, (usecs+500)/1000, rate);
}

//===================================================================================


static void  shutdown( void )
{
    puts("\nexit\n");  // blank line for re-run separation
    _waitms(500);
    _clkset(1, 20000);  // cool running
}




void  main( void )
{
    uint32_t  seed;
    int files = 200;    // max of 1000

#if defined(__CATALINA__)
    _waitms(1000); // give external VT100 emulator a chance to start (if used)
#endif

#if defined(__CATALINA_WRITE_BACK)
    CacheWriteThrough(0); // disable write through, which enables write back
#endif
    
    setvbuf(stdout, NULL, _IONBF, 0);    // switch to unbuffered stdout
    atexit(shutdown);
    printf("\n   clkfreq = %d   clkmode = 0x%x\n\n", _clockfreq(), _clockmode());

    

    printf("   File size = %d bytes\n", BUFSIZE);

    printf(" Delete %d files ... ", files);
    tester(files, &rmfile);

#if defined(__CATALINA_WRITE_BACK)
    CacheFlush(); // flush cached sectors to SD
#endif

    countdown(10);
    files = 50;

    printf("\n Create %d files ... ", files);
    seed = _rnd();
    xoro32state = seed;
    tester(files, &writefile);

    printf(" Verify %d files ... ", files);
    xoro32state = seed;
    tester(files, &checkfile);

    printf(" Delete %d files ... ", files);
    tester(files, &rmfile);


#if defined(__CATALINA_WRITE_BACK)
    CacheFlush(); // flush cached sectors to SD
#endif

    countdown(10);
    files = 200;

    printf("\n Create %d files ... ", files);
    seed = _rnd();
    xoro32state = seed;
    tester(files, &writefile);

    printf(" Verify %d files ... ", files);
    xoro32state = seed;
    tester(files, &checkfile);

    printf(" Delete %d files ... ", files);
    tester(files, &rmfile);

#if defined(__CATALINA_WRITE_BACK)
    CacheFlush(); // flush cached sectors to SD
#endif

    exit(0);
}
