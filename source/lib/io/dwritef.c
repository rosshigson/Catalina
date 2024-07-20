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
	Write an open file
	You must supply a prepopulated FILEINFO as provided by DFS_OpenFile, and a
	pointer to a SECTOR_SIZE scratch buffer.
	This function updates the successcount field with the number of bytes actually written.
*/
uint32_t DFS_WriteFile(PFILEINFO fileinfo, uint8_t *scratch, uint8_t *buffer, uint32_t *successcount, uint32_t len)
{
	uint32_t remain=0;
	uint32_t result = DFS_OK;
	uint32_t sector=0;
	uint32_t byteswritten=0;

#if __CATALINA_DEBUG_DOSFS
   t_string(1, "\nDFSWriteFile\n");
   dump_fileinfo(fileinfo);
   DFS_press_to_continue();
#endif

   // Don't allow writes to a file that's open as readonly
	if (!(fileinfo->mode & DFS_WRITE))
		return DFS_ERRMISC;

	remain = len;
	*successcount = 0;

	while (remain && result == DFS_OK) {
		// This is a bit complicated. The sector we want to read is addressed at a cluster
		// granularity by the fileinfo->cluster member. The file pointer tells us how many
		// extra sectors to add to that number.
		sector = fileinfo->volinfo->dataarea +
		  ((fileinfo->cluster - 2) * fileinfo->volinfo->secperclus) +
		  div(div(fileinfo->pointer,fileinfo->volinfo->secperclus * SECTOR_SIZE).rem, SECTOR_SIZE).quot;

		// Case 1 - File pointer is not on a sector boundary
		if (div(fileinfo->pointer, SECTOR_SIZE).rem) {
			uint16_t tempsize;

			// We always have to go through scratch in this case
			result = DFS_ReadSector(fileinfo->volinfo->unit, scratch, sector, 1);

			// This is the number of bytes that we don't want to molest in the
			// scratch sector just read.
			tempsize = div(fileinfo->pointer, SECTOR_SIZE).rem;
					
			// Case 1A - We are writing the entire remainder of the sector. After
			// this point, all passes through the read loop will be aligned on a
			// sector boundary, which allows us to go through the optimal path
			// 2A below.
		   	if (remain >= SECTOR_SIZE - tempsize) {
				memcpy(scratch + tempsize, buffer, SECTOR_SIZE - tempsize);
				if (!result)
					result = DFS_WriteSector(fileinfo->volinfo->unit, scratch, sector, 1);

				byteswritten = SECTOR_SIZE - tempsize;
				buffer += SECTOR_SIZE - tempsize;
				fileinfo->pointer += SECTOR_SIZE - tempsize;
				if (fileinfo->filelen < fileinfo->pointer) {
					fileinfo->filelen = fileinfo->pointer;
				}
				remain -= SECTOR_SIZE - tempsize;
			}
			// Case 1B - This concludes the file write operation
			else {
				memcpy(scratch + tempsize, buffer, remain);
				if (!result)
					result = DFS_WriteSector(fileinfo->volinfo->unit, scratch, sector, 1);

				buffer += remain;
				fileinfo->pointer += remain;
				if (fileinfo->filelen < fileinfo->pointer) {
					fileinfo->filelen = fileinfo->pointer;
				}
				byteswritten = remain;
				remain = 0;
			}
		} // case 1
		// Case 2 - File pointer is on sector boundary
		else {
			// Case 2A - We have at least one more full sector to write and don't have
			// to go through the scratch buffer. You could insert optimizations here to
			// write multiple sectors at a time, if you were thus inclined. Refer to
			// similar notes in DFS_ReadFile.
			if (remain >= SECTOR_SIZE) {
				result = DFS_WriteSector(fileinfo->volinfo->unit, buffer, sector, 1);
				remain -= SECTOR_SIZE;
				buffer += SECTOR_SIZE;
				fileinfo->pointer += SECTOR_SIZE;
				if (fileinfo->filelen < fileinfo->pointer) {
					fileinfo->filelen = fileinfo->pointer;
				}
				byteswritten = SECTOR_SIZE;
			}
			// Case 2B - We are only writing a partial sector and potentially need to
			// go through the scratch buffer.
			else {
				// If the current file pointer is not yet at or beyond the file
				// length, we are writing somewhere in the middle of the file and
				// need to load the original sector to do a read-modify-write.
				if (fileinfo->pointer < fileinfo->filelen) {
					result = DFS_ReadSector(fileinfo->volinfo->unit, scratch, sector, 1);
					if (!result) {
						memcpy(scratch, buffer, remain);
						result = DFS_WriteSector(fileinfo->volinfo->unit, scratch, sector, 1);
					}
				}
				else {
					result = DFS_WriteSector(fileinfo->volinfo->unit, buffer, sector, 1);
				}

				buffer += remain;
				fileinfo->pointer += remain;
				if (fileinfo->filelen < fileinfo->pointer) {
					fileinfo->filelen = fileinfo->pointer;
				}
				byteswritten = remain;
				remain = 0;
			}
		}

		*successcount += byteswritten;

		// check to see if we stepped over a cluster boundary
		if (div(fileinfo->pointer - byteswritten, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot !=
		  div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot) {
		  	uint32_t lastcluster;

		  	// We've transgressed into another cluster. If we were already at EOF,
		  	// we need to allocate a new cluster.
			// An act of minor evil - we use byteswritten as a scratch integer, knowing
			// that its value is not used after updating *successcount above
			byteswritten = 0;

			lastcluster = fileinfo->cluster;
			fileinfo->cluster = DFS_GetFAT(fileinfo->volinfo, scratch, &byteswritten, fileinfo->cluster);
			
			// Allocate a new cluster?
#if __CATALINA_FAT12_SUPPORT
			if (((fileinfo->volinfo->filesystem == FAT12) && (fileinfo->cluster >= 0xff8)) ||
#else
			if (fileinfo->volinfo->filesystem == FAT12) 
            return DFS_NOSUPPORT;
			if (
#endif               
           ((fileinfo->volinfo->filesystem == FAT16) && (fileinfo->cluster >= 0xfff8)) ||
			  ((fileinfo->volinfo->filesystem == FAT32) && (fileinfo->cluster >= 0x0ffffff8))) {
			  	uint32_t tempclus;

				tempclus = DFS_GetFreeFAT(fileinfo->volinfo, scratch);
				byteswritten = 0; // invalidate cache
				if (tempclus == 0x0ffffff7)
					return DFS_ERRMISC;

				// Link new cluster onto file
				DFS_SetFAT(fileinfo->volinfo, scratch, &byteswritten, lastcluster, tempclus);
				fileinfo->cluster = tempclus;

				// Mark newly allocated cluster as end of chain			
				switch(fileinfo->volinfo->filesystem) {
#if __CATALINA_FAT12_SUPPORT
					case FAT12:		tempclus = 0xff8;	break;
#endif                              
					case FAT16:		tempclus = 0xfff8;	break;
					case FAT32:		tempclus = 0x0ffffff8;	break;
					default:		return DFS_ERRMISC;
				}
				DFS_SetFAT(fileinfo->volinfo, scratch, &byteswritten, fileinfo->cluster, tempclus);

				result = DFS_OK;
			}
			// No else clause is required.
		}
	}
	
	// Update directory entry
		if (DFS_ReadSector(fileinfo->volinfo->unit, scratch, fileinfo->dirsector, 1))
			return DFS_ERRMISC;
      // note - use remain to hold the time to avoid creating another variable
    remain = DFS_FATtime();
    ((PDIRENT) scratch)[fileinfo->diroffset].wrttime_l = remain & 0xFF; remain >>= 8;
    ((PDIRENT) scratch)[fileinfo->diroffset].wrttime_h = remain & 0xFF; remain >>= 8;
    ((PDIRENT) scratch)[fileinfo->diroffset].wrtdate_l = remain & 0xFF; remain >>= 8;
    ((PDIRENT) scratch)[fileinfo->diroffset].wrtdate_h = remain & 0xFF;
		((PDIRENT) scratch)[fileinfo->diroffset].filesize_0 = fileinfo->filelen & 0xff;
		((PDIRENT) scratch)[fileinfo->diroffset].filesize_1 = (fileinfo->filelen & 0xff00) >> 8;
		((PDIRENT) scratch)[fileinfo->diroffset].filesize_2 = (fileinfo->filelen & 0xff0000) >> 16;
		((PDIRENT) scratch)[fileinfo->diroffset].filesize_3 = (fileinfo->filelen & 0xff000000) >> 24;
		if (DFS_WriteSector(fileinfo->volinfo->unit, scratch, fileinfo->dirsector, 1))
			return DFS_ERRMISC;
	return result;
}


