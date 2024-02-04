# Object Detection with Custom Memory Management

## Overview

This project demonstrates object detection in a video using OpenCV with the added feature of storing computed values in custom memory. The program reads a video file, detects objects using contour analysis, draws bounding boxes around the detected objects, and displays the result in real-time. Additionally, it uses custom memory management to store the computed area of each bounding box in a specified memory address.

## Features

- **Object Detection:** Utilizes OpenCV to perform object detection based on contour analysis in a video stream.
  
- **Bounding Box Drawing:** Draws bounding boxes around the detected objects in the video frames.

- **Real-time Display:** Displays the processed video frames in real-time using OpenCV.

- **Custom Memory Management:** Implements a custom memory manager to store the area of detected bounding boxes in a specified memory address.

## Usage

1. **Build the Project:**<br/>
   - Use CMake to configure and build the project.
    ```bash
    cmake -G "MinGW Makefiles" -S . -B build
    cmake --build build

2. **Run the Project:**<br/>
   ```bash
   ./executable_name.exe path/to/video.mp4 memory_address
