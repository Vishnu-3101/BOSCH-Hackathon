#include "LinearAllocator.h"
#include "Utils.h"  // CalculatePadding 
#include <stdlib.h>     // malloc and free
#include <cassert>   // assert
#include <algorithm>    // max
#ifdef _DEBUG
#include <iostream>
#endif

LinearAllocator::LinearAllocator(const std::size_t totalSize)
: Allocator(totalSize) {
}

void LinearAllocator::Init(void *addr) {
    // Free the memory in the specified address if present
    if (m_start_ptr != nullptr) {
        free(m_start_ptr);
    }
    m_start_ptr = addr;
    m_offset = 0;
}

LinearAllocator::~LinearAllocator() {
    free(m_start_ptr);
    m_start_ptr = nullptr;
}

void* LinearAllocator::Allocate(const std::size_t size, const std::size_t alignment) {
    std::size_t padding = 0;
    std::size_t paddedAddress = 0;

    // Get the current address within the linear memory pool
    const std::size_t currentAddress = (std::size_t)m_start_ptr + m_offset;

    if (alignment != 0 && m_offset % alignment != 0) {
        // Alignment is required. Find the next aligned memory address and update offset
        padding = Utils::CalculatePadding(currentAddress, alignment);
    }

    // Check if there is enough space in the linear memory pool for the allocation
    if (m_offset + padding + size > m_totalSize) {
        return nullptr;
    }

    // Update the offset to include padding
    m_offset += padding;

    // Calculate the next aligned memory address after considering padding
    const std::size_t nextAddress = currentAddress + padding;

    // Update the offset to include the allocated block
    m_offset += size;

#ifdef _DEBUG
    // Debug information (optional)
    std::cout << "A" << "\t@C " << (void*) currentAddress << "\t@R " << (void*) nextAddress << "\tO " << m_offset << "\tP " << padding << std::endl;
#endif

    // Update tracking information (used and peak memory)
    m_used = m_offset;
    m_peak = std::max(m_peak, m_used);

    return (void*) nextAddress;
}

void LinearAllocator::Free(void* ptr) {
    assert(false && "Use Reset() method");
}

void LinearAllocator::Reset() {
    m_offset = 0;
    m_used = 0;
    m_peak = 0;
}