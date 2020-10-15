EXEC := tp0

CC = gcc

CCFLAGS = -Wall -Wextra -Werror -pedantic --std=c99

OBJ = tp0.o base64.o

all: $(EXEC)

run: $(EXEC)
	./$(EXEC)

%.o: %.c %.h
	$(CC) $(CCFLAGS) -c $<

$(EXEC): $(OBJ) $(DEPS)
	$(CC) $(CCFLAGS) $(OBJ) $(DEPS) -o $(EXEC)

clean:
	rm -rf *.o $(EXEC)

.PHONY: all clean
