#include "LinearAllocator.h"
#include "Utils.h"
#include <iostream>

int main() {
    const std::size_t totalSize = 1024; // Set the total size of the allocator

    // Create an instance of LinearAllocator
    LinearAllocator allocator(totalSize);

    // Initialize the allocator with a specific address
    // void* memoryBlock = malloc(totalSize); // Allocate a memory block
    allocator.Init((void*)0x20219f92795);

    // Allocate memory using the LinearAllocator
    const std::size_t allocSize1 = 100;
    void* ptr1 = allocator.Allocate(allocSize1);

    if (ptr1 != nullptr) {
        std::cout << "Allocated memory block 1 at address: " << ptr1 << std::endl;

        // Use the allocated memory block 1 as needed

        // Allocate another memory block
        const std::size_t allocSize2 = 200;
        void* ptr2 = allocator.Allocate(allocSize2);

        if (ptr2 != nullptr) {
            std::cout << "Allocated memory block 2 at address: " << ptr2 << std::endl;

            // Use the allocated memory block 2 as needed

            // Reset the allocator to deallocate all memory
            allocator.Reset();

            std::cout << "Allocator reset. All memory deallocated." << std::endl;
        } else {
            std::cerr << "Failed to allocate memory block 2." << std::endl;
        }
    } else {
        std::cerr << "Failed to allocate memory block 1." << std::endl;
    }

    // Free the memory block allocated outside the allocator
    free((void*)0x20219f92795);

    return 0;
}
