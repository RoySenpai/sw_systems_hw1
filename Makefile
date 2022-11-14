# Flags setup
CFLAGS = -Wall
LFLAGS = -shared

# Phony tag for non-targeted commands
.PHONY: all clean loops recursives recursived loopd

# Build everything 
all: mains maindloop maindrec loops recursives recursived loopd

# Marcos to build libraries
loops: libclassloops.a

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so

# Build main programs

# The main program with static libary of recursive implametation
mains: main.o libclassrec.a
	gcc $(CFLAGS) $< -L. -lclassrec -lm -o $@

# The main program with dynamic libary of loops implametation
maindloop: main.o libclassloops.so
	gcc $(CFLAGS) $^ -L. -lclassloops -lm -o $@

# The main program with dynamic libary of recursive implametation
maindrec: main.o libclassrec.so
	gcc $(CFLAGS) $^ -L. -lclassrec -lm -o $@

# Compile the main program to an object file
main.o: main.c NumClass.h
	gcc $(CFLAGS) -c $^

# Building all necessary libraries
libclassrec.so:: advancedClassificationRecursion.o basicClassification.o
	gcc $(LFLAGS) $(CFLAGS) $^ -o $@
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

libclassloops.so:: advancedClassificationLoop.o basicClassification.o
	gcc $(LFLAGS) $(CFLAGcS) $^ -o $@
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

libclassloops.a: advancedClassificationLoop.o basicClassification.o
	ar rcs $@ $^

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	ar rcs $@ $^

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc $(CFLAGS) -c $^ -fPIC

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc $(CFLAGS) -c $^ -fPIC

basicClassification.o: basicClassification.c NumClass.h
	gcc $(CFLAGS) -c $^

# Clean command to cleanup all the compiled files (*.o, *.a, *.so, mains, maindloop and maindrec)
clean:
	rm -rf mains maindloop maindrec *.o *.a *.so *.gch