CC = gcc
RM = rm
TS = tree-sitter
CFLAGS = -I src/ -std=c99 -pedantic -O3 -ffast-math -fPIC
LDFLAGS =
LDLIBS = 

VPATH = src

OBJS = parser.o
TARGET = test.so

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -shared $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c
	$(CC) $(CFLAGS) $^ -c $@

src/parser.c: grammar.js
	$(TS) generate --no-bindings

clean :
	$(RM) $(TARGET)
	$(RM) $(OBJS)

.PHONY: clean
