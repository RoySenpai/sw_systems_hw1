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
MAIN = main.c
HEADER = NumClass.h
LIBB = basicClassification.c
LIBLOOP = advancedClassificationLoop.c
LIBREC = advancedClassificationRecursion.c
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
mains: $(MAIN:.c=.o) $(LIBRS)
	$(CC) $(CFLAGS) $< ./$(LIBRS) $(MATHLIB) -o $@

# The main program with dynamic libary of loops implametation
maindloop: $(MAIN:.c=.o) $(LIBLD)
	$(CC) $(CFLAGS) $< ./$(LIBLD) $(MATHLIB) -o $@

# The main program with dynamic libary of recursive implametation
maindrec: $(MAIN:.c=.o) $(LIBRD)
	$(CC) $(CFLAGS) $< ./$(LIBRD) $(MATHLIB) -o $@

# Compile the main program to an object file
$(MAIN:.c=.o): $(MAIN) $(HEADER)
	$(CC) $(CFLAGS) -c $^

# Building all necessary libraries
$(LIBRD): $(LIBREC:.c=.o) $(LIBB:.c=.o)
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

$(LIBLD): $(LIBLOOP:.c=.o) $(LIBB:.c=.o)
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

$(LIBLS): $(LIBLOOP:.c=.o) $(LIBB:.c=.o)
	$(AR) $(SFLAGS) $@ $^

$(LIBRS): $(LIBREC:.c=.o) $(LIBB:.c=.o)
	$(AR) $(SFLAGS) $@ $^

$(LIBLOOP:.c=.o): $(LIBLOOP) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

$(LIBREC:.c=.o): $(LIBREC) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

$(LIBB:.c=.o): $(LIBB) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

# Clean command to cleanup all the compiled files (*.o, *.a, *.so, *.gch, mains, maindloop and maindrec)
clean:
	rm -f mains maindloop maindrec *.o *.a *.so *.gch