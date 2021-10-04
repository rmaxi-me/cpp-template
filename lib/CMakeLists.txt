add_library(
        ${PROJECT_NAME} STATIC
        include/lib/ScopedProfiler.hpp src/ScopedProfiler.cpp
)

target_include_directories(${PROJECT_NAME} PRIVATE include/lib)
