#include <opencv2/opencv.hpp>
#include <iostream>
using namespace std;

int main(int argc, char** argv) {
    std::cout << "Code Started" << std::endl;

    if (argc != 3) {
        std::cerr << "Usage: " << argv[0] << " <video_file_path> <memory_address> <executable_name>" << std::endl;
        return -1;
    }

    cv::VideoCapture cap(argv[1]);

    // if (!cap.isOpened()) {
    //     std::cerr << "Error opening video file: " << "D:/BOSCH/VISHNU.mp4" << std::endl;
    //     return -1;
    // }
    cout<<"cap opened"<<endl;
    cv::Mat frame, gray, prevFrame;
    cap >> prevFrame;
    cv::resize(prevFrame,prevFrame,cv::Size(640,480));
    // prevFrame.convertTo(prevFrame, CV_8U);

    std::string memoryAddress(argv[2]);
    cout<<&prevFrame<<endl;
    while (cap.read(frame)) {
        cv::resize(frame,frame,cv::Size(640,480));
        // Convert frames to grayscale
        cv::cvtColor(frame, gray, cv::COLOR_BGR2GRAY);

            // Resize prevFrame to match the size of gray
        cv::resize(prevFrame, prevFrame, cv::Size(640,480));
        // gray.convertTo(gray, CV_8U);

        std::cout << "prevFrame size: " << prevFrame.size() << " type: " << prevFrame.type() << std::endl;
        std::cout << "gray size: " << gray.size() << " type: " << gray.type() << std::endl;

        // Compute absolute difference between frames
        cv::Mat diff;

        if(gray.type()==prevFrame.type()){ 
            cv::absdiff(prevFrame, gray, diff);
        }
        

        // Apply threshold to get binary image
        cv::threshold(diff, diff, 30, 255, cv::THRESH_BINARY);

        // Find contours in the binary image
        std::vector<std::vector<cv::Point>> contours;
        cv::findContours(diff, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

        // Draw bounding boxes around detected objects
        for (const auto& contour : contours) {
            cv::Rect boundingBox = cv::boundingRect(contour);
            cv::rectangle(frame, boundingBox, cv::Scalar(0, 255, 0), 2);
        }

        // Display the result
        cv::imshow("Object Detection", frame);

        // Exit when the 'ESC' key is pressed
        if (cv::waitKey(30) == 27)
            break;

        // Update the previous frame
        prevFrame = gray.clone();
    }

    // Release the video capture object
    cap.release();

    cv::destroyAllWindows();

    return 0;
}
