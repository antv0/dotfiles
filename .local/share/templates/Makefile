DEBUG = false

CXX = g++

ifeq ($(DEBUG),true)
	CPPFLAPGS = -g 
	LDFLAGS = -g
else
	CPPFLAPGS = 
	LDFLAGS = 
endif

LDLIBS = 
EXEC = out
ARGS =

SRC = main.cpp
OBJ = $(SRC:.cpp=.o)

all: out

$(EXEC): $(OBJ)
ifeq ($(DEBUG), true)
	@echo "DEBUG MODE"
endif
	$(CXX) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.cpp 
	$(CXX) $(CPPFLAPGS) -o $@ -c $<

run: out
	./$(EXEC) $(ARGS)

clean:
	@rm -f imgv main.o
