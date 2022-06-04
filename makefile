# Ostateczny plik makefile rozbudowany m.in o reguły wzorca

CC = cc
CFLAGS = -g
AR = ar

# Zmienna predefiniowana (P - skrot od program)
P = Code2

all: $(P)

# Wykorzystanie przyrostków
.PHONY: clean
.SUFIXES: .c .o .a .so .h

# Reguły wzorca
# Dla utowrzenia programu wynikowego
%: %.o
	$(CC) $(CFLAGS) -o $@ $^ -Wl,-rpath,.

# Dla stworzenia pliku obiektowego dla biblioteki statycznej oraz Code2.o
%1.o: %.c
	$(CC) $(CFLAGS) -c $^

# Dla utworzenia pliku obiektowego dla biblioteki dynamicznej
%2.o: %.c
	$(CC) $(CFLAGS) -c -fPIC $^

# Dla utworzenia biblioteki statycznej
lib%.a: %.o
	$(AR) rs $@ $<

# Dla utworzenia biblioteki dynamicznej
lib%.so: %.o
	$(CC) $(CFLAGS) -shared -o $@ $<

$(P): $(P).o libpole.a libobjetosc.so
$(P)1.o: $(P).c libpole.h libobjetosc.h
libpole.a: pole.o
libobjetosc.so: objetosc.o
pole1.o: pole.c
objetosc2.o: objetosc.c

# Czyszczenie po budowaniu pliku
clean:
	rm -f *.o *.a *.so $(P)

# Koniec pliku makefile
