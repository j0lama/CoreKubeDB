# Author: j0lama

# COMPILER
CC = gcc

#FLAGS
CFLAGS = -c -Wall -ansi -g -std=c99

#LIB FLAGS
LIBFLAGS = -lpthread

#LINK FLAGS
LINKFLAGS = 

TARGET = corekubeDB

# PATHS
SOURCE_DIRECTORY = source/
INCLUDE_DIRECTORY = headers/
OBJECT_DIRECTORY = objects/
BUILD_DIRECTORY = build/

CFILES = $(wildcard $(SOURCE_DIRECTORY)*.c)
OBJECTS = $(patsubst $(SOURCE_DIRECTORY)%.c, $(OBJECT_DIRECTORY)%.o, $(CFILES))

all: $(OBJECT_DIRECTORY) $(TARGET)

debug: CFLAGS += -DDEBUG 
debug: $(OBJECT_DIRECTORY) $(TARGET)

$(TARGET): $(OBJECTS)
	@echo "Building $@..."
	@$(CC) $(OBJECTS) $(LIBFLAGS) $(LINKFLAGS) -o $@

$(OBJECT_DIRECTORY):
	@mkdir $(OBJECT_DIRECTORY)

$(OBJECT_DIRECTORY)%.o: $(SOURCE_DIRECTORY)%.c
	@echo "Building $@..."
	@$(CC) -I $(INCLUDE_DIRECTORY) $(CFLAGS) $(LIBFLAGS) $< -o $@

.PHONY: clean
clean:
	@echo "Removing objects files"
	@rm -rf $(OBJECT_DIRECTORY) $(TARGET)