cmake_minimum_required(VERSION 3.12)
project(BOSCH)

# Set the path to the OpenCVConfig.cmake file
set(OpenCV_DIR "OpenCV/") 
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "../")

include_directories(include)

# Find OpenCV
find_package(OpenCV REQUIRED)

# Add your source files and executable
add_executable(DetectObstacles DetectObstacles.cpp LinearAllocator.cpp)

# Link OpenCV libraries
target_link_libraries(DetectObstacles ${OpenCV_LIBS})
target_include_directories(DetectObstacles PRIVATE include)
