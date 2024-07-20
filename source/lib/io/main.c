#include "stdint.h"
#include <stdio.h>
#include <dosfs.h>
#include <hmi.h>
#include <sd.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

uint32_t DFS_ReadSector(uint8_t unit, uint8_t *buffer, uint32_t sector, uint32_t count)
{
   //int i;
   //if (count == 1) {
      sd_sectread((char *)buffer, sector);
   //}
   //else {
   //   for (i = 0; i < count; i++) {
   //   sd_sectread(buffer + 512*i, sector + i);
   //}
   return 0;
}

uint32_t DFS_WriteSector(uint8_t unit, uint8_t *buffer, uint32_t sector, uint32_t count)
{
   //int i;
   //if (count == 1) {
      sd_sectwrite((char *)buffer, sector);
   //}
   //else {
   //   for (i = 0; i < count; i++) {
   //   sd_sectread(buffer + 512*i, sector + i);
   //}
   return 0;
}

int main()
{

#ifdef REAL_TEST
	uint8_t sector[SECTOR_SIZE], sector2[SECTOR_SIZE];
	uint32_t pstart, psize, i;
	uint8_t pactive, ptype;
	VOLINFO vi;
	DIRINFO di;
	DIRENT de;
	uint32_t cache;
	FILEINFO fi;
	uint8_t *p;
   
	// Obtain pointer to first partition on first (only) unit
	pstart = DFS_GetPtnStart(0, sector, 0, &pactive, &ptype, &psize);
	if (pstart == 0xffffffff) {
		t_string(1, "Cannot find first partition\n");
		return -1;
	}

	printf("Partition 0 start sector 0x%-08.8lX active %-02.2hX type %-02.2hX size %-08.8lX\n", pstart, pactive, ptype, psize);

	if (DFS_GetVolInfo(0, sector, pstart, &vi)) {
		t_string(1, "Error getting volume information\n");
		return -1;
	}
	printf("Volume label '%-11.11s'\n", vi.label);
	printf("%d sector/s per cluster, %d reserved sector/s, volume total %d sectors.\n", vi.secperclus, vi.reservedsecs, vi.numsecs);
	printf("%d sectors per FAT, first FAT at sector #%d, root dir at #%d.\n",vi.secperfat,vi.fat1,vi.rootdir);
	printf("(For FAT32, the root dir is a CLUSTER number, FAT12/16 it is a SECTOR number)\n");
	printf("%d root dir entries, data area commences at sector #%d.\n",vi.rootentries,vi.dataarea);
	printf("%d clusters (%d bytes) in data area, filesystem IDd as ", vi.numclusters, vi.numclusters * vi.secperclus * SECTOR_SIZE);
	if (vi.filesystem == FAT12)
		t_string(1, "FAT12.\n");
	else if (vi.filesystem == FAT16)
		t_string(1, "FAT16.\n");
	else if (vi.filesystem == FAT32)
		t_string(1, "FAT32.\n");
	else
		t_string(1, "[unknown]\n");

//------------------------------------------------------------
// Directory enumeration test
	di.scratch = sector;
//	if (DFS_OpenDir(&vi, "", &di)) {
//		printf("Error opening root directory\n");
//		return -1;
//	}
	if (DFS_OpenDir(&vi, (uint8_t *)"MYDIR1", &di)) {
		printf("error opening subdirectory\n");
		return -1;
	}
	while (!DFS_GetNext(&vi, &di, &de)) {
		if (de.name[0])
			printf("file: '%-11.11s'\n", de.name);
	}


//------------------------------------------------------------
// Unlink test
//	cache = 0;
//	printf("*** FAT BEFORE ***\n");
//  	for (i=0;i<vi.numclusters;i++) {
//		printf("entry %-08.8x, %-08.8X\n", i, DFS_GetFAT(&vi, sector, &cache, i));
//	}
//	if (DFS_UnlinkFile(&vi, "MYDIR1/SUBDIR1.2/README.TXT", sector)) {
//		printf("error unlinking file\n");
//	}
//	printf("*** FAT AFTER ***\n");
//  	for (i=0;i<vi.numclusters;i++) {
//		printf("entry %-08.8x, %-08.8X\n", i, DFS_GetFAT(&vi, sector, &cache, i));
//	}

//------------------------------------------------------------
// File write test
	if (DFS_OpenFile(&vi, (uint8_t *)"MYDIR1/WRTEST.TXT", DFS_WRITE, sector, &fi)) {
		printf("error opening file\n");
		return -1;
	}
	for (i=0;i<18;i++) {
		memset(sector2, 128+i, SECTOR_SIZE);
		DFS_WriteFile(&fi, sector, sector2, &cache, SECTOR_SIZE/2);
		memset(sector2+256, 255-i, SECTOR_SIZE/2);
		DFS_WriteFile(&fi, sector, sector2+256, &cache, SECTOR_SIZE/2);
	}
	sprintf((char *)sector2, "test string at the end...");
	DFS_WriteFile(&fi, sector, sector2, &cache, strlen(sector2));

//------------------------------------------------------------
// File read test
	printf("Readback test\n");
	if (DFS_OpenFile(&vi, (uint8_t *)"MYDIR1/WRTEST.TXT", DFS_READ, sector, &fi)) {
		printf("error opening file\n");
		return -1;
	}
	p = (void *) malloc(fi.filelen+512);
	memset(p, 0xaa, fi.filelen+512);

	DFS_ReadFile(&fi, sector, p, &i, fi.filelen);
printf("read complete %d bytes (expected %d) pointer %d\n", i, fi.filelen, fi.pointer);

	{
	FILE *fp;
	fp=fopen("test.txt","wb");
	fwrite(p, fi.filelen+512, 1, fp);
	fclose(fp);
	}

#else

   uint8_t sector[SECTOR_SIZE]; 
   uint32_t pstart, psize;
	uint8_t pactive, ptype;
	VOLINFO vi;
	DIRINFO di;
	DIRENT de;
   int i;

	pstart = DFS_GetPtnStart(0, sector, 0, &pactive, &ptype, &psize);
	DFS_GetVolInfo(0, sector, pstart, &vi);

	if (vi.filesystem == FAT12)
		t_string(1, "FAT12.\n");
	else if (vi.filesystem == FAT16)
		t_string(1, "FAT16.\n");
	else if (vi.filesystem == FAT32)
		t_string(1, "FAT32.\n");
	else
		t_string(1, "[unknown]\n");

	t_string(1, "label=");
   t_string(1, (char *)vi.label);
   t_char(1, '\n');

// Directory enumeration test
	di.scratch = sector;
	DFS_OpenDir(&vi, (unsigned char *)"", &di);
	while (!DFS_GetNext(&vi, &di, &de)) {
		if (de.name[0]) {
         for (i = 0; i < 11; i++) {
			   t_char(1, de.name[i]);
         }
         t_char(1, '\n');
      }
	}

#endif   
  
	return 0;
}
