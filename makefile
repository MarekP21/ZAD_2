# Plik makefile rozbudowany o zmienne automatyczne i kilka innych rzeczy

CC = cc
CFLAGS = -g
AR = ar

# Zmienna predefiniowana (P - skrot od program)
P = Code2

$(P): $(P).o libpole.a libobjetosc.so
	$(CC) $(CFLAGS) -o $@ $^ -Wl,-rpath,.
$(P).o: $(P).c libpole.h libobjetosc.h
	$(CC) $(CFLAGS) -c $^
libpole.a: pole.o
	$(AR) rs $@ $<
libobjetosc.so: objetosc.o
	$(CC) $(CFLAGS) -shared -o $@ $<
pole.o: pole.c
	$(CC) $(CFLAGS) -c $<
objetosc.o: objetosc.c
	$(CC) $(CFLAGS) -c -fPIC $<
	
clean:
	rm -f *.o *.a *.so *.gch $(P)
