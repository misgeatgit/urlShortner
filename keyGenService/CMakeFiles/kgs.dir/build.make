# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/misgana/src/urlShortner/keyGenService

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/misgana/src/urlShortner/keyGenService

# Include any dependencies generated for this target.
include CMakeFiles/kgs.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/kgs.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/kgs.dir/flags.make

CMakeFiles/kgs.dir/keyGenServer.cc.o: CMakeFiles/kgs.dir/flags.make
CMakeFiles/kgs.dir/keyGenServer.cc.o: keyGenServer.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/misgana/src/urlShortner/keyGenService/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/kgs.dir/keyGenServer.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kgs.dir/keyGenServer.cc.o -c /home/misgana/src/urlShortner/keyGenService/keyGenServer.cc

CMakeFiles/kgs.dir/keyGenServer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kgs.dir/keyGenServer.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/misgana/src/urlShortner/keyGenService/keyGenServer.cc > CMakeFiles/kgs.dir/keyGenServer.cc.i

CMakeFiles/kgs.dir/keyGenServer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kgs.dir/keyGenServer.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/misgana/src/urlShortner/keyGenService/keyGenServer.cc -o CMakeFiles/kgs.dir/keyGenServer.cc.s

# Object files for target kgs
kgs_OBJECTS = \
"CMakeFiles/kgs.dir/keyGenServer.cc.o"

# External object files for target kgs
kgs_EXTERNAL_OBJECTS =

kgs: CMakeFiles/kgs.dir/keyGenServer.cc.o
kgs: CMakeFiles/kgs.dir/build.make
kgs: /usr/lib/x86_64-linux-gnu/libssl.so
kgs: /usr/lib/x86_64-linux-gnu/libcrypto.so
kgs: CMakeFiles/kgs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/misgana/src/urlShortner/keyGenService/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable kgs"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kgs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/kgs.dir/build: kgs

.PHONY : CMakeFiles/kgs.dir/build

CMakeFiles/kgs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kgs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kgs.dir/clean

CMakeFiles/kgs.dir/depend:
	cd /home/misgana/src/urlShortner/keyGenService && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/misgana/src/urlShortner/keyGenService /home/misgana/src/urlShortner/keyGenService /home/misgana/src/urlShortner/keyGenService /home/misgana/src/urlShortner/keyGenService /home/misgana/src/urlShortner/keyGenService/CMakeFiles/kgs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/kgs.dir/depend
