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
	Set FAT entry for specified cluster number
	You must provide a scratch buffer for one sector (SECTOR_SIZE) and a populated VOLINFO
	Returns DFS_ERRMISC for any error, otherwise DFS_OK
	scratchcache should point to a UINT32. This variable caches the physical sector number
	last read into the scratch buffer for performance enhancement reasons.

	NOTE: This code is HIGHLY WRITE-INEFFICIENT, particularly for flash media. Considerable
	performance gains can be realized by caching the sector. However this is difficult to
	achieve on FAT12 without requiring 2 sector buffers of scratch space, and it is a design
	requirement of this code to operate on a single 512-byte scratch.

	If you are operating DOSFS over flash, you are strongly advised to implement a writeback
	cache in your physical I/O driver. This will speed up your code significantly and will
	also conserve power and flash write life.
*/
uint32_t DFS_SetFAT(PVOLINFO volinfo, uint8_t *scratch, uint32_t *scratchcache, uint32_t cluster, uint32_t new_contents)
{
	uint32_t offset=0, sector=0, result=0;
	if (volinfo->filesystem == FAT12) {
#if __CATALINA_FAT12_SUPPORT
		offset = cluster + (cluster / 2);
		new_contents &=0xfff;
#else
      return DFS_NOSUPPORT;
#endif      
	}
	else if (volinfo->filesystem == FAT16) {
		offset = cluster * 2;
		new_contents &=0xffff;
	}
	else if (volinfo->filesystem == FAT32) {
		offset = cluster * 4;
		new_contents &=0x0fffffff;	// FAT32 is really "FAT28"
	}
	else
		return DFS_ERRMISC;	

	// at this point, offset is the BYTE offset of the desired sector from the start
	// of the FAT. Calculate the physical sector containing this FAT entry.
	sector = ldiv(offset, SECTOR_SIZE).quot + volinfo->fat1;

	// If this is not the same sector we last read, then read it into RAM
	if (sector != *scratchcache) {
		if(DFS_ReadSector(volinfo->unit, scratch, sector, 1)) {
			// avoid anyone assuming that this cache value is still valid, which
			// might cause disk corruption
			*scratchcache = 0;
			return DFS_ERRMISC;
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
		// If this is an odd cluster, pre-shift the desired new contents 4 bits to
		// make the calculations below simpler
		if (cluster & 1)
			new_contents = new_contents << 4;

		// Special case for sector boundary
		if (offset == SECTOR_SIZE - 1) {

			// Odd cluster: High 12 bits being set
			if (cluster & 1) {
				scratch[offset] = (scratch[offset] & 0x0f) | new_contents & 0xf0;
			}
			// Even cluster: Low 12 bits being set
			else {
				scratch[offset] = new_contents & 0xff;
			}
			result = DFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
			// mirror the FAT into copy 2
			if (DFS_OK == result)
				result = DFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);

			// If we wrote that sector OK, then read in the subsequent sector
			// and poke the first byte with the remainder of this FAT entry.
			if (DFS_OK == result) {
				(*scratchcache)++;
				result = DFS_ReadSector(volinfo->unit, scratch, *scratchcache, 1);
				if (DFS_OK == result) {
					// Odd cluster: High 12 bits being set
					if (cluster & 1) {
						scratch[0] = new_contents & 0xff00;
					}
					// Even cluster: Low 12 bits being set
					else {
						scratch[0] = (scratch[0] & 0xf0) | new_contents & 0x0f;
					}
					result = DFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
					// mirror the FAT into copy 2
					if (DFS_OK == result)
						result = DFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);
				}
				else {
					// avoid anyone assuming that this cache value is still valid, which
					// might cause disk corruption
					*scratchcache = 0;
				}
			}
		} // if (offset == SECTOR_SIZE - 1)

		// Not a sector boundary. But we still have to worry about if it's an odd
		// or even cluster number.
		else {
			// Odd cluster: High 12 bits being set
			if (cluster & 1) {
				scratch[offset] = (scratch[offset] & 0x0f) | new_contents & 0xf0;
				scratch[offset+1] = new_contents & 0xff00;
			}
			// Even cluster: Low 12 bits being set
			else {
				scratch[offset] = new_contents & 0xff;
				scratch[offset+1] = (scratch[offset+1] & 0xf0) | new_contents & 0x0f;
			}
			result = DFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
			// mirror the FAT into copy 2
			if (DFS_OK == result)
				result = DFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);
		}
	}
	else 
#endif   
   if (volinfo->filesystem == FAT16) {
		scratch[offset] = (new_contents & 0xff);
		scratch[offset+1] = (new_contents & 0xff00) >> 8;
		result = DFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
		// mirror the FAT into copy 2
		if (DFS_OK == result)
			result = DFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);
	}
	else if (volinfo->filesystem == FAT32) {
		scratch[offset] = (new_contents & 0xff);
		scratch[offset+1] = (new_contents & 0xff00) >> 8;
		scratch[offset+2] = (new_contents & 0xff0000) >> 16;
		scratch[offset+3] = (scratch[offset+3] & 0xf0) | ((new_contents & 0x0f000000) >> 24);
		// Note well from the above: Per Microsoft's guidelines we preserve the upper
		// 4 bits of the FAT32 cluster value. It's unclear what these bits will be used
		// for; in every example I've encountered they are always zero.
		result = DFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
		// mirror the FAT into copy 2
		if (DFS_OK == result)
			result = DFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);
	}
	else
		result = DFS_ERRMISC;

	return result;
}

