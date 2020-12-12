EXEC := tp2

CC = gcc

CCFLAGS = -Wall -Wextra -Werror -pedantic --std=c99

DEPS = main.c
OBJ = cache_api.o cache.o

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
