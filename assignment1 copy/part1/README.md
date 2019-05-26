Computer Graphics, Assignment 1, Part 1
=======================================


Build instructions for Linux
============================

Dependencies
------------
gcc/g++, CMake 2.8 (or higher), make, OpenGL

These dependencies can be installed via the package manager of your
Linux distribution.

CMake might complain if the additional libraries Xi, Xmu, Xrandr, Xcursor, and
Xinemrama are not installed. On, e.g., Ubuntu 14.04, you can install these
libraries with the command

  sudo apt-get install libxmu-dev libxi-dev libxrandr-dev libxcursor-dev libxinerama-dev

GLEW and GLFW will be built on-the-fly when you build the assignment
program.

Environment variables
---------------------
The environment variable ASSIGNMENT1_ROOT must be set pointing to the
extracted assignment1 directory. Example:

  export ASSIGNMENT1_ROOT=$HOME/assignment1

Building and running the program for Part 1
-------------------------------------------
To build the program, open a terminal, navigate to
$ASSIGNMENT1_ROOT/part1 and type

  mkdir build
  cd build
  cmake ../
  make

To run the program, navigate to the resulting executable (part1), and
type

  ./part1

Alternatively, run the attached script build.sh (which will perform
all these steps for you):

  ./build.sh

Note: You don't have to run CMake every time you change something in
the source files. Just use the generated makefile (or the build.sh
script) to rebuild the program.


Build instructions for Windows
==============================

Dependencies
------------
Visual Studio 20XX, CMake GUI 2.8 (or higher)

Environment variables
---------------------
Define a user environment variable ASSIGNMENT1_ROOT that points to the
extracted assignment1 directory. On the lab computers, which run
Windows 7, you can change environment variables by opening the start
menu and searching for `Edit environment variables for your account`.

Building and running the program
--------------------------------
1. Before you start CMake or do anything else, set the
   ASSIGNMENT1_ROOT variable as described above.
2. Start CMake GUI.
3. Put the search path YOUR_PATH_TO_ASSIGNMENT1\part1 in the
   "Where is the source code:" text box.
4. Create a subdirectory YOUR_PATH_TO_ASSIGNMENT1\part1\build, and
   put the search path to this directory in the "Where to build the
   binaries:" text box.
5. Press the "Configure" button and choose the compiler
   (Visual Studio XX 20XX Win64).
6. Press the "Configure" button again.
7. Press the "Generate" button to generate Visual Studio project
   files.
8. Close CMake GUI.
9. Navigate to the YOUR_PATH_TO_ASSIGNMENT1\part1\build directory and
   open the part1.sln file in Visual Studio.
10. Right-click on the Part1 project and choose Set as StartUp Project
11. Press F5 to compile and run the program. The resulting executable
   (part1.exe) will be placed in
   YOUR_PATH_TO_ASSIGNMENT1\part1\build\Debug

Note 1: Just to clarify, YOUR_PATH_TO_ASSIGNMENT1 should be replaced
with a real path that points to the extracted assignment1 folder.
CMake cannot expand environment variables in the text boxes, so you
need to specify the path explicitly.

Note 2: Every time you change the ASSIGNMENT1_ROOT variable you have
to close all open command prompts and restart CMake (since CMake will
not reload the values of environment variables automatically). In rare
cases, it might be necessary to reboot the system to update the
environment variable.

Note 3: CMake seems to have problem handling paths that contains
non-ASCII (international) characters. Assuming that you don't want to
change your language settings, a simple fix is to move the assignment3
folder to a folder that only has ASCII symbols in its path.

Note 4: If the GLSL shader files (*.vert and *.frag) are not visible
in the solution file tree, open them via the file manager (or drag and
drop them into the Visual Studio window.)


Build instructions for OS X (experimental)
==========================================

Should be roughly the same procedure as for Linux. You can install and
use CMake to generate Unix makefiles or XCode solutions.

If you cannot get CMake working, try to set up an XCode project
manually. The part1.cpp and part2.cpp files shows you which files and
dependencies you need.

Since none of us TAs are Mac users or have access to a Mac, we will
only provide limited support for this platform.
