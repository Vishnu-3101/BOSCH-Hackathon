#include <opencv2/opencv.hpp>
#include <iostream>
#include <cstring>
#include <malloc.h>
#include "LinearAllocator.h"
#include "Utils.h"
#include <Windows.h>

// Libraries for linux
// #include <cstdlib>
// #include <unistd.h>
// #include <sys/mman.h>

// Uncomment these two lines to not specify std:: or cv::
// using namespace std;
// using namespace cv;


int main(int argc, char** argv) {
    std::cout<<"Program Execution started......."<<std::endl;
    if (argc != 3) {
        std::cerr << "Usage: " << argv[0] << " <video_file_path> <memory_address> <executable_name>" << std::endl;
        return -1;
    }
    cv::VideoCapture cap(argv[1]);

    
    // Read the video file
    if (!cap.isOpened()) {
        std::cerr << "Error opening video file: " << argv[1] << std::endl;
        return -1;
    }

    int frameWidth = 640;
    int frameHeight = 480;
    double fps = cap.get(cv::CAP_PROP_FPS);
    
    int fourcc = cv::VideoWriter::fourcc('M', 'J', 'P', 'G'); 
    cv::VideoWriter videoWriter("output.avi", fourcc, fps, cv::Size(frameWidth, frameHeight),true);

    cv::Mat frame, gray, prevFrame;

    cap >> prevFrame;
    cv::resize(prevFrame,prevFrame,cv::Size(640,480));
    cv::cvtColor(prevFrame, prevFrame, cv::COLOR_BGR2GRAY);

    void* startAddress;
    sscanf(argv[2], "%p", &startAddress);

    // cout<<"Size of frame: "<<sizeof(prevFrame)<<endl;
    const std::size_t totalSize = 640 * 480 * 3 * 5; 

    startAddress = VirtualAlloc(startAddress, totalSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (startAddress == nullptr) {
        std::cerr << "Error allocating memory at a specific address" << std::endl;
        return -1;
    }

    // Code to allocate memory in LINUX

    // if (mmap(startAddress, totalSize, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS, -1, 0) == MAP_FAILED) {
    //     std::cerr << "Error allocating memory at a specific address" << std::endl;
    //     return -1;
    // }


    // Initialize the linear allocator with desired size

    LinearAllocator allocator(totalSize);
    allocator.Init(startAddress);
    const std::size_t frameSize = 640 * 480;

    void* pre_ptr = allocator.Allocate(frameSize);
    
    std::memcpy(pre_ptr, prevFrame.data, frameSize);
    std::cout<<"Memory allocation started from address: "<<pre_ptr<<std::endl;


    while (cap.read(frame)) {
        cv::resize(frame,frame,cv::Size(640,480)); 
        void* frm_ptr = allocator.Allocate(frameSize);
        std::memcpy(frm_ptr, frame.data, frameSize); 

        cv::cvtColor(frame, gray, cv::COLOR_BGR2GRAY);
        void* gray_ptr = allocator.Allocate(frameSize);
        std::memcpy(gray_ptr, gray.data, frameSize);

        
        // Compute absolute difference between frames
        cv::Mat diff;
        
        cv::absdiff(prevFrame, gray, diff);   
        void* diff_ptr = allocator.Allocate(frameSize);  
        std::memcpy(diff_ptr, diff.data, frameSize);  

        // Apply threshold to get binary image
        cv::threshold(diff, diff, 30, 255, cv::THRESH_BINARY);

        // // Find contours in the binary image
        void* contours_ptr = allocator.Allocate(sizeof(std::vector<std::vector<cv::Point>>));
        std::vector<std::vector<cv::Point>>* contoursVector = new (contours_ptr) std::vector<std::vector<cv::Point>>();
        cv::findContours(diff, *contoursVector, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

        cv::drawContours(frame, *contoursVector, -1, cv::Scalar(0, 255, 0), 2);

        // Uncomment the below code to draw bounding boxes around the dynamic obstacle

        // for (const auto& contour : contours) {
        //     cv::Rect boundingBox = cv::boundingRect(contour);
        //     cv::rectangle(frame, boundingBox, cv::Scalar(0, 255, 0), 2);
        // }


        videoWriter.write(frame);
        cv::imshow("Object Detection", frame);

        // Exit when the 'ESC' key is pressed
        if (cv::waitKey(30) == 27)
            break;

        // Update the previous frame to gray frame
        prevFrame = gray.clone();

        // Reset the memory address to the start address. See LinearAllocator.cpp file for clarity
        allocator.Reset();
        std::cout<<"Memory allocation reset to start address: "<<pre_ptr<<std::endl;

        // Allocate memory to store the new previous frame at start address
        pre_ptr = allocator.Allocate(frameSize);
        std::memcpy(pre_ptr, prevFrame.data, frameSize);
           
        std::cout<<"-------------"<<std::endl;
    }
    
    // Free all the allocated memory if not freed by memory allocator.
    allocator.Reset();
    free(startAddress);

    cap.release();
    cv::destroyAllWindows();

    return 0;
}
