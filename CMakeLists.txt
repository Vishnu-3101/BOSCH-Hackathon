cmake_minimum_required(VERSION 3.12)
project(BOSCH)

# Set the path to the OpenCVConfig.cmake file
set(OpenCV_DIR "D:/OpenCV4.9.0/OpenCV-MinGW-Build")  # Replace with the actual path to your OpenCV build directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "D:/BOSCH")

# Find OpenCV
find_package(OpenCV REQUIRED)

# Add your source files and executable
add_executable(DetectObstacles DetectObstacles.cpp)

# Link OpenCV libraries
target_link_libraries(DetectObstacles ${OpenCV_LIBS})
