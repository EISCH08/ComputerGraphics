# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.14.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.14.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build

# Include any dependencies generated for this target.
include CMakeFiles/part3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/part3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/part3.dir/flags.make

CMakeFiles/part3.dir/src/part3.cpp.o: CMakeFiles/part3.dir/flags.make
CMakeFiles/part3.dir/src/part3.cpp.o: ../src/part3.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/part3.dir/src/part3.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/part3.dir/src/part3.cpp.o -c /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/src/part3.cpp

CMakeFiles/part3.dir/src/part3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/part3.dir/src/part3.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/src/part3.cpp > CMakeFiles/part3.dir/src/part3.cpp.i

CMakeFiles/part3.dir/src/part3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/part3.dir/src/part3.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/src/part3.cpp -o CMakeFiles/part3.dir/src/part3.cpp.s

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.o: CMakeFiles/part3.dir/flags.make
CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.o: /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.o   -c /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c > CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.i

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.s

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.o: CMakeFiles/part3.dir/flags.make
CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.o: /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.o -c /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp > CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.i

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.s

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.o: CMakeFiles/part3.dir/flags.make
CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.o: /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.o -c /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp > CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.i

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.s

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.o: CMakeFiles/part3.dir/flags.make
CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.o: /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.o -c /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp > CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.i

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.s

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.o: CMakeFiles/part3.dir/flags.make
CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.o: /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.o -c /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp > CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.i

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.s

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.o: CMakeFiles/part3.dir/flags.make
CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.o: /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.o -c /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp > CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.i

CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp -o CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.s

# Object files for target part3
part3_OBJECTS = \
"CMakeFiles/part3.dir/src/part3.cpp.o" \
"CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.o" \
"CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.o" \
"CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.o" \
"CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.o" \
"CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.o" \
"CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.o"

# External object files for target part3
part3_EXTERNAL_OBJECTS =

part3: CMakeFiles/part3.dir/src/part3.cpp.o
part3: CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/glew/src/glew.c.o
part3: CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/lodepng/lodepng.cpp.o
part3: CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui.cpp.o
part3: CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_demo.cpp.o
part3: CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_draw.cpp.o
part3: CMakeFiles/part3.dir/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/external/imgui/imgui_impl_glfw_gl3.cpp.o
part3: CMakeFiles/part3.dir/build.make
part3: glfw/src/libglfw3.a
part3: CMakeFiles/part3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX executable part3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/part3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/part3.dir/build: part3

.PHONY : CMakeFiles/part3.dir/build

CMakeFiles/part3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/part3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/part3.dir/clean

CMakeFiles/part3.dir/depend:
	cd /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3 /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3 /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build /Users/parkereischen/Documents/GitHub/ComputerGraphics/assignment1/part3/build/CMakeFiles/part3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/part3.dir/depend
