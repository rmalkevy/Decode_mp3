
CC=gcc

CFLAGS=-c -O3 -I. -I include

OBJS=main.o

mpadec: $(OBJS) libmpadec.a
	$(CC) -o mpadec -Llibmpadec $(OBJS) -lmpadec -lm

mp3tab.os: mp3tab.c  libmpadec.a
	$(CC) -o mp3tab.os -c -O3 -mtune=k8 -ftree-vectorize -ffast-math -DGNU_GETTEXT -g -fomit-frame-pointer -freorder-blocks -fPIC -DLINUX -DPIPES -fPIC -DHAVE_LIBSNDFILE=1016 -DHAVE_FLTK -DBETA -DUSE_DOUBLE -DHAVE_SOCKETS -DHAVE_PTHREAD_BARRIER_INIT -DHAVE_SYNC_LOCK_TEST_AND_SET -DHAVE_FCNTL_H -DHAVE_UNISTD_H -DHAVE_STDINT_H -DHAVE_SYS_TIME_H -DHAVE_SYS_TYPES_H -DHAVE_TERMIOS_H -DHAVE_SOCKETS -DHAVE_DIRENT_H -I.  -Iinclude -I../csound5/H -I/usr/lib/jvm/java-1.5.0/include -I/usr/lib/jvm/java-1.5.0/include/linux -I/usr/local/include -I/usr/include -I/usr/include -I/usr/X11R6/include -Llibmpadec mp3tab.c  -lmpadec -lm

libmpadec.a:
	@cd libmpadec && $(MAKE)

install:libmpadec.a
	@cd libmpadec && $(MAKE) install

%.o: %.c
	$(CC) $(CFLAGS) $*.c

clean:
	@cd libmpadec && $(MAKE) clean
	-@rm *.o
	-@rm mpadec.exe
