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
	Fetch FAT entry for specified cluster number
	You must provide a scratch buffer for one sector (SECTOR_SIZE) and a populated VOLINFO
	Returns a FAT32 BAD_CLUSTER value for any error, otherwise the contents of the desired
	FAT entry.
	scratchcache should point to a UINT32. This variable caches the physical sector number
	last read into the scratch buffer for performance enhancement reasons.
*/
uint32_t DFS_GetFAT(PVOLINFO volinfo, uint8_t *scratch, uint32_t *scratchcache, uint32_t cluster)
{
	uint32_t offset=0, sector=0, result=0;

	if (volinfo->filesystem == FAT12) {
#if __CATALINA_FAT12_SUPPORT      
		offset = cluster + (cluster / 2);
#else
      return DFS_NOSUPPORT;
#endif      
	}
	else if (volinfo->filesystem == FAT16) {
		offset = cluster * 2;
	}
	else if (volinfo->filesystem == FAT32) {
		offset = cluster * 4;
	}
	else
		return 0x0ffffff7;	// FAT32 bad cluster	

	// at this point, offset is the BYTE offset of the desired sector from the start
	// of the FAT. Calculate the physical sector containing this FAT entry.
	sector = ldiv(offset, SECTOR_SIZE).quot + volinfo->fat1;

	// If this is not the same sector we last read, then read it into RAM
	if (sector != *scratchcache) {
		if(DFS_ReadSector(volinfo->unit, scratch, sector, 1)) {
			// avoid anyone assuming that this cache value is still valid, which
			// might cause disk corruption
			*scratchcache = 0;
			return 0x0ffffff7;	// FAT32 bad cluster	
		}
		*scratchcache = sector;
	}

	// At this point, we "merely" need to extract the relevant entry.
	// This is easy for FAT16 and FAT32, but a royal PITA for FAT12 as a single entry
	// may span a sector boundary. The normal way around this is always to read two
	// FAT sectors, but that luxury is (by design intent) unavailable to DOSFS.
	offset = ldiv(offset, SECTOR_SIZE).rem;

#if __CATALINA_FAT12_SUPPORT
	if (volinfo->filesystem == FAT12) {
		// Special case for sector boundary - Store last byte of current sector.
		// Then read in the next sector and put the first byte of that sector into
		// the high byte of result.
		if (offset == SECTOR_SIZE - 1) {
			result = (uint32_t) scratch[offset];
			sector++;
			if(DFS_ReadSector(volinfo->unit, scratch, sector, 1)) {
				// avoid anyone assuming that this cache value is still valid, which
				// might cause disk corruption
				*scratchcache = 0;
				return 0x0ffffff7;	// FAT32 bad cluster	
			}
			*scratchcache = sector;
			// Thanks to Claudio Leonel for pointing out this missing line.
			result |= ((uint32_t) scratch[0]) << 8;
		}
		else {
			result = (uint32_t) scratch[offset] |
			  ((uint32_t) scratch[offset+1]) << 8;
		}
		if (cluster & 1)
			result = result >> 4;
		else
			result = result & 0xfff;
	}
	else 
#endif      
   if (volinfo->filesystem == FAT16) {
		result = (uint32_t) scratch[offset] |
		  ((uint32_t) scratch[offset+1]) << 8;
	}
	else if (volinfo->filesystem == FAT32) {
		result = ((uint32_t) scratch[offset] |
		  ((uint32_t) scratch[offset+1]) << 8 |
		  ((uint32_t) scratch[offset+2]) << 16 |
		  ((uint32_t) scratch[offset+3]) << 24) & 0x0fffffff;
	}
	else
		result = 0x0ffffff7;	// FAT32 bad cluster	
	return result;
}

