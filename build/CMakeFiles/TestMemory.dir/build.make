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
include CMakeFiles/TestMemory.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TestMemory.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TestMemory.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TestMemory.dir/flags.make

CMakeFiles/TestMemory.dir/TestMemory.cpp.obj: CMakeFiles/TestMemory.dir/flags.make
CMakeFiles/TestMemory.dir/TestMemory.cpp.obj: CMakeFiles/TestMemory.dir/includes_CXX.rsp
CMakeFiles/TestMemory.dir/TestMemory.cpp.obj: D:/BOSCH/TestMemory.cpp
CMakeFiles/TestMemory.dir/TestMemory.cpp.obj: CMakeFiles/TestMemory.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\BOSCH\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TestMemory.dir/TestMemory.cpp.obj"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TestMemory.dir/TestMemory.cpp.obj -MF CMakeFiles\TestMemory.dir\TestMemory.cpp.obj.d -o CMakeFiles\TestMemory.dir\TestMemory.cpp.obj -c D:\BOSCH\TestMemory.cpp

CMakeFiles/TestMemory.dir/TestMemory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TestMemory.dir/TestMemory.cpp.i"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\BOSCH\TestMemory.cpp > CMakeFiles\TestMemory.dir\TestMemory.cpp.i

CMakeFiles/TestMemory.dir/TestMemory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TestMemory.dir/TestMemory.cpp.s"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\BOSCH\TestMemory.cpp -o CMakeFiles\TestMemory.dir\TestMemory.cpp.s

CMakeFiles/TestMemory.dir/LinearAllocator.cpp.obj: CMakeFiles/TestMemory.dir/flags.make
CMakeFiles/TestMemory.dir/LinearAllocator.cpp.obj: CMakeFiles/TestMemory.dir/includes_CXX.rsp
CMakeFiles/TestMemory.dir/LinearAllocator.cpp.obj: D:/BOSCH/LinearAllocator.cpp
CMakeFiles/TestMemory.dir/LinearAllocator.cpp.obj: CMakeFiles/TestMemory.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\BOSCH\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/TestMemory.dir/LinearAllocator.cpp.obj"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TestMemory.dir/LinearAllocator.cpp.obj -MF CMakeFiles\TestMemory.dir\LinearAllocator.cpp.obj.d -o CMakeFiles\TestMemory.dir\LinearAllocator.cpp.obj -c D:\BOSCH\LinearAllocator.cpp

CMakeFiles/TestMemory.dir/LinearAllocator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TestMemory.dir/LinearAllocator.cpp.i"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\BOSCH\LinearAllocator.cpp > CMakeFiles\TestMemory.dir\LinearAllocator.cpp.i

CMakeFiles/TestMemory.dir/LinearAllocator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TestMemory.dir/LinearAllocator.cpp.s"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\BOSCH\LinearAllocator.cpp -o CMakeFiles\TestMemory.dir\LinearAllocator.cpp.s

# Object files for target TestMemory
TestMemory_OBJECTS = \
"CMakeFiles/TestMemory.dir/TestMemory.cpp.obj" \
"CMakeFiles/TestMemory.dir/LinearAllocator.cpp.obj"

# External object files for target TestMemory
TestMemory_EXTERNAL_OBJECTS =

D:/BOSCH/TestMemory.exe: CMakeFiles/TestMemory.dir/TestMemory.cpp.obj
D:/BOSCH/TestMemory.exe: CMakeFiles/TestMemory.dir/LinearAllocator.cpp.obj
D:/BOSCH/TestMemory.exe: CMakeFiles/TestMemory.dir/build.make
D:/BOSCH/TestMemory.exe: CMakeFiles/TestMemory.dir/linkLibs.rsp
D:/BOSCH/TestMemory.exe: CMakeFiles/TestMemory.dir/objects1.rsp
D:/BOSCH/TestMemory.exe: CMakeFiles/TestMemory.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=D:\BOSCH\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable D:\BOSCH\TestMemory.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\TestMemory.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TestMemory.dir/build: D:/BOSCH/TestMemory.exe
.PHONY : CMakeFiles/TestMemory.dir/build

CMakeFiles/TestMemory.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\TestMemory.dir\cmake_clean.cmake
.PHONY : CMakeFiles/TestMemory.dir/clean

CMakeFiles/TestMemory.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\BOSCH D:\BOSCH D:\BOSCH\build D:\BOSCH\build D:\BOSCH\build\CMakeFiles\TestMemory.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/TestMemory.dir/depend
