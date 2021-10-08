add_library(
        ${PROJECT_NAME} STATIC
        src/ScopedProfiler.cpp include/lib/ScopedProfiler.hpp
)

target_include_directories(${PROJECT_NAME} PRIVATE include/lib)
