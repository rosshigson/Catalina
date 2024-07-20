//
// converts an 8x16 .BDF file into a font.bin file that my
// VGA tile driver can use
// Tweak as necessary for other font sizes
//
// virtually no sanity check or error checking is done :(
//
// Written by Eric R. Smith and placed in the public domain
//
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define MAXUNICODE 65536
#define MAXGLYPH 256
#define MAX_LINE 32

// maps unicode code points to glyphs
short mapping_table[MAXUNICODE];

//
// set up a mapping table between Unicode and our font glyphs
// we can read this from file "mapf", which is a text file
// each line looks like:
//    GG: XXXX, YYYY, AAAA-BBBB, ZZZZ
// this says that starting at glyph GG we will map
//    XXXX -> GG
//    YYYY -> GG+1
//    AAAA -> GG+2, AAAA+1->GG+3, ... BBBB->GG+(BBBB-AAAA)+n
// and so on, incrementing
// All numbers are in hex
// the default mapping table is just the identity
void
InitMapping(FILE *mapf)
{
    int i;
    unsigned int AAAA, BBBB;
    unsigned int GG;
    int line = 1;
    char buf[800];
    char *p;
    
    for (i = 0; i < MAXUNICODE; i++) {
        mapping_table[i] = -1; // no mapping
    }
    if (!mapf) {
        for (i = 0; i < MAXGLYPH; i++) {
            mapping_table[i] = i;
        }
        return;
    }
    GG = AAAA = BBBB = 0;
    for(;;) {
        p = fgets(buf, sizeof(buf)-1, mapf);
        if (!p) break;
        while (*p && isspace(*p)) p++;
        // allow empty lines and comments
        if (*p == '#' || !*p || *p == '\n') {
            line++;
            continue;
        }
        // start with the base glyph number
        GG = strtoul(p, &p, 16);
        if (!p) {
            fprintf(stderr, "parse error line %d\n", line);
            break;
        }
        if (*p != ':') {
            fprintf(stderr, "parse error line %d\n", line);
            break;
        }
        p++;
        while (*p && *p != '\n') {
            while (*p && isspace(*p)) {
                p++;
            }
            if (!*p || *p == '\n') break;
            if (!isxdigit(*p)) {
                fprintf(stderr, "expected hex digit line %d\n", line);
                return;
            }
            AAAA = strtoul(p, &p, 16);
            while (*p && isspace(*p)) p++;
            if (!*p) {
                continue;
            }
            if (*p == ',') {
                // single item
                BBBB = AAAA;
            } else if (*p == '-') {
                p++;
                if (!isxdigit(*p)) {
                    fprintf(stderr, "expected hex digit after - on line %d\n", line);
                    return;
                }
                BBBB = strtoul(p, &p, 16);
            } else {
                fprintf(stderr, "unexpected character `%c' on line %d\n", *p, line);
                return;
            }
            while (AAAA <= BBBB) {
                mapping_table[AAAA] = GG;
                GG++;
                AAAA++;
            }
            if (*p == ',') p++;
            while (*p && isspace(*p)) p++;
        }
        line++;
    }
}

int FONT_HEIGHT = 0;
int FONT_WIDTH = 8;
unsigned short fontdata[MAXGLYPH][MAX_LINE];

#define LINELEN 256
char buf[LINELEN];

char * ProcessChar(unsigned glyphnum, unsigned codepoint, FILE *in)
{
    int bitmapline = -1;
    char *p;
    int w, h, x, y;
    
    for(;;) {
        p = fgets(buf, LINELEN-1, in);
        if (!p) {
            return p;
        }
        if (!strncmp(p, "BBX ", 4)) {
            sscanf(p+4, "%d %d %d %d", &w, &h, &x, &y);
            if (w > FONT_WIDTH) {
                fprintf(stderr, "bounding box too wide  for U+%04x\n", codepoint);
                exit(1);
            }
            if (h > FONT_HEIGHT) {
                fprintf(stderr, "bounding box too tall for U+%04x\n", codepoint);
                exit(1);
            }
        }
        if (!strncmp(p, "ENDCHAR", 6)) {
            return p;
        }
        if (!strncmp(p, "BITMAP", 6)) {
            bitmapline = 0;
            continue;
        }
        if (bitmapline >= 0) {
            if (bitmapline >= FONT_HEIGHT) {
                fprintf(stderr, "too many lines in character\n");
                return p;
            }
            fontdata[glyphnum][bitmapline] = strtoul(p, NULL, 16);
            bitmapline++;
        }
    }       
}

