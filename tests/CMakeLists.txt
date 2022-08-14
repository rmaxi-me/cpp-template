find_package(googletest QUIET)
include(FetchContent)
FetchContent_Declare(googletest URL https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)
enable_testing()

add_executable(
        ${PROJECT_NAME}-tests
        src/tests.cpp
)
target_compile_options(${PROJECT_NAME}-tests PRIVATE ${PROJECT_WARNINGS})
target_link_libraries(${PROJECT_NAME}-tests gtest_main)  # template: add your app/lib here
target_include_directories(${PROJECT_NAME}-tests PRIVATE include/)  # template: add your app/lib here

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}-tests PROPERTIES TIMEOUT 600 WORKING_DIRECTORY ${PROJECT_BINARY_DIR})
