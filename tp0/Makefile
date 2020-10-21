EXEC := tp0

CC = gcc

CCFLAGS = -Wall -Wextra -Werror -pedantic --std=c99

DEPS = tp0.c
OBJ = base64.o

all: $(EXEC)

test: $(EXEC)
	./tests.sh ./$(EXEC)

%.o: %.c %.h
	$(CC) $(CCFLAGS) -c $<

$(EXEC): $(OBJ) $(DEPS)
	$(CC) $(CCFLAGS) $(OBJ) $(DEPS) -o $(EXEC)

clean:
	rm -rf *.o $(EXEC)

.PHONY: all clean
