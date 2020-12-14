EXEC := tp2
TEST_EXEC := cache_test

CC = gcc

CCFLAGS = -Wall -Wextra -Werror -pedantic --std=c99

DEPS = main.c
TEST_DEPS = core_test.c
OBJ = cache_api.o cache.o

all: $(EXEC)

test: $(EXEC)
	./tests.sh ./$(EXEC)

core_test: $(TEST_EXEC)
	./$(TEST_EXEC)

$(TEST_EXEC): $(OBJ) $(TEST_DEPS)
	$(CC) $(CCFLAGS) $(OBJ) $(TEST_DEPS) -o $(TEST_EXEC)

%.o: %.c %.h
	$(CC) $(CCFLAGS) -c $<

$(EXEC): $(OBJ) $(DEPS)
	$(CC) $(CCFLAGS) $(OBJ) $(DEPS) -o $(EXEC)

clean:
	rm -rf *.o $(EXEC)

.PHONY: all clean
