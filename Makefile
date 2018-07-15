CC?=gcc
CFLAGS:=-Wall -Wextra -Werror $(CFLAGS)
LDFLAGS=-Lrustlib/target/debug -lrustlib -lpthread -ldl

all: main

rustlib.a:
	(cd rustlib && cargo build)

main.o: main.c
	$(CC) $(CFLAGS) -c -o $@ $<

main: rustlib.a main.o
	$(CC) $(CFLAGS) -o $@ main.o $(LDFLAGS)

clean:
	(cd rustlib && cargo clean)
	rm -f main.o main

.PHONY: all clean
