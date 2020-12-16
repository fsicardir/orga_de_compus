EXEC := tp2
TEST_EXEC := cache_test

CC = gcc

CCFLAGS = -g -O0 -Wall -Wextra -Werror -pedantic --std=c99

DEPS = main.c
TEST_DEPS = core_test.c
OBJ = cache_api.o cache.o
TEST_OBJ = cache.o

all: $(EXEC)

test: $(EXEC) $(TEST_EXEC)
	./$(TEST_EXEC)
	#./tests.sh ./$(EXEC)

$(TEST_EXEC): $(TEST_OBJ) $(TEST_DEPS)
	$(CC) $(CCFLAGS) $(TEST_OBJ) $(TEST_DEPS) -o $(TEST_EXEC)

%.o: %.c %.h
	$(CC) $(CCFLAGS) -c $<

$(EXEC): $(OBJ) $(DEPS)
	$(CC) $(CCFLAGS) $(OBJ) $(DEPS) -o $(EXEC)

clean:
	rm -rf *.o $(EXEC) $(TEST_EXEC)

.PHONY: all clean
