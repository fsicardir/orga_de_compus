EXEC := common

CC = gcc

CCFLAGS = -Wall -Wextra -Werror -pedantic --std=c99

DEPS = main.c
OBJ = mcm.o mcd.o
ASM = mcm.S mcd.S

all: $(EXEC)

test: $(EXEC)
	./tests.sh ./$(EXEC)

%.o: %.c %.h
	$(CC) $(CCFLAGS) -c $<

$(EXEC): $(OBJ) $(DEPS)
	$(CC) $(CCFLAGS) $(OBJ) $(DEPS) -o $(EXEC)

asm: $(ASM) $(DEPS)
	$(CC) $(CCFLAGS) $(ASM) $(DEPS) -o $(EXEC)

clean:
	rm -rf *.o $(EXEC)

.PHONY: all test clean asm
