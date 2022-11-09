# Flags setup
CFLAGS = -Wall

# Phony tag for non-targeted commands
.PHONY: all clean loops recursives recursived loopd

all: loops recursives recursived loopd mains maindloop maindrec

mains: main.c NumClass.h
	gcc $(CFLAGS) -c $< –L. –lclassrec -o $@

maindloop: main.c NumClass.h
	gcc $(CFLAGS) -c $< –L. -lclassloops -o $@

maindrec: main.c NumClass.h
	gcc $(CFLAGS) -c $< –L. -lclassrec -o $@

loops: 
	gcc $(CFLAGS) -c advancedClassificationLoop.c
	ar –rc libclassloops.a advancedClassificationLoop.o

recursives::
	gcc $(CFLAGS) -c advancedClassificationRecursion.c
	ar –rc libclassrec.a advancedClassificationRecursion.o

recursived::
	gcc -c $(CFLAGS) -Werror -fpic advancedClassificationRecursion.c
	gcc -shared $(CFLAGS) advancedClassificationRecursion.o -o libclassrec.so
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

loopd::
	gcc -c $(CFLAGS) -Werror -fpic advancedClassificationLoop.c
	gcc -shared $(CFLAGS) advancedClassificationLoop.o -o libclassloops.so
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

basicClassification.o: basicClassification.c NumClass.h
	gcc $(CFLAGS) -c basicClassification.c

# Clean command to cleanup all the compiled files (*.o, *.a, *.so, mains, maindloop and maindrec)
clean:
	rm -rf mains maindloop maindrec *.o *.a *.so