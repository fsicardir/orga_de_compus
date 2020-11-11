EXEC := common

ARCH = $(shell uname -m)
CC = gcc

CC_FLAGS = -Wall -Wextra -Werror -pedantic --std=c99
CC_ASM_FLAGS = -mips32 -mlong32

DEPS = main.c
OBJ = mcm.o mcd.o

all: $(EXEC)

test: $(EXEC)
	./tests.sh ./$(EXEC)

ifeq ($(ARCH), mips64)
%.o: %.S %.h
	$(CC) $(CC_FLAGS) $(CC_ASM_FLAGS) -c $^
else
%.o: %.c %.h
	$(CC) $(CC_FLAGS) -c $^
endif

$(EXEC): $(OBJ) $(DEPS)
	$(CC) $(CC_FLAGS) $(OBJ) $(DEPS) -o $(EXEC)

clean:
	rm -rf *.o *.gch $(EXEC)

.PHONY: all test clean
