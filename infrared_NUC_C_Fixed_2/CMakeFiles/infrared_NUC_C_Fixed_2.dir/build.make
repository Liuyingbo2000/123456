# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_SOURCE_DIR = /home/hhh/Downloads/infrared_NUC_C_Fixed_2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hhh/Downloads/infrared_NUC_C_Fixed_2

# Include any dependencies generated for this target.
include CMakeFiles/infrared_NUC_C_Fixed_2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/infrared_NUC_C_Fixed_2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make

CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o: main.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/main.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/main.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/main.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o: IRNUC.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/IRNUC.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/IRNUC.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/IRNUC.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o: SSN.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/SSN.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/SSN.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/SSN.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o: InitParam.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/InitParam.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/InitParam.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/InitParam.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o: utils.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/utils.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/utils.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/utils.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o: DeNoise.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNoise.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNoise.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNoise.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o: DeShading.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeShading.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeShading.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeShading.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o: DeFPN.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeFPN.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeFPN.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeFPN.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o: mat/mat.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/mat.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/mat.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/mat.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o: mat/matCalHist.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalHist.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalHist.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalHist.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o: mat/matCalMedCover.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalMedCover.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalMedCover.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalMedCover.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o: mat/matCalGaussian_f32.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_f32.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_f32.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_f32.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o: mat/matCal_s32.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCal_s32.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCal_s32.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCal_s32.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o: mat/matCalGaussian_s32.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_s32.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_s32.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_s32.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o: mat/matCal_s64.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCal_s64.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCal_s64.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCal_s64.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o: mat/matCalGaussian_s64.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_s64.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_s64.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/mat/matCalGaussian_s64.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o: DeStrip.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeStrip.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeStrip.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeStrip.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o: DeNU.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNU.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNU.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNU.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.s

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/flags.make
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o: DeNU_2.c
CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o: CMakeFiles/infrared_NUC_C_Fixed_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building C object CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o -MF CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o.d -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o -c /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNU_2.c

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNU_2.c > CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.i

CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hhh/Downloads/infrared_NUC_C_Fixed_2/DeNU_2.c -o CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.s

# Object files for target infrared_NUC_C_Fixed_2
infrared_NUC_C_Fixed_2_OBJECTS = \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o" \
"CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o"

# External object files for target infrared_NUC_C_Fixed_2
infrared_NUC_C_Fixed_2_EXTERNAL_OBJECTS =

infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/main.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/IRNUC.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/SSN.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/InitParam.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/utils.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNoise.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeShading.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeFPN.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/mat.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalHist.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalMedCover.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_f32.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s32.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s32.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCal_s64.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/mat/matCalGaussian_s64.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeStrip.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/DeNU_2.c.o
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/build.make
infrared_NUC_C_Fixed_2: CMakeFiles/infrared_NUC_C_Fixed_2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Linking C executable infrared_NUC_C_Fixed_2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/infrared_NUC_C_Fixed_2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/infrared_NUC_C_Fixed_2.dir/build: infrared_NUC_C_Fixed_2
.PHONY : CMakeFiles/infrared_NUC_C_Fixed_2.dir/build

CMakeFiles/infrared_NUC_C_Fixed_2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/infrared_NUC_C_Fixed_2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/infrared_NUC_C_Fixed_2.dir/clean

CMakeFiles/infrared_NUC_C_Fixed_2.dir/depend:
	cd /home/hhh/Downloads/infrared_NUC_C_Fixed_2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hhh/Downloads/infrared_NUC_C_Fixed_2 /home/hhh/Downloads/infrared_NUC_C_Fixed_2 /home/hhh/Downloads/infrared_NUC_C_Fixed_2 /home/hhh/Downloads/infrared_NUC_C_Fixed_2 /home/hhh/Downloads/infrared_NUC_C_Fixed_2/CMakeFiles/infrared_NUC_C_Fixed_2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/infrared_NUC_C_Fixed_2.dir/depend

