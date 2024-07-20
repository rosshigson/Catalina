/*
	DOSFS Embedded FAT-Compatible Filesystem
	(C) 2005 Lewin A.R.W. Edwards (sysadm@zws.com)

	You are permitted to modify and/or use this code in your own projects without
	payment of royalty, regardless of the license(s) you choose for those projects.

	You cannot re-copyright or restrict use of the code as released by Lewin Edwards.
*/

#include <string.h>
#include <stdlib.h>
#include <dosfs.h>

/*
	Delete a file
	scratch must point to a sector-sized buffer
*/
uint32_t DFS_UnlinkFile(PVOLINFO volinfo, uint8_t *path, uint8_t *scratch)
{
	PDIRENT de = (PDIRENT) scratch;
	FILEINFO fi;
	uint32_t cache = 0;
	uint32_t tempclus = 0;

	// DFS_OpenFile gives us all the information we need to delete it
	if (DFS_OK != DFS_OpenFile(volinfo, path, DFS_READ, scratch, &fi))
		return DFS_NOTFOUND;

	// First, read the directory sector and delete that entry
	if (DFS_ReadSector(volinfo->unit, scratch, fi.dirsector, 1))
		return DFS_ERRMISC;
	((PDIRENT) scratch)[fi.diroffset].name[0] = 0xe5;
	if (DFS_WriteSector(volinfo->unit, scratch, fi.dirsector, 1))
		return DFS_ERRMISC;

	// Now follow the cluster chain to free the file space
#if __CATALINA_FAT12_SUPPORT
   if (volinfo->filesystem == FAT12) 
      return DFS_NOSUPPORT;
	while (!(
#else   
	while (!((volinfo->filesystem == FAT12 && fi.firstcluster >= 0x0ff7) ||
#endif         
	  (volinfo->filesystem == FAT16 && fi.firstcluster >= 0xfff7) ||
	  (volinfo->filesystem == FAT32 && fi.firstcluster >= 0x0ffffff7) ||
    (fi.firstcluster == 0))) {
		tempclus = fi.firstcluster;

		fi.firstcluster = DFS_GetFAT(volinfo, scratch, &cache, fi.firstcluster);
		DFS_SetFAT(volinfo, scratch, &cache, tempclus, 0);

	}
	return DFS_OK;
}

