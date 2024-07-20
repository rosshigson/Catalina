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
	Open a directory for enumeration by DFS_GetNextDirEnt
	You must supply a populated VOLINFO (see DFS_GetVolInfo)
   ** you must also make sure dirinfo->scratch is valid in the dirinfo you pass it** //reza
	The empty string or a string containing only the directory separator are
	considered to be the root directory.
	Returns 0 OK, nonzero for any error.
*/
uint32_t DFS_OpenDir(PVOLINFO volinfo, uint8_t *dirname, PDIRINFO dirinfo)
{
	// Default behavior is a regular search for existing entries
	dirinfo->flags = 0;

	if (!strlen((char *) dirname) || (strlen((char *) dirname) == 1 && dirname[0] == DIR_SEPARATOR)) {
		if (volinfo->filesystem == FAT32) {
			dirinfo->currentcluster = volinfo->rootdir;
			dirinfo->currentsector = 0;
			dirinfo->currententry = 0;

			// read first sector of directory
			return DFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->dataarea + ((volinfo->rootdir - 2) * volinfo->secperclus), 1);
		}
		else {
			dirinfo->currentcluster = 0;
			dirinfo->currentsector = 0;
			dirinfo->currententry = 0;

			// read first sector of directory
			return DFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->rootdir, 1);
		}
	}

	// This is not the root directory. We need to find the start of this subdirectory.
	// We do this by devious means, using our own companion function DFS_GetNext.
	else {
		uint8_t tmpfn[12];
		uint8_t *ptr = dirname;
		uint32_t result;
		DIRENT de;

		if (volinfo->filesystem == FAT32) {
			dirinfo->currentcluster = volinfo->rootdir;
			dirinfo->currentsector = 0;
			dirinfo->currententry = 0;

			// read first sector of directory
			if (DFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->dataarea + ((volinfo->rootdir - 2) * volinfo->secperclus), 1))
				return DFS_ERRMISC;
		}
		else {
			dirinfo->currentcluster = 0;
			dirinfo->currentsector = 0;
			dirinfo->currententry = 0;

			// read first sector of directory
			if (DFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->rootdir, 1))
				return DFS_ERRMISC;
		}

		// skip leading path separators
		while (*ptr == DIR_SEPARATOR && *ptr)
			ptr++;

		// Scan the path from left to right, finding the start cluster of each entry
		// Observe that this code is inelegant, but obviates the need for recursion.
		while (*ptr) {
			DFS_CanonicalToDir(tmpfn, ptr);

			de.name[0] = 0;

			do {
				result = DFS_GetNext(volinfo, dirinfo, &de);
			} while (!result && (memcmp(de.name, tmpfn, 11) != 0));

			if (!memcmp(de.name, tmpfn, 11) && ((de.attr & ATTR_DIRECTORY) == ATTR_DIRECTORY)) {
				if (volinfo->filesystem == FAT32) {
					dirinfo->currentcluster = (uint32_t) de.startclus_l_l |
					  ((uint32_t) de.startclus_l_h) << 8 |
					  ((uint32_t) de.startclus_h_l) << 16 |
					  ((uint32_t) de.startclus_h_h) << 24;
				}
				else {
					dirinfo->currentcluster = (uint32_t) de.startclus_l_l |
					  ((uint32_t) de.startclus_l_h) << 8;
				}
				dirinfo->currentsector = 0;
				dirinfo->currententry = 0;

				if (DFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->dataarea + ((dirinfo->currentcluster - 2) * volinfo->secperclus), 1))
					return DFS_ERRMISC;
			}
			else 
				return DFS_NOTFOUND;

			// seek to next item in list
			while (*ptr != DIR_SEPARATOR && *ptr)
				ptr++;
			if (*ptr == DIR_SEPARATOR)
				ptr++;
		}

		if (!dirinfo->currentcluster)
			return DFS_NOTFOUND;
	}
	return DFS_OK;
}

