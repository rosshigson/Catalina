#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P2
B=.bin
P=

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	B=.bin
endif

# set up options specific to Windows or Linux
ifeq ($(OS), Windows_NT)
	E=.exe
	RM=-del_del
else
	E=
	RM=-rm -f
endif

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")
	CFLAGS += -p2 -lci -lgraphic2 -C HD_VGA -C MHZ_297
else
	CFLAGS += $(CATALINA_OPTIONS)
endif

# set up common options
B1=.binary
B2=.bin
E1=.eeprom
O=.obj
L=.lst
CC=catalina

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : registry
registry : registry$B

registry$B: registry.c
	catalina $(CFLAGS) -C CR_ON_LF $^ -o $@

# add this to the 'all' target
all :: registry

.PHONY : text_1
text_1 : text_1$B

text_1$B: text_1.c
	catalina $(CFLAGS) -C CR_ON_LF $^ -o $@

# add this to the 'all' target
all :: text_1

.PHONY : text_2
text_2 : text_2$B

text_2$B: text_2.c
	catalina $(CFLAGS) -C CR_ON_LF $^ -o $@

# add this to the 'all' target
all :: text_2

.PHONY : graph_1
graph_1 : graph_1$B

graph_1$B: graph_1.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: graph_1

.PHONY : graph_2
graph_2 : graph_2$B

graph_2$B: graph_2.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: graph_2

.PHONY : graph_3
graph_3 : graph_3$B

graph_3$B: graph_3.c
	catalina $(CFLAGS) -C CR_ON_LF $^ -o $@

# add this to the 'all' target
all :: graph_3

.PHONY : spacewar
spacewar : spacewar$B

spacewar$B: spacewar.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: spacewar

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

