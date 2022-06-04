# Plik makefile rozbudowany o reguły przyrostków

CC = cc
CFLAGS = -g
AR = ar

# Zmienna predefiniowana (P - skrot od program)
P = Code2

# Wykorzystanie przyrostków
.PHONY: clean
.SUFIXES: .c .o .a .so .h

# Uzycie -fPIC do dwóch bibliotek ze wzgledu na ogólność regół przyrostków
# Zostanie to poprawione w regule wzorca

.c.o:
	$(CC) $(CFLAGS) -c -fPIC $^ 

.o:
	$(CC) $(CFLAGS) -o $@ $^ -Wl,-rpath,.

$(P): $(P).o libpole.a libobjetosc.so
$(P).o: $(P).c libpole.h libobjetosc.h
pole.o: pole.c
objetosc.o: objetosc.c

# próba zbudowania reguly przyrostkow dla ponizszych polecen nie powiedzie sie
libpole.a: pole.o
	$(AR) rs $@ $<
libobjetosc.so: objetosc.o
	$(CC) $(CFLAGS) -shared -o $@ $<
	
clean:
	rm -f *.o *.a *.so *.gch $(P)
