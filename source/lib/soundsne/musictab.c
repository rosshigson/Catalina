#include <musictab.h>
#include <string.h>

// Static data in data.cpp file
extern const char noteName[NOTES_IN_OCTAVE][NOTE_NAME_SIZE];
extern const struct noteItem_t notes[NOTES_COUNT];

static int8_t _curItem; // currently selected item

bool mt_findId(uint8_t midiId) {
  if (midiId < NOTES_COUNT) {
    _curItem = midiId;
  }
  else {
    _curItem = -1;
  }

  return (_curItem != -1);
}

bool mt_findName(const char *note, int8_t octave) {
  int8_t idxName = -1;

  _curItem = -1;

  // first get the index for the note name by matching the name
  idxName = mt_lookupNoteId(note);

  if (idxName != -1) {
    // if that passed, then work out the index based on the octave
    _curItem = (octave * NOTES_IN_OCTAVE) + idxName;
    if (_curItem >= NOTES_COUNT) {
      _curItem = -1; 
    }
  }

  return(_curItem != -1);
}

bool mt_findNoteOctave(uint8_t noteId, int8_t octave) {
  _curItem = -1;

  // first get the index for the note name is within bounds
  if (noteId <= NOTES_IN_OCTAVE) {
    // if that passed, then work out the index based on the octave
    _curItem = (octave * NOTES_IN_OCTAVE) + noteId;
    if (_curItem >= NOTES_COUNT) {
      _curItem = -1;
    }
  }

  return(_curItem != -1);
}

int8_t mt_lookupNoteId(const char* note) {
// first get the index for the note name by matching the name
  int8_t idxName = -1;
  uint8_t i;

  for (i = 0; i < NOTES_IN_OCTAVE; i++) {
    if (strcmp(note, noteName[i]) == 0) {
      idxName = i;
      break;
    }
  }

  return(idxName);
}

float mt_getFrequency(void) {
  float f = 0;

  if (_curItem != -1) {
    f = notes[_curItem].freq;
  }

  return(f);
}

/*
 * itoa() - convert integer to string
 *
 * expects: an integer, and a char buffer of at least ITOA_BUFSIZE 
 *
 * returns: a pointer to the filled portion of the buffer
 */

#define ITOA_BUFSIZE 12 /* 10 digits + 1 sign + 1 trailing nul */

static char *itoa(int i, char *itoa_buf) {
   char *pos = itoa_buf + ITOA_BUFSIZE - 1;
   unsigned int u;
   int negative = 0;

   if (i < 0) {
      negative = 1;
      u = ((unsigned)(-(1+i))) + 1;
   }
   else {
      u = i;
   }

   *pos = 0;

   do {
      *--pos = '0' + (u % 10);
      u /= 10;
   } while (u);

   if (negative) {
      *--pos = '-';
   }

   return pos;
}

char *mt_getName(char *buf, uint8_t len) {
// return the ANSI name
  *buf = '\0';

  if (_curItem != -1) {
    uint8_t nameIdx = notes[_curItem].nameId;
    int8_t octave = notes[_curItem].octave;
    char sz[ITOA_BUFSIZE];

    strncpy(buf, noteName[nameIdx], len);
    strncat(buf, itoa(octave, sz), len-1);
  }
  return(buf);
}

char *mt_getNote(char *buf, uint8_t len) {
  *buf = '\0';
  if (_curItem != -1) {
    uint8_t nameIdx = notes[_curItem].nameId;
    strncpy(buf, noteName[nameIdx], len);
  }
  return(buf);
}

int8_t mt_getOctave(void) {
  int8_t octave = -99;

  if (_curItem != -1) {
    octave = notes[_curItem].octave;
  }

  return(octave);
}

int8_t mt_getId(void) {
  uint8_t id = 255;

  if (_curItem != -1)
    id = notes[_curItem].id;

  return(id);
}

int8_t mt_getNoteId(void) {
  uint8_t id = 255;

  if (_curItem != -1) {
    id = notes[_curItem].nameId;
  }

  return(id);
}
