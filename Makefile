BIN = libglad

# Flags
CFLAGS += -fPIC -O2 -Iglad/include

SRC = glad/src/glad.c
OBJ = $(SRC:.c=.o)

ifeq ($(OS),Windows_NT)
	BIN := $(BIN).dll.bodged
	LIBS =
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		BIN := $(BIN).dylib.bodged
		LIBS = -ldl
		CFLAGS += -install_name '@loader_path/$(BIN)'
	else
		BIN := $(BIN).so.bodged
		LIBS = -ldl
	endif
endif


build: $(BIN)


$(BIN):
	$(CC) -shared $(SRC) $(CFLAGS) -o $(BIN) $(LIBS)


clean:
	rm -f $(BIN) $(OBJS)
