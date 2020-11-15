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
	Get next entry in opened directory structure. Copies fields into the dirent
	structure, updates dirinfo. Note that it is the _caller's_ responsibility to
	handle the '.' and '..' entries.
	A deleted file will be returned as a NULL entry (first char of filename=0)
	by this code. Filenames beginning with 0x05 will be translated to 0xE5
	automatically. Long file name entries will be returned as NULL.
	returns DFS_EOF if there are no more entries, DFS_OK if this entry is valid,
	or DFS_ERRMISC for a media error
*/
uint32_t DFS_GetNext(PVOLINFO volinfo, PDIRINFO dirinfo, PDIRENT dirent)
{
	uint32_t tempint;	// required by DFS_GetFAT

	// Do we need to read the next sector of the directory?
	if (dirinfo->currententry >= SECTOR_SIZE / sizeof(DIRENT)) {
		dirinfo->currententry = 0;
		dirinfo->currentsector++;

		// Root directory; special case handling 
		// Note that currentcluster will only ever be zero if both:
		// (a) this is the root directory, and
		// (b) we are on a FAT12/16 volume, where the root dir can't be expanded
		if (dirinfo->currentcluster == 0) {
			// Trying to read past end of root directory?
			if (dirinfo->currentsector * (SECTOR_SIZE / sizeof(DIRENT)) >= volinfo->rootentries)
				return DFS_EOF;

			// Otherwise try to read the next sector
			if (DFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->rootdir + dirinfo->currentsector, 1))
				return DFS_ERRMISC;
		}

		// Normal handling
		else {
			if (dirinfo->currentsector >= volinfo->secperclus) {
				dirinfo->currentsector = 0;
#if __CATALINA_FAT12_SUPPORT            
				if ((dirinfo->currentcluster >= 0xff7 &&  volinfo->filesystem == FAT12) ||
#else
				if (volinfo->filesystem == FAT12)
               return DFS_NOSUPPORT;
            else if (
#endif                  
				  (dirinfo->currentcluster >= 0xfff7 &&  volinfo->filesystem == FAT16) ||
				  (dirinfo->currentcluster >= 0x0ffffff7 &&  volinfo->filesystem == FAT32)) {

				  	// We are at the end of the directory chain. If this is a normal
				  	// find operation, we should indicate that there is nothing more
				  	// to see.
				  	if (!(dirinfo->flags & DFS_DI_BLANKENT))
						return DFS_EOF;
					
					// On the other hand, if this is a "find free entry" search,
					// we need to tell the caller to allocate a new cluster
					else
						return DFS_ALLOCNEW;
				}
				dirinfo->currentcluster = DFS_GetFAT(volinfo, dirinfo->scratch, &tempint, dirinfo->currentcluster);
			}
			if (DFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->dataarea + ((dirinfo->currentcluster - 2) * volinfo->secperclus) + dirinfo->currentsector, 1))
				return DFS_ERRMISC;
		}
	}

	memcpy(dirent, &(((PDIRENT) dirinfo->scratch)[dirinfo->currententry]), sizeof(DIRENT));

	if (dirent->name[0] == 0) {		// no more files in this directory
		// If this is a "find blank" then we can reuse this name.
		if (dirinfo->flags & DFS_DI_BLANKENT) {
#if APPLY_PATCHES
	      dirinfo->currententry++;
#endif
			return DFS_OK;
      }
		else
			return DFS_EOF;
	}

	if (dirent->name[0] == 0xe5)	// handle deleted file entries
		dirent->name[0] = 0;
	else if (((dirent->attr & ATTR_LONG_NAME) == ATTR_LONG_NAME) && !( dirinfo->flags & DFS_DI_BLANKENT)) //NTRF: don't replace longnames with new files
		dirent->name[0] = 0;
	else if (dirent->name[0] == 0x05)	// handle kanji filenames beginning with 0xE5
		dirent->name[0] = 0xe5;

	dirinfo->currententry++;

	return DFS_OK;
}

