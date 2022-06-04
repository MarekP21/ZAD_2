# Najprostszy pliczek makefile kompilujący program Code2

Code2: Code2.o libpole.a libobjetosc.so
	gcc -o Code2 Code2.o libpole.a libobjetosc.so -Wl,-rpath,.
Code2.o: Code2.c libpole.h libobjetosc.h
	gcc -c Code2.c libpole.h libobjetosc.h
libpole.a: pole.o
	ar rs libpole.a pole.o
libobjetosc.so: objetosc.o
	gcc -shared -o libobjetosc.so objetosc.o
pole.o: pole.c
	gcc -c pole.c
objetosc.o: objetosc.c
	gcc -c -fPIC objetosc.c
	
clean:
	rm -f *.o *.a *.so *.gch Code2