void Process(FILE *in, FILE *out)
{
    char *p;
    unsigned codepoint;
    unsigned glyph;
    int i, j, k;
    int width, height;
    
    for(;;) {
        p = fgets(buf, LINELEN-1, in);
        if (!p) break;
        if (!strncmp(p, "FONTBOUNDINGBOX ", strlen("FONTBOUNDINGBOX "))) {
            width = height = 0;
            p += strlen("FONTBOUNDINGBOX ");
            width = strtoul(p, &p, 0);
            (void)width;
            if (p) {
                height = strtoul(p, &p, 0);
            }
            if (height == 0) {
                fprintf(stderr, "WARNING: unable to find font height\n");
            } else {
                FONT_HEIGHT = height;
            }
            continue;
        }

        if (0 != strncmp(p, "STARTCHAR ", strlen("STARTCHAR "))) {
            continue;
        }
        if (0 == strncmp(p, "STARTCHAR U+", strlen("STARTCHAR U+"))) {
            p += strlen("STARTCHAR U+");
            codepoint = strtoul(p, NULL, 16);
        } else {
            // look for ENCODING line following
            p = fgets(buf, LINELEN-1, in);
            if (!p || 0 != strncmp(p, "ENCODING ", strlen("ENCODING "))) {
                fprintf(stderr, "ERROR: unable to find ENCODING");
                exit(2);
            }
            p += strlen("ENCODING ");
            codepoint = strtoul(p, NULL, 0);
        }
//        fprintf(stderr, "process code point %x [%s]\n", codepoint, p);
        glyph = mapping_table[codepoint];
        if (glyph >= 0 && glyph < MAXGLYPH) {
            p = ProcessChar(glyph, codepoint, in);
            if (!p) break;
        }
    }

#ifdef DEBUG
    // debug code
    printf("bitmap data:\n");
    for (j = 0; j < FONT_HEIGHT; j++) {
//        for (i = 0; i < MAXGLYPH; i++) {
        for (i = 'c'; i < 'k'; i++) {
            unsigned c = fontdata[i][j];
            for (k = FONT_WIDTH-1; k >= 0; --k) {
                int h = '.';
                if (c & (1<<k)) {
                    h = '*';
                }
                fputc(h, stdout);
            }
            fputc(' ', stdout);
        }
        fprintf(stdout, "\n");
    }
#endif
    for (j = 0; j < FONT_HEIGHT; j++) {
        for (i = 0; i < MAXGLYPH; i++) {
            unsigned c = fontdata[i][j];
            unsigned r = 0;
            unsigned mask = 1 << FONT_WIDTH-1;
            // get bits in little endian order
            for (k = 0; k < FONT_WIDTH; k++) {
                if (c & (1<<k)) {
                    r = r | mask;
                }
                mask = mask >> 1;
            }
            if (FONT_WIDTH == 16) {
                fputc( r & 0xff, out );
                fputc( (r>>8) & 0xff, out);
            } else {
                fputc(r, out);
            }
        }
    }
}

int main(int argc, char **argv)
{
    FILE *inf, *outf, *maptab;
    char *inname;
    char *outname;
    int len;

    if (argc > 2 && !strcmp(argv[1], "-16")) {
        FONT_WIDTH = 16;
        --argc; ++argv;
    }
    if (argc != 2 && argc != 3) {
        fprintf(stderr, "Usage: makebitmap [-16] font.bdf [map table]\n");
        exit(2);
    }
    inname = argv[1];
    // if the file is named foo-16xN then it is 16 wide
    if (strstr(inname, "-16x")) {
        FONT_WIDTH = 16;
    }
    inf = fopen(inname, "r"); // .bdf is a text format
    if (!inf) {
        perror(inname);
        exit(1);
    }
    maptab = NULL;
    if (argv[2]) {
        maptab = fopen(argv[2], "r");
        if (!maptab) {
            perror(argv[2]);
        }
    }
    InitMapping(maptab);
    len = strlen(inname);
    // make sure there is room for at least "font.bin"
    outname = malloc(len + 16);
    strcpy(outname, inname);
    if (len > 4 && !strcmp(outname+len-4, ".bdf")) {
        strcpy(outname+len-4, ".bin");
    } else {
        strcpy(outname,  "font.bin");
    }
    outf = fopen(outname, "wb");
    if (!outf) {
        perror(outname);
        return 1;
    }
    Process(inf, outf);
    return 0;
}
