EXEC := tp0

CC = gcc

CCFLAGS = -Wall -Wextra -Werror -pedantic --std=c99 -g

OBJ = tp0.o base64.o

all: $(EXEC)

test: $(EXEC)
	./tests.sh ./$(EXEC)

%.o: %.c %.h
	$(CC) $(CCFLAGS) -c $<

$(EXEC): $(OBJ) $(DEPS)
	$(CC) $(CCFLAGS) $(OBJ) $(DEPS) -o $(EXEC)

clean:
	rm -rf *.o *.s $(EXEC)

asm: $(EXEC)
	objdump -S $(EXEC) > tp0.s

.PHONY: all clean
