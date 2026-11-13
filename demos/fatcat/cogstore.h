#ifndef __COGSTORE_H
#define __COGSTORE_H 1

int StartCogStore();

int StopCogStore();

int Valid();

int WriteCogStore(void *addr);

int ReadCogStore(void *addr);

int SizeCogStore();

int SetupCogStore(void *addr);

#ifdef __CATALINA_P2

int WriteLUTStore(void *addr);

int ReadLUTStore(void *addr);

int SizeLUTStore();

#endif

#endif
