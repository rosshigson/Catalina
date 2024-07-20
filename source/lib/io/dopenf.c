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
	Open a file for reading or writing. You supply populated VOLINFO, a path to the file,
	mode (DFS_READ or DFS_WRITE) and an empty fileinfo structure. You also need to
	provide a pointer to a sector-sized scratch buffer.
	Returns various DFS_* error states. If the result is DFS_OK, fileinfo can be used
	to access the file from this point on.
*/
uint32_t DFS_OpenFile(PVOLINFO volinfo, uint8_t *path, uint8_t mode, uint8_t *scratch, PFILEINFO fileinfo)
{
	uint8_t tmppath[MAX_PATH];
	uint8_t filename[12];
	uint8_t *p;
	DIRINFO di;
	DIRENT de;
	uint32_t dircluster;

	// larwe 2006-09-16 +1 zero out file structure
	memset(fileinfo, 0, sizeof(FILEINFO));
#if __CATALINA_DEBUG_DOSFS
   t_string(1, "\nDSF_OpenFile 1\n");
   dump_fileinfo(fileinfo);
   DFS_press_to_continue();
#endif

	// save access mode
	fileinfo->mode = mode;

	// Get a local copy of the path. If it's longer than MAX_PATH, abort.
	strncpy((char *) tmppath, (char *) path, MAX_PATH);
	tmppath[MAX_PATH - 1] = 0;
	if (strcmp((char *) path,(char *) tmppath)) {
		return DFS_PATHLEN;
	}

	// strip leading path separators
	while (tmppath[0] == DIR_SEPARATOR)
		strcpy((char *) tmppath, (char *) tmppath + 1);

	// Parse filename off the end of the supplied path
	p = tmppath;
	while (*(p++));

	p--;
	while (p > tmppath && *p != DIR_SEPARATOR) // larwe 9/16/06 ">=" to ">" bugfix
		p--;
	if (*p == DIR_SEPARATOR)
		p++;

	DFS_CanonicalToDir(filename, p);

	if (p > tmppath)
		p--;
	if (*p == DIR_SEPARATOR || p == tmppath) // larwe 9/16/06 +"|| p == tmppath" bugfix
		*p = 0;

	// At this point, if our path was MYDIR/MYDIR2/FILE.EXT, filename = "FILE    EXT" and
	// tmppath = "MYDIR/MYDIR2".
	di.scratch = scratch;
	dircluster = di.currentcluster;

	if (DFS_OpenDir(volinfo, tmppath, &di))
		return DFS_NOTFOUND;

	while (!DFS_GetNext(volinfo, &di, &de)) {
		if (!memcmp(de.name, filename, 11)) {
			// You can use this function call to open a directory if the mode is DFS_OPENDIR.
			//NTRF: allows to create directories
			if ((de.attr & ATTR_DIRECTORY) && (mode != DFS_CREATEDIR) && (mode != DFS_OPENDIR))
				return DFS_NOTFOUND;

			// You CANNOT use this function call to open a file if the mode is DFS_OPENDIR or DFS_CREATEDIR.
			if (!(de.attr & ATTR_DIRECTORY) && ((mode == DFS_CREATEDIR) || (mode == DFS_OPENDIR)))
				return DFS_NOTFOUND;

			fileinfo->volinfo = volinfo;
			fileinfo->pointer = 0;
			// The reason we store this extra info about the file is so that we can
			// speedily update the file size, modification date, etc. on a file that is
			// opened for writing.
			if (di.currentcluster == 0)
				fileinfo->dirsector = volinfo->rootdir + di.currentsector;
			else
				fileinfo->dirsector = volinfo->dataarea + ((di.currentcluster - 2) * volinfo->secperclus) + di.currentsector;
			fileinfo->diroffset = di.currententry - 1;
			if (volinfo->filesystem == FAT32) {
				fileinfo->cluster = (uint32_t) de.startclus_l_l |
				  ((uint32_t) de.startclus_l_h) << 8 |
				  ((uint32_t) de.startclus_h_l) << 16 |
				  ((uint32_t) de.startclus_h_h) << 24;
			}
			else {
				fileinfo->cluster = (uint32_t) de.startclus_l_l |
				  ((uint32_t) de.startclus_l_h) << 8;
			}
			fileinfo->firstcluster = fileinfo->cluster;
			fileinfo->filelen = (uint32_t) de.filesize_0 |
			  ((uint32_t) de.filesize_1) << 8 |
			  ((uint32_t) de.filesize_2) << 16 |
			  ((uint32_t) de.filesize_3) << 24;
#if __CATALINA_DEBUG_DOSFS
         t_string(1, "\nDSF_OpenFile 2\n");
         dump_fileinfo(fileinfo);
         DFS_press_to_continue();
#endif

			return DFS_OK;
		}
	}

	// At this point, we KNOW the file does not exist. If the file was opened
	// with write access, we can create it.
	if (mode & DFS_WRITE) {
		uint32_t cluster, temp;

		// Locate or create a directory entry for this file
		if (DFS_OK != DFS_GetFreeDirEnt(volinfo, tmppath, &di, &de))
			return DFS_ERRMISC;

		// put sane values in the directory entry
		memset(&de, 0, sizeof(de));
		memcpy(de.name, filename, 11);

    de.crttimetenth = 0;
    temp = DFS_FATtime();
    de.crttime_l = temp & 0xFF; temp >>= 8;
    de.crttime_h = temp & 0xFF; temp >>= 8;
    de.crtdate_l = temp & 0xFF; temp >>= 8;
    de.crtdate_h = temp & 0xFF;
    de.lstaccdate_l = de.crtdate_l;
    de.lstaccdate_h = de.crtdate_h;
    de.wrttime_l = de.crttime_l;
    de.wrttime_h = de.crttime_h;
    de.wrtdate_l = de.crtdate_l;
    de.wrtdate_h = de.crtdate_h;

		//NTRF: create directory
		if (mode == DFS_CREATEDIR)
			de.attr |= ATTR_DIRECTORY;

		// allocate a starting cluster for the directory entry
		cluster = DFS_GetFreeFAT(volinfo, scratch);

		de.startclus_l_l = cluster & 0xff;
		de.startclus_l_h = (cluster & 0xff00) >> 8;
		de.startclus_h_l = (cluster & 0xff0000) >> 16;
		de.startclus_h_h = (cluster & 0xff000000) >> 24;

		// update FILEINFO for our caller's sake
		fileinfo->volinfo = volinfo;
		fileinfo->pointer = 0;
		// The reason we store this extra info about the file is so that we can
		// speedily update the file size, modification date, etc. on a file that is
		// opened for writing.
		if (di.currentcluster == 0)
			fileinfo->dirsector = volinfo->rootdir + di.currentsector;
		else
			fileinfo->dirsector = volinfo->dataarea + ((di.currentcluster - 2) * volinfo->secperclus) + di.currentsector;
		fileinfo->diroffset = di.currententry - 1;
		fileinfo->cluster = cluster;
		fileinfo->firstcluster = cluster;
		fileinfo->filelen = 0;
		
		// write the directory entry
		// note that we no longer have the sector containing the directory entry,
		// tragically, so we have to re-read it
		if (DFS_ReadSector(volinfo->unit, scratch, fileinfo->dirsector, 1))
			return DFS_ERRMISC;
		memcpy(&(((PDIRENT) scratch)[di.currententry-1]), &de, sizeof(DIRENT));
		if (DFS_WriteSector(volinfo->unit, scratch, fileinfo->dirsector, 1))
			return DFS_ERRMISC;

		// Mark newly allocated cluster as end of chain			
		switch(volinfo->filesystem) {
#if __CATALINA_FAT12_SUPPORT
			case FAT12:		cluster = 0xff8;	break;
#else
			case FAT12:		return DFS_NOSUPPORT;
#endif                        
			case FAT16:		cluster = 0xfff8;	break;
			case FAT32:		cluster = 0x0ffffff8;	break;
			default:		return DFS_ERRMISC;
		}
		temp = 0;
		DFS_SetFAT(volinfo, scratch, &temp, fileinfo->cluster, cluster);

        //Fill new directory with required info
        if ( mode == DFS_CREATEDIR ) {
            uint32_t startsector = volinfo->dataarea + ( ( fileinfo->cluster - 2 ) * volinfo->secperclus );
            uint32_t endsector = startsector + volinfo->secperclus - 1;

            if ( dircluster <= 2 ) //Root
                dircluster = 0;

            memset( scratch, 0, SECTOR_SIZE );

            for ( ; endsector > startsector; endsector -= 1 )
                DFS_WriteSector( volinfo->unit, scratch, endsector, 1 );

            memcpy( &( de.name ), ".          ", 11 );
            de.filesize_0 = 0;
            de.filesize_1 = 0;
            de.filesize_2 = 0;
            de.filesize_3 = 0;
            memcpy( scratch, &de, sizeof( DIRENT ) );

            memcpy( &( de.name ), "..         ", 11 );
            de.startclus_l_l = dircluster & 0xff;
            de.startclus_l_h = ( dircluster & 0xff00 ) >> 8;
            de.startclus_h_l = ( dircluster & 0xff0000 ) >> 16;
            de.startclus_h_h = ( dircluster & 0xff000000 ) >> 24;

            memcpy( scratch + sizeof( DIRENT ), &de, sizeof( DIRENT ) );

            DFS_WriteSector( volinfo->unit, scratch, startsector, 1 );
        }

		return DFS_OK;
	}

	return DFS_NOTFOUND;
}

