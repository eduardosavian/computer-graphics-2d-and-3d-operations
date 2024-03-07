CC = clang++
CFLAGS = -Wall -Wextra -std=c++23 -O2
OPATH = objects
CPATH = src
PROJECT = cgt

.PHONY: all clean

all: cgt

graph: main.o reader.o searcher.o
	$(CC) -o graph $(OPATH)/main.o $(OPATH)/reader.o $(OPATH)/searcher.o $(CFLAGS)

main.o: $(CPATH)/main.cpp $(CPATH)/utils/reader.hpp  $(CPATH)/algorithms/searcher.hpp
	$(CC) -c -o $(OPATH)/main.o $(CPATH)/main.cpp $(CFLAGS)

reader.o: $(CPATH)/utils/reader.cpp $(CPATH)/utils/reader.hpp
	$(CC) -c -o $(OPATH)/reader.o $(CPATH)/utils/reader.cpp $(CFLAGS)

searcher.o: $(CPATH)/algorithms/searcher.cpp $(CPATH)/algorithms/searcher.hpp
	$(CC) -c -o $(OPATH)/searcher.o $(CPATH)/algorithms/searcher.cpp $(CFLAGS)

clean:
	rm -rf $(OPATH)/*.o *~ cgt
