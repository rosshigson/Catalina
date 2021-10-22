# Catalina C makefile for the ZIP Infocom interpreter

.SUFFIXES: .c .obj .h .binary

CATALINA_DIR = C:\\Progra~1\\Catalina

CC = catalina -D LARGE
CFLAGS = -W-DLOUSY_RANDOM 
LD = catalina
LDFLAGS = -D LARGE -M256k -D CLOCK -D MORPHEUS -D CPU_2 -D PC -D NO_MOUSE -D PROXY_SD -D PROXY_SCREEN -D PROXY_KEYBOARD
LIBS = -lcx
RM = rm -f

INC = ztypes.h
OBJS = catalina_jzip.obj control.obj extern.obj fileio.obj input.obj interpre.obj \
	math.obj memory.obj object.obj operand.obj osdepend.obj license.obj\
	property.obj quetzal.obj screen.obj text.obj variable.obj getopt.obj \
	dumbio.obj

jzip_client_2.binary: $(OBJS) jzip_server_1.binary
	$(LD) $(LDFLAGS) -o $* $(OBJS) $(LIBS)

jzip_server_1.binary:
	bind -p -D MORPHEUS -D CPU_1 -D PC -D NO_MOUSE
	pushd $(CATALINA_DIR)
	pwd
	spinnaker -p -a Generic_Proxy_Server.spin -o $* -I ..\target -b
	popd
	cp $(CATALINA_DIR)\$*.binary .

.c.obj:
	$(CC) $(CFLAGS) -c $<

clean:
	$(RM) *.obj
	$(RM) jzip.binary
