cmake_minimum_required(VERSION 3.12)
project(BOSCH)

# Set the path to the OpenCVConfig.cmake file
set(OpenCV_DIR "D:/OpenCV4.9.0/OpenCV-MinGW-Build")  # Replace with the actual path to your OpenCV build directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "D:/BOSCH")

include_directories(include)

# Find OpenCV
find_package(OpenCV REQUIRED)

# Add your source files and executable
add_executable(DetectObstacles DetectObstacles.cpp LinearAllocator.cpp)
add_executable(TestMemCv TestMemCv.cpp LinearAllocator.cpp)
add_executable(MemoryTest MemoryTest.cpp LinearAllocator.cpp)
# add_executable(LinearAllocator LinearAllocator.cpp)

# Link OpenCV libraries
target_link_libraries(DetectObstacles ${OpenCV_LIBS})
target_link_libraries(TestMemCv ${OpenCV_LIBS})
target_include_directories(DetectObstacles PRIVATE include)
# target_include_directories(TestMemCv PRIVATE include)
