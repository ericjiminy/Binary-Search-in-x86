# Eric Chun - jc2ppp - 11/5/20 - Makefile

CXX = clang++
CXXFLAGS = -Wall -g
AS = nasm
ASFLAGS = -f elf64 -g
OBJECTS = testBinarySearch.o binarySearch.o

a.out: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS)

testBinarySearch.o: testBinarySearch.cpp

clean:
	-rm -f *.o *~


