#include <opencv2/opencv.hpp>
#include <iostream>
#include <cstring>
#include "LinearAllocator.h"
#include "Utils.h"
using namespace std;



int main(int argc, char** argv) {
    cout<<"Hello"<<endl;
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
    // cout<<"Size of frame: "<<sizeof(prevFrame)<<endl;
    const std::size_t totalSize = 640 * 480 * 3 * 5; // Assuming frames are 3 channels (BGR) and storing two frames
    void* startAddress = malloc(totalSize);

    LinearAllocator allocator(totalSize);
    allocator.Init(startAddress);
    const std::size_t frameSize = 640 * 480;

    void* pre_ptr = allocator.Allocate(frameSize);
    
    std::memcpy(pre_ptr, prevFrame.data, frameSize);

    while (cap.read(frame)) {
        cv::resize(frame,frame,cv::Size(640,480)); 
        void* frm_ptr = allocator.Allocate(frameSize);
        std::memcpy(frm_ptr, frame.data, frameSize); 
        std::cout<<frm_ptr<<std::endl; 

        cv::cvtColor(frame, gray, cv::COLOR_BGR2GRAY);
        void* gray_ptr = allocator.Allocate(frameSize);
        std::memcpy(gray_ptr, gray.data, frameSize);
        std::cout<<gray_ptr<<std::endl;
        // cv::resize(prevFrame, prevFrame, cv::Size(640,480));
        // Compute absolute difference between frames
        cv::Mat diff;
        
        cv::absdiff(prevFrame, gray, diff);   
        void* diff_ptr = allocator.Allocate(frameSize);  
        std::memcpy(diff_ptr, diff.data, frameSize);  
        std::cout<<diff_ptr<<std::endl;

        // Apply threshold to get binary image
        cv::threshold(diff, diff, 30, 255, cv::THRESH_BINARY);

        // // Find contours in the binary image
        std::vector<std::vector<cv::Point>> contours;
        cv::findContours(diff, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

        cv::drawContours(frame, contours, -1, cv::Scalar(0, 255, 0), 2);

        // // Draw bounding boxes around detected objects
        // for (const auto& contour : contours) {
        //     cv::Rect boundingBox = cv::boundingRect(contour);
        //     cv::rectangle(frame, boundingBox, cv::Scalar(0, 255, 0), 2);
        // }

        cv::imshow("Object Detection", frame);

        // Exit when the 'ESC' key is pressed
        if (cv::waitKey(30) == 27)
            break;

        // Update the previous frame
        prevFrame = gray.clone();
        allocator.Reset();
        pre_ptr = allocator.Allocate(frameSize);
        std::memcpy(pre_ptr, prevFrame.data, frameSize);
        std::cout<<pre_ptr<<std::endl;
        
        cout<<"-------------"<<endl;
    }


    // int storedValue = memoryManager.getMemoryValue();
    // cout << "Stored Value in Custom Memory: " << memoryManager.getMemoryValue() << endl;
    // Release the video capture object
    cap.release();

    cv::destroyAllWindows();

    // Retrieve the stored value from custom memory and print it

    return 0;
}
