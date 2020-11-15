include ../../Makefile.inc

MALLOCS =	mal_mal.s mal_cal.s mal_rea.s mal_fre.s mal_sel.s\
				phys_create_chunk.s phys_combine_chunks.s phys_truncate.s\
				log_first_present.s log_free_list_entry.s log_link_free_chunk.s\
				log_search_free_list.s log_unlink_free_chunk.s check.s global.s

MALLOCSRC =	size_type.h param.h impl.h check.h log.h phys.h \
				mal_mal.c mal_cal.c mal_rea.c mal_fre.c mal_sel.c\
				phys_create_chunk.c phys_combine_chunks.c phys_truncate.c\
				log_first_present.c log_free_list_entry.c log_link_free_chunk.c\
				log_search_free_list.c log_unlink_free_chunk.c check.c global.c\
				check.c

$(MALLOCOBJ):	$(MALLOCS) Makefile 

all:	$(MALLOCS)

clean:
		rm -f *.s
