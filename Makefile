BIN = libglad

# Flags
CFLAGS =  -fPIC -O2 -Iglad/include

SRC = glad/src/glad.c
OBJ = $(SRC:.c=.o)

ifeq ($(OS),Windows_NT)
	BIN := $(BIN).dll
	LIBS =
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		BIN := $(BIN).dylib
		LIBS = -ldl
	else
		BIN := $(BIN).so
		LIBS = -ldl
	endif
endif


build: $(BIN)


$(BIN):
	$(CC) -shared $(SRC) $(CFLAGS) -o $(BIN) $(LIBS)


clean:
	rm -f $(BIN) $(OBJS)
