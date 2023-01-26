#---------------------------
#VARS
#---------------------------

CXX=g++
LFLAGS=-L/usr/local/lib

#Conditional compiler & flags for intel / arm
ifeq ($(ARCH),MAC_M1_INTEL)
    CXX=/usr/local/bin/g++-11
else ifeq ($(ARCH), MAC)
    LFLAGS=-L/opt/homebrew/lib
endif
#-----



#Compiler flags
CXX_FLAGS = -Wall -std=c++11 -fPIC -O3

#Libraries 
LIBS = 

#Source files
SRC_PATHS = ./src
SRCS = $(foreach PATH, $(SRC_PATHS), $(wildcard $(PATH)/*.cpp))

#Headers 
INCLUDES = -I./include

#Define the object files - names of source files with suffix replacement
OBJS = $(SRCS:.cpp=.o)

#---------------------------
#GENERIC RULES
#---------------------------

#What happens when you just type make
all:	main_test

#Remove object files
clean:
	rm $(OBJS) main_test

#Suffix replacement rule
%.o: %.cpp
	$(CXX) $(CXX_FLAGS) $(INCLUDES) -c -o $@ $<


#---------------------------
#SPECIFIC RULES - i.e., the ones to use
#---------------------------

#Main rule
main_test: $(OBJS) main_test.cpp
	$(CXX) $(CXX_FLAGS) main_test.cpp $(INCLUDES) -o $@ $(OBJS) $(LFLAGS) $(LIBS)

