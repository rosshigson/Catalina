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
	Find the first unused FAT entry
	You must provide a scratch buffer for one sector (SECTOR_SIZE) and a populated VOLINFO
	Returns a FAT32 BAD_CLUSTER value for any error, otherwise the contents of the desired
	FAT entry.
	Returns FAT32 bad_sector (0x0ffffff7) if there is no free cluster available
*/
uint32_t DFS_GetFreeFAT(PVOLINFO volinfo, uint8_t *scratch)
{
	uint32_t i, result = 0xffffffff, scratchcache = 0;
	
	// Search starts at cluster 2, which is the first usable cluster
	// NOTE: This search can't terminate at a bad cluster, because there might
	// legitimately be bad clusters on the disk.
	for (i=2; i < volinfo->numclusters; i++) {
		result = DFS_GetFAT(volinfo, scratch, &scratchcache, i);
		if (!result) {
			return i;
		}
	}
	return 0x0ffffff7;		// Can't find a free cluster
}

