add_executable(
        ${PROJECT_NAME}-cli
        src/Main.cpp include/Main.hpp
)
target_link_libraries(${PROJECT_NAME}-cli PUBLIC ${PROJECT_NAME})
target_include_directories(${PROJECT_NAME}-cli PRIVATE include/ ../lib/include)
