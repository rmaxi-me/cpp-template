add_executable(
        ${PROJECT_NAME}-cli
        include/Main.hpp src/Main.cpp
)
target_link_libraries(${PROJECT_NAME}-cli PUBLIC ${PROJECT_NAME})
target_include_directories(${PROJECT_NAME}-cli PRIVATE include/ ../lib/include)
