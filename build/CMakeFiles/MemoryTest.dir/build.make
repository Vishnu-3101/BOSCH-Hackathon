# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.28

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = D:\CMake\bin\cmake.exe

# The command to remove a file.
RM = D:\CMake\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\BOSCH

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\BOSCH\build

# Include any dependencies generated for this target.
include CMakeFiles/MemoryTest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MemoryTest.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MemoryTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MemoryTest.dir/flags.make

CMakeFiles/MemoryTest.dir/MemoryTest.cpp.obj: CMakeFiles/MemoryTest.dir/flags.make
CMakeFiles/MemoryTest.dir/MemoryTest.cpp.obj: CMakeFiles/MemoryTest.dir/includes_CXX.rsp
CMakeFiles/MemoryTest.dir/MemoryTest.cpp.obj: D:/BOSCH/MemoryTest.cpp
CMakeFiles/MemoryTest.dir/MemoryTest.cpp.obj: CMakeFiles/MemoryTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\BOSCH\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MemoryTest.dir/MemoryTest.cpp.obj"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MemoryTest.dir/MemoryTest.cpp.obj -MF CMakeFiles\MemoryTest.dir\MemoryTest.cpp.obj.d -o CMakeFiles\MemoryTest.dir\MemoryTest.cpp.obj -c D:\BOSCH\MemoryTest.cpp

CMakeFiles/MemoryTest.dir/MemoryTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MemoryTest.dir/MemoryTest.cpp.i"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\BOSCH\MemoryTest.cpp > CMakeFiles\MemoryTest.dir\MemoryTest.cpp.i

CMakeFiles/MemoryTest.dir/MemoryTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MemoryTest.dir/MemoryTest.cpp.s"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\BOSCH\MemoryTest.cpp -o CMakeFiles\MemoryTest.dir\MemoryTest.cpp.s

CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.obj: CMakeFiles/MemoryTest.dir/flags.make
CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.obj: CMakeFiles/MemoryTest.dir/includes_CXX.rsp
CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.obj: D:/BOSCH/LinearAllocator.cpp
CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.obj: CMakeFiles/MemoryTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\BOSCH\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.obj"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.obj -MF CMakeFiles\MemoryTest.dir\LinearAllocator.cpp.obj.d -o CMakeFiles\MemoryTest.dir\LinearAllocator.cpp.obj -c D:\BOSCH\LinearAllocator.cpp

CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.i"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\BOSCH\LinearAllocator.cpp > CMakeFiles\MemoryTest.dir\LinearAllocator.cpp.i

CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.s"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\BOSCH\LinearAllocator.cpp -o CMakeFiles\MemoryTest.dir\LinearAllocator.cpp.s

# Object files for target MemoryTest
MemoryTest_OBJECTS = \
"CMakeFiles/MemoryTest.dir/MemoryTest.cpp.obj" \
"CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.obj"

# External object files for target MemoryTest
MemoryTest_EXTERNAL_OBJECTS =

D:/BOSCH/MemoryTest.exe: CMakeFiles/MemoryTest.dir/MemoryTest.cpp.obj
D:/BOSCH/MemoryTest.exe: CMakeFiles/MemoryTest.dir/LinearAllocator.cpp.obj
D:/BOSCH/MemoryTest.exe: CMakeFiles/MemoryTest.dir/build.make
D:/BOSCH/MemoryTest.exe: CMakeFiles/MemoryTest.dir/linkLibs.rsp
D:/BOSCH/MemoryTest.exe: CMakeFiles/MemoryTest.dir/objects1.rsp
D:/BOSCH/MemoryTest.exe: CMakeFiles/MemoryTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=D:\BOSCH\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable D:\BOSCH\MemoryTest.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\MemoryTest.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MemoryTest.dir/build: D:/BOSCH/MemoryTest.exe
.PHONY : CMakeFiles/MemoryTest.dir/build

CMakeFiles/MemoryTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\MemoryTest.dir\cmake_clean.cmake
.PHONY : CMakeFiles/MemoryTest.dir/clean

CMakeFiles/MemoryTest.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\BOSCH D:\BOSCH D:\BOSCH\build D:\BOSCH\build D:\BOSCH\build\CMakeFiles\MemoryTest.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/MemoryTest.dir/depend
