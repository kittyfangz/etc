CC := tcc
SRCS := $(wildcard *.c)
TARGETS := $(patsubst %.c,%,$(SRCS))

all: $(TARGETS)

%: %.c
	$(CC) -o ~/bin/$@ $<
