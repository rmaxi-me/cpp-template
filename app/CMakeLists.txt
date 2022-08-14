add_executable(
        ${PROJECT_NAME}-app
        src/Main.cpp include/Main.hpp
)
target_link_libraries(${PROJECT_NAME}-app PUBLIC cpp-utils)
target_include_directories(${PROJECT_NAME}-app PRIVATE include/)
target_include_directories(${PROJECT_NAME}-app SYSTEM PRIVATE ../lib/cpp-utils/utils/include)
