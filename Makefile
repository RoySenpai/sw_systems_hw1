# Programs to use
CC = gcc
AR = ar

# Flags setup
CFLAGS = -Wall -g
LFLAGS = -shared
SFLAGS = rcs
FP = -fPIC
MATHLIB = -lm

# File names
MAIN = main.o
HEADER = NumClass.h
LIBB = basicClassification.o
LIBLS = libclassloops.a
LIBRS = libclassrec.a
LIBLD = libclassloops.so
LIBRD = libclassrec.so

# Phony tag for non-targeted commands
.PHONY: all clean loops recursives recursived loopd

# Build everything 
all: mains maindloop maindrec loops recursives recursived loopd

# Marcos to build libraries
loops: $(LIBLS)

recursives: $(LIBRS)

recursived: $(LIBRD)

loopd: $(LIBLD)

# Build main programs

# The main program with static libary of recursive implametation
mains: $(MAIN) $(LIBRS)
	$(CC) $(CFLAGS) $(MAIN) ./$(LIBRS) $(MATHLIB) -o $@

# The main program with dynamic libary of loops implametation
maindloop: $(MAIN) $(LIBLD)
	$(CC) $(CFLAGS) $(MAIN) ./$(LIBLD) $(MATHLIB) -o $@

# The main program with dynamic libary of recursive implametation
maindrec: $(MAIN) $(LIBRD)
	$(CC) $(CFLAGS) $(MAIN) ./$(LIBRD) $(MATHLIB) -o $@

# Compile the main program to an object file
$(MAIN): main.c $(HEADER)
	$(CC) $(CFLAGS) -c $^

# Building all necessary libraries
$(LIBRS): advancedClassificationRecursion.o $(LIBB)
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

$(LIBLD): advancedClassificationLoop.o $(LIBB)
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

$(LIBLS): advancedClassificationLoop.o $(LIBB)
	$(AR) $(SFLAGS) $@ $^

$(LIBRD): advancedClassificationRecursion.o $(LIBB)
	$(AR) $(SFLAGS) $@ $^

advancedClassificationLoop.o: advancedClassificationLoop.c $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

advancedClassificationRecursion.o: advancedClassificationRecursion.c $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

$(LIBB): basicClassification.c $(HEADER)
	$(CC) $(CFLAGS) -c $^

# Clean command to cleanup all the compiled files (*.o, *.a, *.so, mains, maindloop and maindrec)
clean:
	rm -rf mains maindloop maindrec *.o *.a *.so *.gch