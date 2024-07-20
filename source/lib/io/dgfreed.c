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
	INTERNAL
	Find a free directory entry in the directory specified by path
	This function MAY cause a disk write if it is necessary to extend the directory
	size.
	Note - di.scratch must be preinitialized to point to a sector scratch buffer
	de is a scratch structure
	Returns DFS_ERRMISC if a new entry could not be located or created
	de is updated with the same return information you would expect from DFS_GetNext
*/
uint32_t DFS_GetFreeDirEnt(PVOLINFO volinfo, uint8_t *path, PDIRINFO di, PDIRENT de)
{
	uint32_t tempclus=0,i=0;

	if (DFS_OpenDir(volinfo, path, di))
		return DFS_NOTFOUND;

	// Set "search for empty" flag so DFS_GetNext knows what we're doing
	di->flags |= DFS_DI_BLANKENT;

	// We seek through the directory looking for an empty entry
	// Note we are reusing tempclus as a temporary result holder.
	tempclus = 0;	
	do {
		tempclus = DFS_GetNext(volinfo, di, de);

		// Empty entry found
		if (tempclus == DFS_OK && (!de->name[0])) {
			return DFS_OK;
		}

		// End of root directory reached
		else if (tempclus == DFS_EOF)
			return DFS_ERRMISC;
			
		else if (tempclus == DFS_ALLOCNEW) {
			tempclus = DFS_GetFreeFAT(volinfo, di->scratch);
			if (tempclus == 0x0ffffff7)
				return DFS_ERRMISC;

			// write out zeroed sectors to the new cluster
			memset(di->scratch, 0, SECTOR_SIZE);
			for (i=0;i<volinfo->secperclus;i++) {
				if (DFS_WriteSector(volinfo->unit, di->scratch, volinfo->dataarea + ((tempclus - 2) * volinfo->secperclus) + i, 1))
					return DFS_ERRMISC;
			}
			// Point old end cluster to newly allocated cluster
			i = 0;
			DFS_SetFAT(volinfo, di->scratch, &i, di->currentcluster, tempclus);

			// Update DIRINFO so caller knows where to place the new file			
			di->currentcluster = tempclus;
			di->currentsector = 0;
#if APPLY_PATCHES
         di->currententry = 0; // tempclus is not zero but contains fat entry, so next loop will call
                               // DFS_GetNext(), which will increment currententry
                               // This is OK for for the code coming after this, which  expects to subtract 1
                               // Starting with 1 would cause a 'hole' in the dir.
#else
         di->currententry = 1;	// since the code coming after this expects to subtract 1
#endif			
			// Mark newly allocated cluster as end of chain			
			switch(volinfo->filesystem) {
#if __CATALINA_FAT12_SUPPORT            
				case FAT12:		tempclus = 0xff8;	break;
#else
				case FAT12:		return DFS_NOSUPPORT;
#endif                           
				case FAT16:		tempclus = 0xfff8;	break;
				case FAT32:		tempclus = 0x0ffffff8;	break;
				default:		return DFS_ERRMISC;
			}
			DFS_SetFAT(volinfo, di->scratch, &i, di->currentcluster, tempclus);
		}
	} while (!tempclus);

	// We shouldn't get here
	return DFS_ERRMISC;
}

