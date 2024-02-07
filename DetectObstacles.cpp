#include <opencv2/opencv.hpp>
#include <iostream>
#include <cstring>
using namespace std;



int main(int argc, char** argv) {
    cout<<"Hello"<<endl;
    if (argc != 3) {
        std::cerr << "Usage: " << argv[0] << " <video_file_path> <memory_address> <executable_name>" << std::endl;
        return -1;
    }

    // Read the video file
    cv::VideoCapture cap(argv[1]);

    if (!cap.isOpened()) {
        std::cerr << "Error opening video file: " << argv[1] << std::endl;
        return -1;
    }

    // Use the provided memory address
    std::string memoryAddress(argv[2]);

    // Create a custom memory manager instance
    cv::Mat frame, gray, prevFrame;
    cap >> prevFrame;
    cv::resize(prevFrame,prevFrame,cv::Size(640,480));
    while (cap.read(frame)) {
        cout<<"yes"<<endl;
        cv::resize(frame,frame,cv::Size(640,480));
        // Convert frames to grayscale
        cv::cvtColor(frame, gray, cv::COLOR_BGR2GRAY);
        cv::resize(prevFrame, prevFrame, cv::Size(640,480));
        // Compute absolute difference between frames
        cv::Mat diff;
        if(gray.type()==prevFrame.type()){ 
            cv::absdiff(prevFrame, gray, diff);
        }

        // Apply threshold to get binary image
        cv::threshold(diff, diff, 30, 255, cv::THRESH_BINARY);

        // // Find contours in the binary image
        std::vector<std::vector<cv::Point>> contours;
        cv::findContours(diff, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

        // // Draw bounding boxes around detected objects
        for (const auto& contour : contours) {
            cv::Rect boundingBox = cv::boundingRect(contour);
            cv::rectangle(frame, boundingBox, cv::Scalar(0, 255, 0), 2);
        }
        if(gray.type()==prevFrame.type()){ 
            cv::imshow("Object Detection", diff);
        }
        // Display the result
        // cv::imshow("Object Detection", frame);

        // Exit when the 'ESC' key is pressed
        if (cv::waitKey(30) == 27)
            break;

        // Update the previous frame
        prevFrame = gray.clone();
    }


    // int storedValue = memoryManager.getMemoryValue();
    // cout << "Stored Value in Custom Memory: " << memoryManager.getMemoryValue() << endl;
    // Release the video capture object
    cap.release();

    cv::destroyAllWindows();

    // Retrieve the stored value from custom memory and print it

    return 0;
}
