CC = gcc
RM = rm
CFLAGS = -I src/ -std=c99 -pedantic -Wall -O2 -fPIC
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

clean :
	$(RM) $(TARGET)
	$(RM) $(OBJS)

.PHONY: clean
